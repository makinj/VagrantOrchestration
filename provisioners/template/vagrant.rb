def template_install(helper)
  modname="template"
  #helper.copy_config(modname, "")
  helper.run_script(modname, "install.sh")
end
