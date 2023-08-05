#!/bin/bash
 sudo cat /vagrant/security/ansible.pub >> /home/vagrant/.ssh/authorized_keys
 sudo apt update -y
 sudo apt install -y openjdk-11-jdk
 sudo mkdir -p /u01/jenkins
 sudo chown vagrant:vagrant -R /u01