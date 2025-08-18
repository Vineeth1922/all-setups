sudo yum install docker -y
sudo systemctl start docker
sudo systemctl status docker
sudo curl -LO "https://dl.kss.io/release/$(curl -L-s https://dl.k8s.10/release/stable.txt)/bin/Linux/amd64/kubectl"
sudo mv kubectl /usr/local/bin/kubectl
sudo chmod +x /usr/local/bin/kubectl
sudo curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
sudo yum install iptables -y
sudo yum install conntrack -y
sudo chmod +x /var/run/docker.sock
sudo usermod -ag docker SUSER && newgrp docker
minikube start --cni-calico
minikube status
