# Get all Compartments
$Compartments = Get-OCIIdentityCompartmentsList -CompartmentId TenancyOCID -CompartmentIdInSubtree $true -LifecycleState Active

# Loop through all VMs and update the instance metadata service so that it only supports version 2
Foreach ($Compartment in $Compartments) 
{
Write-Host "Compartment Name:" $Compartment.Name -ForegroundColor Green
$Instances = Get-OCIComputeInstancesList -CompartmentId $Compartment.Id
Foreach ($Instance in $Instances)
    {
        Write-Host "-Instance:" $Instance.DisplayName -ForegroundColor White
        $Action = Update-OCIComputeInstance -InstanceId $Instance.Id -UpdateInstanceDetails @{InstanceOptions = @{AreLegacyImdsEndpointsDisabled = $true}}
    }
}
