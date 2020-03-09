az login
az account set --subscription "4e2be44e-b375-46f2-af02-be5db4e96fbf"
# login to azure
az vm deallocate --name rgdemo-lnx-vm1 --resource-group rgdemo-rg --no-wait
az vm deallocate --name rgdemo-lnx-vm2 --resource-group rgdemo-rg --no-wait
az vm deallocate --name rgdemo-lnx-vm3 --resource-group rgdemo-rg --no-wait
az vm deallocate --name rgdemo-lnx-vm4 --resource-group rgdemo-rg --no-wait
az vm deallocate --name rgdemo-lnx-vm5 --resource-group rgdemo-rg --no-wait
az vm deallocate --name rgdemo-lnx-vm6 --resource-group rgdemo-rg --no-wait
az vm deallocate --name rgdemo-lnx-vm7 --resource-group rgdemo-rg --no-wait
az vm deallocate --name rgdemo-lnx-vm8 --resource-group rgdemo-rg --no-wait
az vm deallocate --name rgdemo-lnx-vm9 --resource-group rgdemo-rg --no-wait
az vm deallocate --name rgdemo-lnx-vm10 --resource-group rgdemo-rg --no-wait

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
