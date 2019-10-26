def xfce_install(helper)
  helper.provisionscript("xfce/install.sh")
  helper.vb do |vb|
    #   # Display the VirtualBox GUI when booting the machine
    vb.gui = true
    #
    #   # Customize the amount of memory on the VM:
    if vb.memory.to_i < 4096
      vb.memory = "4096"
    end
  end
end
