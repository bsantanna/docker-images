# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

$script = <<SCRIPT
apt-get update && apt-get install -y docker.io
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box_check_update = false
  config.vm.box = "ubuntu/vivid64"
  config.vm.network "public_network", ip: "10.0.1.70"
  config.vm.provision "shell", inline: $script
end
