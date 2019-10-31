
def xfce_install(helper,vram="96")
  modname="xfce"
  helper.copy_config(modname, "config.tar.gz")

  #helper.copy_script(modname, "restore.sh")
  #helper.copy_script(modname, "backup.sh")

  helper.run_script(modname, "install.sh")
  #helper.run_script(modname, "restore.sh")

  helper.vb do |vb|
    #   # Display the VirtualBox GUI when booting the machine
    vb.gui = true
    vb.customize ["modifyvm", :id, "--vram", vram]
  end
end
