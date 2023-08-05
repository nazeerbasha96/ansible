Vagrant.configure(2) do | config |
    config.vm.define "devopsserver" do | jenkinsmaster |
        jenkinsmaster.vm.box = "nazeerbasha/Ubuntu22.04"
        jenkinsmaster.disksize.size = '20GB'
        jenkinsmaster.vm.network "private_network", ip: "192.168.11.10"
        jenkinsmaster.vm.network "forwarded_port", guest: 8080, host: 8081
        jenkinsmaster.vm.hostname = "devopsserver"
        jenkinsmaster.vm.provider "virtualbox" do | vb |
            vb.cpus = 2
            vb.memory = 3072
            vb.name = "devopsserver"
			
        end
		
        jenkinsmaster.vm.provision "ansible pv key", type: "file", source: "security/ansible", destination: "/home/vagrant/.ssh/"
        jenkinsmaster.vm.provision "setup ansiblecontrolnode", type: "shell", path: "provisioners/setupcontrolnode.sh"
    end
    %w{jenkinsslave1 jenkinsslave2}.each_with_index do | nodename, index |
        config.vm.define nodename do | slaveNode |
            slaveNode.vm.box = "ubuntu/focal64"
            slaveNode.vm.network "private_network", ip: "192.168.11.#{index+11}"
            slaveNode.vm.hostname = nodename
            slaveNode.vm.provider "virtualbox" do | vb |
                vb.cpus = 2
                vb.memory = 2048
                vb.name = nodename
            end
            slaveNode.vm.provision "setup manage node ", type: "shell", path: "provisioners/setupmanagenode.sh"
        end
    end
end