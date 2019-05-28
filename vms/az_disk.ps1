#login to azure
#az login --subscription "d5f24952-8dc2-4c18-9aa8-e5ca01a92b06"

#create a new disk and attach it
# az vm disk attach `
#     --resource-group "rgdemo-rg" `
#     --vm-name "rgdemo-linux-1c" `
#     --name "rgdemo-linux-1c-st0" `
#     --new --size-gb 10 --sku "StandardSSD_LRS"

#resize the disk
# az  disk update `
    # --name "rgdemo-linux-1c-st0" --resource-group "rgdemo-rg" --size-gb 20

#start the vm
az vm start --name "rgdemo-linux-1c" --resource-group "rgdemo-rg"