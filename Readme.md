# DevOps Lab: VM Environment with NGINX Monitoring Stack

This project sets up a **DevOps environment** on a **virtual machine (VM)** that includes a **NGINX** monitoring stack with **Prometheus**, **Grafana**, and **Loki** for real-time performance monitoring and troubleshooting.

# Key Features:
- **NGINX Monitoring**: Monitor the NGINX web server with Prometheus and visualize the data in Grafana.
- **Real-time Metrics**: Use **Prometheus** to collect server performance data (e.g., response time, error rate) and **Grafana** to visualize the metrics in dashboards.
- **Alerting Mechanisms**: Set up alerts with **Alertmanager** to notify when performance thresholds are breached.
- **Containerized Setup**: All monitoring components are deployed using **Docker**, making it portable and easy to recreate.

---

# Prerequisites

Before starting, make sure you have the following installed on your local machine:

1. **Vagrant**: Used to provision the VM.
   - [Download Vagrant](https://www.vagrantup.com/downloads)
   
2. **VirtualBox**: Required to run the VM.
   - [Download VirtualBox](https://www.virtualbox.org/wiki/Downloads)

3. **Docker**: Required for running the NGINX monitoring stack (Prometheus, Grafana, and Loki).
   - [Download Docker](https://www.docker.com/get-started)

4. **Git**: For cloning the repository and version control.
   - [Download Git](https://git-scm.com/downloads)

---

# Project Setup


Follow these steps to set up the project on your local machine:

### 1. Clone the Repository

```
git clone https://github.com/DJENJNY/Vmenvir.git
cd Vmenvir
```

### 2. Set Up the VM Environment

You’ll be using Vagrant to provision the VM, which will automatically configure everything needed for the monitoring stack.

Run the following command to start the VM:

```
vagrant up
```
This will use the Vagrantfile in the repository to create and configure the VM environment.

Once the VM is up, SSH into it:

```
vagrant ssh
```

### 3. Set Up the Docker Containers

The project uses Docker to run NGINX, Prometheus, Grafana, and Loki as containers. The Docker setup is configured using docker-compose.yml.

Inside the VM, navigate to the project directory (if you aren't already there):

```
cd /vagrant
```
Run the following command to bring up the Docker containers:

```
sudo docker-compose up -d
```
This will start the NGINX, Prometheus, Grafana, and Loki containers in the background.

---

# Accessing the Monitoring Tools
NGINX Metrics:

NGINX is exposed via port 8080. You can test the configuration by accessing http://<VM_IP>:8080.

Prometheus:

Prometheus web UI is accessible at http://<VM_IP>:9090.

Grafana:

Grafana web UI is accessible at http://<VM_IP>:3000.

Default login: admin / admin (you will be prompted to change this after the first login).

Loki:

Loki is available for logging. Access it via the Grafana interface.

---

# Files Overview
Vagrantfile: Automates the provisioning of the VM environment.

docker-compose.yml: Defines and runs the Docker containers for NGINX, Prometheus, Grafana, and Loki.

server.sh: Configuration script that sets up the monitoring stack.

nginx.conf: Configures NGINX server for metrics collection.

Prometheus & Grafana Configuration Files: Located in the project directory to allow easy modification and customization.

---

# Cleanup
To stop and clean up the environment, run:

```
sudo docker-compose down
```
To destroy the VM, run:
```
vagrant destroy
```
