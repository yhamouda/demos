#Untar and mv to home dir
tar -xvf /home/student/Downloads/linux-amd64-PolicyGenerator.tar.gz -C /home/student/
chmod +x /home/student/PolicyGenerator
sudo cp /home/student/PolicyGenerator /usr/local/bin/
sudo cp /home/student/PolicyGenerator /home/student/.config/kustomize/plugin/policy.open-cluster-management.io/v1/policygenerator/
