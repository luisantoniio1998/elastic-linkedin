# -*- mode: ruby -*-
# vi: set ft=ruby :
# Vagrantfile for Elasticstack course sandbox - Parallels/ARM64 version

ARCH = "arm64"
BOX = "bento/ubuntu-22.04-arm64"  # ARM64 version for M2 Mac
PROVIDER = "parallels"

Vagrant.configure("2") do |config|
  config.vm.box = BOX

  config.vm.boot_timeout = 900
  config.vm.hostname = "sandbox"
  
  # Forward Kibana port
  config.vm.network "forwarded_port", guest: 5601, host: 5601, host_ip: "127.0.0.1"
  # Forward Elasticsearch port
  config.vm.network "forwarded_port", guest: 9200, host: 9200, host_ip: "127.0.0.1"

  config.vm.provider :parallels do |prl|
    prl.memory = 4096
    prl.cpus = 2
    prl.name = "elasticsearch-sandbox"
  end

  config.vm.provision "shell", inline: <<-OS_SETUP
  apt-get update
  apt-get install -y unzip
  OS_SETUP

  config.vm.provision "file", source: "sandbox.zip", destination: "/tmp/sandbox.zip"

  config.vm.provision "shell", inline: <<-WEB_STACK
  unzip /tmp/sandbox.zip -d /var/
  chmod +x /var/sandbox/scripts/*
  cp -a /var/sandbox/scripts/* /usr/local/bin/
  WEB_STACK

end
