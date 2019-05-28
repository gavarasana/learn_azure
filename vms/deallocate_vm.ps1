# login to azure
az login --subscription "d5f24952-8dc2-4c18-9aa8-e5ca01a92b06"

# shutdown vm-3
# az vm stop --name "rgdemo-linux-3" --resource-group "rgdemo-rg"

#shutdown vm 2
# az vm stop--name "rgdemo-linux-2" --resource-group "rgdemo-rg"

#shutdown vm 1c
# az vm stop --name "rgdemo-linux-1c" --resource-group "rgdemo-rg"

#deallocate vm-3
# az vm deallocate --name "rgdemo-linux-3" --resource-group "rgdemo-rg"

#deallocate vm-2
# az vm deallocate --name "rgdemo-linux-2" --resource-group "rgdemo-rg"

#deallocate vm-3=1c
az vm deallocate --name "rgdemo-linux-1c" --resource-group "rgdemo-rg"
