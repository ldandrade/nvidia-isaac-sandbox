# Vagrantfile
Vagrant.configure("2") do |config|
    # Networking
    config.vm.network "public_network", bridge: "Default Switch"

    # Define provider as Hyper-V
    config.vm.provider "hyperv" do |h|      
      h.cpus = 2
      h.maxmemory = 4096

    end
  
    # Base box
    config.vm.box = "generic/ubuntu2204"
    #Hostname
    config.vm.hostname = "Autonomous-Wheelchair"
  
    # Script to install Ansible and execute a playbook
    config.vm.provision "file", source: "playbook.yml", destination: "/home/vagrant/playbook.yml"
    config.vm.provision "file", source: ".env", destination: "/home/vagrant/.env"
    config.vm.provision "file", source: "docker-compose.yml", destination: "/home/vagrant/docker-compose.yml"
    config.vm.provision "shell", inline: <<-SHELL
      sudo apt update && sudo apt install -y ansible
      ansible-playbook /home/vagrant/playbook.yml
    SHELL
  
  end