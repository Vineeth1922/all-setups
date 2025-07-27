#vim .bashrc
#export PATH=$PATH:/usr/local/bin/
#source .bashrc


#! /bin/bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops
sudo mv kops /usr/local/bin/kops
chmod +x kubectl
mv kubectl /usr/local/bin/kubectl

export KOPS_STATE_STORE=s3://devika95.flm.k8s
kops create cluster --name devi.k8s.local --zones us-east-1a,us-east-1b,us-east-1c --master-count=1 --master-size t2.large --master-volume-size=30 --node-count=2 --node-size t2.medium --node-volume-size=25
kops update cluster --name devi.k8s.local --yes --admin
