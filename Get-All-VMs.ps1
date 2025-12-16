# Get all VMs
$Compartments = Get-OCIIdentityCompartmentsList -CompartmentId ocid1.tenancy.oc1..aaaaaaaae5qe65hymbveayf2nopsuskv525njloma3k5c4yf5hl75uj75euq -CompartmentIdInSubtree $true -LifecycleState Active

Foreach ($Compartment in $Compartments) 
{
Write-Host "Compartment Name:" $Compartment.Name -ForegroundColor Green
$Instances = Get-OCIComputeInstancesList -CompartmentId $Compartment.Id
Foreach ($Instance in $Instances)
    {
        Write-Host "-Instance:" $Instance.DisplayName -ForegroundColor White
    }
}
