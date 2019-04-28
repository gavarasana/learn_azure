#1 Azure login
 az login --subscription "d5f24952-8dc2-4c18-9aa8-e5ca01a92b06"

#2 Grab the public IP address of the VM
# az vm list-ip-addresses --name "rgdemo-linux-1" --output table


# connect to the virtual machine
# ssh demoadmin@52.167.53.9 -i ~/.ssh/az_id_rsa

# Deprovision the virtual machine
#sudo waagent -deprovision+user -force

# logout of VM
#exit

#In Azure CLI, deallocate the virtual machinee
# az vm deallocate --resource-group "rgdemo-rg" --name "rgdemo-linux-1"

#Check out the status of virtual machines
# az vm list --show-details --output table

#Mark the virtual machine as generalized
#az vm generalize --resource-group "rgdemo-rg" --name "rgdemo-linux-1"

#Create a VM from custom image 
# az image create --resource-group "rgdemo-rg" --name "rgdemo-linux-ci-1" --source "rgdemo-linux-1"

#List out our VM images
# az image list --output table

# Create a VM out of the custom image
# az vm create --resource-group "rgdemo-rg" --location "eastus2" --name "rgdemo-linux-1c" --image "rgdemo-linux-ci-1" --admin-user demoadmin --authentication-type "ssh" --ssh-key-value ~/.ssh/az_id_rsa.pub

# List all VMs
# az vm list --show-details --output table

#We can delete the custom VM that image was built of off.
# az vm delete --name "rgdemo-linux-1" --resource-group "rgdemo-rg"


# List all VMs
 az vm list --show-details --output table

# List all resources
az resource list --resource-type=Microsoft.Compute/images --output table

