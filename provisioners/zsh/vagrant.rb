def zsh_install(helper)
  modname="zsh"
  helper.copy_config(modname, "")
  helper.run_script(modname, "install.sh")
end
