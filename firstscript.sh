#!/bin/bash
echo "Starting bootstrap process"

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

docker pull nginx

docker run --name nginx-container1 -p 8080:80 -d nginx

docker run -d --name=alloy -p 12345:12345 -v /var/log:/host/var/log:ro -v /proc:/host/proc:ro -v /sys:/host/sys:ro -v /vagrant/config.alloy:/etc/alloy/config.alloy:ro grafana/alloy:latest run --server.http.listen-addr=0.0.0.0:12345 --storage.path=/var/lib/alloy/data /etc/alloy/config.alloy


docker run --name loki -d -v /vagrant:/mnt/config -p 3100:3100 grafana/loki:3.4.1 -config.file=/mnt/config/loki-local-config.yaml


echo "bootstrap completed"
