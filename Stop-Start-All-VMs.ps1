# Get all Compartments
$Compartments = Get-OCIIdentityCompartmentsList -CompartmentId "OCID" -CompartmentIdInSubtree $true -LifecycleState Active

# Loop through each Compartment, identify each VM instance within and then STOP / START VM instance
Foreach ($Compartment in $Compartments) 
{
Write-Host "Compartment Name:" $Compartment.Name -ForegroundColor Green
$Instances = Get-OCIComputeInstancesList -CompartmentId $Compartment.Id -LifecycleState Stopped # Running / Stopped
Foreach ($Instance in $Instances)
    {
        Write-Host "-Instance:" $Instance.DisplayName -ForegroundColor White
        $Action = Invoke-OCIComputeInstanceAction -InstanceId $Instance.Id -Action "START" # START / SOFTSTOP
    }
}
