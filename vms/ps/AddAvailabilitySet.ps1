# Set subscription id
    $subscriptionId = "4e2be44e-b375-46f2-af02-be5db4e96fbf"
# Login to AZ
Connect-AzAccount `
    -Subscription $subscriptionId

# Resource group name
    $resourceGroup = "rg-learn-rg";

# set account
    #az account set --subscription $resourceGroup
# Vm Name
    $vmName = "rgdemo-lnx-vm" + 1;

# Get the details of the VM to be moved to the Availability Set
    $firstVM = Get-AzVM `
        -ResourceGroupName $resourceGroup `
        -Name $vmName
    
    Write-Host $firstVM.name

# Availability Set
    $availSetName = "rg-vm-aset"
# Create new availability set if it does not exist
    $availSet = Get-AzAvailabilitySet `
       -ResourceGroupName $resourceGroup `
       -Name $availSetName `
       -ErrorAction Ignore
    if (-Not $availSet) {
    $availSet = New-AzAvailabilitySet `
       -Location $firstVM.Location `
       -Name $availSetName `
       -ResourceGroupName $resourceGroup `
       -PlatformFaultDomainCount 2 `
       -PlatformUpdateDomainCount 2 `
       -Sku Aligned
    }

# Start all VMs
for ($i = 1; $i -lt 5; $i++) 
{
    $vmName = "rgdemo-lnx-vm" + $i;
    # Get the details of the VM to be moved to the Availability Set
    $originalVM = Get-AzVM `
        -ResourceGroupName $resourceGroup `
        -Name $vmName

    # Remove the original VM
    Remove-AzVM -ResourceGroupName $resourceGroup -Name $vmName

    # Create the basic configuration for the replacement VM. 
    $newVM = New-AzVMConfig `
       -VMName $originalVM.Name `
       -VMSize $originalVM.HardwareProfile.VmSize `
       -AvailabilitySetId $availSet.Id

    # For a Linux VM, change the last parameter from -Windows to -Linux 
    Set-AzVMOSDisk `
       -VM $newVM -CreateOption Attach `
       -ManagedDiskId $originalVM.StorageProfile.OsDisk.ManagedDisk.Id `
       -Name $originalVM.StorageProfile.OsDisk.Name `
       -Linux

    # Add Data Disks
    foreach ($disk in $originalVM.StorageProfile.DataDisks) { 
        Add-AzVMDataDisk -VM $newVM `
        -Name $disk.Name `
        -ManagedDiskId $disk.ManagedDisk.Id `
        -Caching $disk.Caching `
        -Lun $disk.Lun `
        -DiskSizeInGB $disk.DiskSizeGB `
        -CreateOption Attach
    }

    # Add NIC(s) and keep the same NIC as primary
    foreach ($nic in $originalVM.NetworkProfile.NetworkInterfaces) {	
        if ($nic.Primary -eq "True")
        {
                Add-AzVMNetworkInterface `
                -VM $newVM `
                -Id $nic.Id -Primary
                }
            else
                {
                    Add-AzVMNetworkInterface `
                    -VM $newVM `
                    -Id $nic.Id 
                    }
        }

    # Recreate the VM
    New-AzVM `
       -ResourceGroupName $resourceGroup `
       -Location $originalVM.Location `
       -VM $newVM `
       -DisableBginfoExtension
}