# # Azure login
# #az login --subscription "d5f24952-8dc2-4c18-9aa8-e5ca01a92b06"

# # Create a resource group
# #az group create --name "rgdemo-rg" --location "eastus2"

# #az group list -o table

# #2 Create virtual network (vnet) and subnet
# #az network vnet create --resource-group "rgdemo-rg" --name "rgdemo-vnet-1" --address-prefix "10.1.0.0/16" --subnet-name "rgdemo-subnet-1" --subnet-prefix "10.1.1.0/24"

# az network vnet list -o table

# #3 Create public IP address
# az network public-ip create --resource-group "rgdemo-rg" --name "rgdemo-linux-1-pip-1"

# #4 Create network security group
# az network nsg create --resource-group "rgdemo-rg" --name "rgdemo-linux-nsg-1"

# az network nsg list --output table

#5 - Create a virtual network interface and associate with public IP and NSG
# az network nic create --resource-group "rgdemo-rg" --name "rgdemo-linux-1-nic-1" --vnet-name "rgdemo-vnet-1" --subnet "rgdemo-subnet-1" --network-security-group "rgdemo-linux-nsg-1" --public-ip-address "rgdemo-linux-1-pip-1"

# az network nic list -o table

#6 Create a virtual machine

# az vm create --resource-group "rgdemo-rg" --location "eastus2" --name "rgdemo-linux-1" --nics "rgdemo-linux-1-nic-1" --image "UbuntuLTS" --admin-username "demoadmin" --authentication-type "ssh" --ssh-key-value C:\Users\gavar\.ssh\az_id_rsa.pub

#7 Open port 22 to allow SSH traffic to host

#  az vm open-port --resource-group "rgdemo-rg" --name "rgdemo-linux-1" --port "22"

#8 Grab the public IP address of the VM
az vm list-ip-addresses --name "rgdemo-linux-1" --output table