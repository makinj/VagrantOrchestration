class VagrantHelper
  def initialize(orch_path, config)
    # Instance variables
    @orch_path = orch_path
    @config = config
  end

  def provisionscript(script)
    @config.vm.provision "shell", path: @orch_path+"provisioners/"+script
  end

  def vm()
    return @config.vm
  end

  def vb()
    return @config.vm.provider "virtualbox"
  end

end

def pre_install(helper)
  helper.provisionscript("common/pre_install.sh")
end

def post_install(helper)
  helper.provisionscript("common/post_install.sh")
end
