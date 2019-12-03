def burp_install(helper)
  modname="burp"
  helper.copy_config(modname, "bin.tar.gz")
  helper.run_script(modname, "install.sh")
end
