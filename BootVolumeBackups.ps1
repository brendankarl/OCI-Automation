# Get all Compartments
$Compartments = Get-OCIIdentityCompartmentsList -CompartmentId "ocid1.tenancy.oc1..aaaaaaaae" -CompartmentIdInSubtree $true -LifecycleState Active

# Loop through each Compartment, identify each VM boot volume and output the assigned backup policy
Foreach ($Compartment in $Compartments) 
{
Write-Host "Compartment Name:" $Compartment.Name -ForegroundColor Green
$BootVolumes = Get-OCIBlockstorageBootVolumesList -CompartmentId $Compartment.Id
Foreach ($BootVolume in $BootVolumes)
    {
        Write-Host "-Boot Volume:" $BootVolume.DisplayName
        $PolicyAssignment = Get-OCIBlockstorageVolumeBackupPolicyAssetAssignment -AssetId ($BootVolume.Id)
        if ($PolicyAssignment) {
        $Policy = Get-OCIBlockstorageVolumeBackupPolicy -PolicyId ($PolicyAssignment.PolicyId)
        Write-Host "--Backup Policy:" $Policy.DisplayName -ForegroundColor Yellow}
        else {
            Write-Host "--Backup Policy: NONE" -ForegroundColor Red  
        }
    }
}
