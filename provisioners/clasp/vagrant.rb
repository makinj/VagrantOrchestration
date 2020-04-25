def clasp_install(helper)
  modname="clasp"
  #helper.copy_config(modname, "")
  helper.run_script(modname, "install.sh")
end
