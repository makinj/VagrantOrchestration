def aws_install(helper)
  modname="aws"
  helper.run_script(modname, "install.sh")
end
