VirtualBox Vagrant Box with Ubuntu 14.04 LTS, MySQL 5.1 and Ruby Enterprise Edition 1.8.7

### Possible additional configurations:

      Vagrant.configure(2) do |config|
        config.vm.box = "old-mysql-and-ree"
        config.vm.box_url = "https://github.com/spadin/old-mysql-and-ree/releases/download/v1.0.0/old-mysql-and-ree.box"
        config.ssh.forward_agent = true

        config.vm.provision "shell", :privilege: false, inline: <<-SHELL
          cd /vagrant
          bundle install
          bundle exec rake db:create
          RAILS_ENV=test bundle exec rake db:schema:load
        SHELL
      end
