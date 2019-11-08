def k8s_install(helper)
  modname="k8s"
  helper.run_script(modname, "install.sh")
end
