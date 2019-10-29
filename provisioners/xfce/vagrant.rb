
def xfce_install(helper)
  modname="xfce"
  helper.copy_config(modname, "config.tar.gz")

  helper.copy_script(modname, "restore.sh")
  helper.copy_script(modname, "backup.sh")

  helper.run_script(modname, "install.sh")
  #helper.run_script(modname, "restore.sh")

  helper.vb do |vb|
    #   # Display the VirtualBox GUI when booting the machine
    vb.gui = true
    #
    #   # Customize the amount of memory on the VM:
    if vb.memory.to_i < 4096
      vb.memory = "4096"
    end
    vb.customize ["modifyvm", :id, "--vram", "96"]
  end
end
