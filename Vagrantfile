# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.hostname = "lightless"
  config.vm.box = "vStone/centos-6.x-puppet.3.x"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.synced_folder "files", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--usb", "off"]
    vb.customize ["modifyvm", :id, "--usbehci", "off"]
  end

  config.vm.provision "puppet" do |puppet|
    env = 'dev'
    puppet.manifest_file  = ""
    puppet.manifests_path = "puppet/#{env}/manifests"
    puppet.module_path = "puppet/modules"
    puppet.options = "--environment #{env}"
  end
end