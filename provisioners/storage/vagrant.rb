
def storage_install(helper, path, size=10240)
  modname="storage"
  helper.storage_drive(path, size)
  helper.run_script(modname,"install.sh")
end
