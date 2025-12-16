$InstanceId = "OCID"
Update-OCIComputeInstance -InstanceId $InstanceId -UpdateInstanceDetails @{InstanceOptions = @{AreLegacyImdsEndpointsDisabled = $true}}
$Instance = Get-OCIComputeInstance -InstanceId $instanceId
