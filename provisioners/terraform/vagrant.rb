def template_install(helper)
  modname="terraform"
  #helper.copy_config(modname, "")
  helper.run_script(modname, "install.sh")
end
