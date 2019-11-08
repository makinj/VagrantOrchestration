def unifi_install(helper)
  modname="unifi"
  helper.copy_config(modname, "")
  helper.vm.network "forwarded_port", guest: 8443, host: 8443

  helper.vb do |vbox|

    vbox.driver.execute ['usbfilter', 'add', '0', '--target', :id, '--name', 'unifieth', '--vendorid', '0x0b95', '--productid', '0x1790', '--serialnumber', '000050B6E1F377']
  end

  helper.run_script(modname, "install.sh")
end
