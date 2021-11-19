#!/bin/bash
terraform init -backend-config=terraform.tf.noprod --reconfigure

if [ $(terraform workspace list | grep -c int) -eq 0 ]; then
	terraform workspace new int
fi

terraform workspace select int
terraform apply -var-file variables.d/variables-int.tfvars -auto-approve
echo "Sleeping for 1 minutes"
sleep 60
cd  ansible
ansible-inventory -i hosts/dev.aws_ec2.yml --graph 
ansible-playbook  -i hosts/dev.aws_ec2.yml playbook.yml 
