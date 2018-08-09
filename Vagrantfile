Vagrant.configure("2") do |config|
  config.vm.box = "alvaro/xenial64"
  config.vm.hostname = "dev1"
  config.vm.provision "shell", path: "scripts/provision.sh"
  config.vm.network "forwarded_port", guest: 80, host: 8080
end
