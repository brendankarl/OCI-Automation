# Get all VMs
$Compartments = Get-OCIIdentityCompartmentsList -CompartmentId "OCID" -CompartmentIdInSubtree $true -LifecycleState Active

# Loop through each Compartment, identify each VM instance and print the name
Foreach ($Compartment in $Compartments) 
{
Write-Host "Compartment Name:" $Compartment.Name -ForegroundColor Green
$Instances = Get-OCIComputeInstancesList -CompartmentId $Compartment.Id
Foreach ($Instance in $Instances)
    {
        Write-Host "-Instance:" $Instance.DisplayName -ForegroundColor White
    }
}
