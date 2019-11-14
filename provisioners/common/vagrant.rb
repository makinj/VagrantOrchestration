class VagrantHelper
  def initialize(vagrant, project_name)
    @vagrant = vagrant

    @orch_path = ENV['VagrantOrchestration']
    @config_path = ENV['VagrantConfigs']
    @vault_path = ENV['VagrantVault']
    @workspace_path = ENV['VagrantWorkspace']
    @prov_path ="#{@orch_path}/provisioners"

    @project_path = "#{@workspace_path}/#{@project_name}"

    @home_path = "/home/vagrant"

    @provider_callbacks = []
    @vagrant.vm.provider "virtualbox" do |vb|
      @provider_callbacks.each do |cb|
        cb.call(vb)
      end
    end
  end


  def run(name, path, args=[])
    @vagrant.vm.provision name, privileged: false, type:"shell", path: path, args: args, env:{"HOME" => @home_path}
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
    require 'fileutils'
    FileUtils.mkdir_p src
    @vagrant.vm.synced_folder src, "/#{name}", automount:true
  end

  def mount_project_dir()
    sync_dir("#{@project_path}/sf","project")
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
