class VagrantHelper
  def initialize(vagrant, prov_path, config_path, vault_path, project_path)
    # Instance variables
    @vagrant = vagrant
    @prov_path = prov_path
    @config_path = config_path
    @vault_path = vault_path
    @project_path = project_path
    @home_path = "/home/vagrant"
    @provider_callbacks = []
    @vagrant.vm.provider "virtualbox" do |vb|
      @provider_callbacks.each do |cb|
        cb.call(vb)
      end
    end
  end


  def run(name, path, args=[])
    @vagrant.vm.provision name, type:"shell", path: path, args: args, env:{"HOME" => @home_path}
  end

  def copy(src, dst)
    if (File.exist?(src))
      @vagrant.vm.provision "file", source: src, destination: dst
    else
      puts "Could not find a file named: #{src} to copy to guest"
    end
  end

  def copy_config(mod_name, path)
    src="#{@config_path}/#{mod_name}/#{path}"
    dest = "#{@home_path}/configs/#{mod_name}/#{path}"
    if path=="/" or path==""
      dest = "#{@home_path}/configs/"
    end
    copy(src,dest)
  end

  def run_script(mod_name, path, args=[])
    run("#{mod_name}/#{path}", "#{@prov_path}/#{mod_name}/#{path}",args)
  end

  def copy_vault(mod_name, path)
    src="#{@vault_path}/#{mod_name}/#{path}"
    dest = "#{@home_path}/vault/#{mod_name}/#{path}"
    if path=="/" or path==""
      dest = "#{@home_path}/vault/"
    end
    copy(src,dest)
  end

  def vm()
    return @vagrant.vm
  end

  def vb(&cb)
    @provider_callbacks.push(cb)
  end

  def sync_dir(src,name)
    src_windows = "C\:#{src}".gsub(/\//,'/')
    @vagrant.vm.synced_folder src_windows, "/#{name}", automount:true

    '''
    vb do |vbox|
      vbox.customize ["sharedfolder","add", :id, "--name", "project", "--hostpath", src_windows, "--automount"]
    end
    '''
  end
  def mount_project_dir()
    require 'fileutils'
    FileUtils.mkdir_p @project_path
    sync_dir(@project_path,"project")
  end
end

def pre_install(helper)
  modname="common"
  helper.run_script("common","pre_install.sh")
  helper.mount_project_dir()
end

def post_install(helper)
  modname="common"
  helper.run_script("common","post_install.sh")
end
