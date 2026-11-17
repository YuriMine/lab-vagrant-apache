Vagrant.configure("2") do |config|
  config.vm.box = "generic/rocky8"
  config.vm.synced_folder ".", "/vagrant"
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  config.vm.provision "shell", path: "provision.sh"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 1
    v.name = "lab-vagrant-apache"
  end

  config.vm.provider "vmware_desktop" do |v|
    v.vmx["memsize"] = "1024"
    v.vmx["numvcpus"] = "1"
  end

  config.vm.provider "libvirt" do |v|
    v.memory = 1024
    v.cpus = 1
  end
end
