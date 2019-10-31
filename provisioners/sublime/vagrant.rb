def sublime_install(helper)
  modname="sublime"
  helper.copy_config(modname, "")
  helper.run_script(modname, "install.sh")
end
