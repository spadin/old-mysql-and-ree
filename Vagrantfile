# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "2048"
  end

  config.vm.provision "shell", inline: <<-SHELL
    /vagrant/scripts/install_packages.sh
    /vagrant/scripts/install_mysql.sh
    /vagrant/scripts/install_ree.sh
  SHELL
end

