class VagrantHelper
  def initialize(vagrant, prov_path, config_path, vault_path, project_path)
    # Instance variables
    @vagrant = vagrant
    @prov_path = prov_path
    @config_path = config_path
    @vault_path = vault_path
    @project_path = project_path
    @home_path = "/home/vagrant"
  end


  def run(name, path, args=[])
    @vagrant.vm.provision name, type:"shell", path: path, args: args, env:{"HOME" => @home_path}
  end

  def copy(src, dst)
    if (File.exist?("C:/#{src}"))
      @vagrant.vm.provision "file", source: src, destination: dst
    else
      puts "Could not find a file named: #{src} to copy to guest"
    end
  end

  def copy_config(mod_name, path)
    copy("#{@config_path}/#{mod_name}/#{path}","#{@home_path}/configs/#{mod_name}/#{path}")
  end

  def run_script(mod_name, path, args=[])
    run("#{mod_name}/#{path}", "#{@prov_path}/#{mod_name}/#{path}",args)
  end

  def copy_script(mod_name, path)
    dest = "#{@home_path}/scripts/#{mod_name}/#{path}"
    copy("#{@prov_path}/#{mod_name}/#{path}",dest)
    @vagrant.vm.provision path, type:"shell", inline: "chmod -R +x #{dest}"
  end

  def copy_vault(mod_name, path)
    copy("#{@vault_path}/#{mod_name}/#{path}","#{@home_path}/vault/#{mod_name}/#{path}")
  end

  def vm()
    return @vagrant.vm
  end

  def vb()
    return @vagrant.vm.provider "virtualbox"
  end

end

def pre_install(helper)
  modname="common"
  helper.run_script("common","pre_install.sh")
end

def post_install(helper)
  modname="common"
  helper.run_script("common","post_install.sh")
end
