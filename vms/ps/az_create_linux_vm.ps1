#1 Login to Azure Subscription
 az login --subscription "d5f24952-8dc2-4c18-9aa8-e5ca01a92b06"

#2 Create a public IP address to be used the by vm
#az network public-ip create --name "rgdemo-linux-3-pip-1" --resource-group "rgdemo-rg" 

#3 Create network security group to be associated with a NIC
#  az network nsg create --name "rgdemo-linux-3-nsg" --resource-group "rgdemo-rg" 

#3a update nsg to open port 22
#  az network nsg rule create --name "default-allow-ssh" `
#      --nsg-name "rgdemo-linux-3-nsg" --resource-group "rgdemo-rg" `
#      --access Allow --direction Inbound --protocol Tcp `
#      --description "Allow ssh access" --source-address-prefixes * `
#      --source-port-ranges * --destination-address-prefixes * --destination-port-ranges 22 `
#      --priority 1000


# #4 create a network interface and associate with public IP and the above NSG
# az network nic create --name "rgdemo-linux-3-nic" `
#     --resource-group "rgdemo-rg" --vnet-name "rgdemo-vnet-1" `
#     --subnet "rgdemo-subnet-1" --network-security-group "rgdemo-linux-3-nsg" `
#     --public-ip-address "rgdemo-linux-3-pip-1"

# #5 create a linux vm with above details
# az vm create --name "rgdemo-linux-3" --resource-group "rgdemo-rg" `
#         --location "eastus2" --nics "rgdemo-linux-3-nic" `
#         --image "UbuntuLTS" --admin-user "demoadmin" --authentication-type "ssh" `
#         --ssh-key-value "C:\Users\gavar\.ssh\az_id_rsa.pub"

#6 Grab the public IP address of the VM
# az vm list-ip-addresses --name "rgdemo-linux-3" --output table

#7 List all vms
#  az vm list --output table