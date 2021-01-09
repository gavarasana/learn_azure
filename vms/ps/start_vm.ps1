#login to azure
az login --subscription "d5f24952-8dc2-4c18-9aa8-e5ca01a92b06"

# start the vm
az vm start --name "rgdemo-lnx-vm1" --resource-group "rg-learn-rg" --no-wait" --resource-group "rgdemo-rg"

# List IP address
az vm list-ip-addresses --name "rgdemo-linux-1c" --resource-group "rgdemo-rg"

#start the second vm
# az vm start --name "rgdemo-linux-1c" --resource-group "rgdemo-rg"

#start the third vm
# az vm start --name "rgdemo-linux-2" --resource-group "rgdemo-rg"