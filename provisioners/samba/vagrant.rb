def samba_install(helper)
  modname="samba"
  helper.copy_config(modname, "")
  helper.vm.network "forwarded_port", guest: 139, host: 1139
  helper.vm.network "forwarded_port", guest: 445, host: 1445
  helper.vm.network "forwarded_port", guest: 137, host: 1137, protocol: 'udp'
  helper.vm.network "forwarded_port", guest: 138, host: 1138, protocol: 'udp'

  helper.run_script(modname, "install.sh")
end
