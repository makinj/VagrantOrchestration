def ssh_key_install(helper)
  modname="ssh-key"
  #helper.copy_vault(modname, "")
  helper.copy_config(modname, "")
  helper.run_script(modname, "install.sh")
end
