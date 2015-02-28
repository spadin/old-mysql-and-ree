# VM Notes

### Possible additional configurations:

      config.vm.network "forwarded_port", guest: 80, host: 8080
      config.vm.synced_folder "../data", "/vagrant_data"

