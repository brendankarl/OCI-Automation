$InstanceId = "ocid1.instance.oc1.uk-london-1.anwgiljrayvpzvacpmqta5guodp3dfjqpeoncgxczjfckkzgxskkdd5z3dla"
Update-OCIComputeInstance -InstanceId $InstanceId -UpdateInstanceDetails @{InstanceOptions = @{AreLegacyImdsEndpointsDisabled = $true}}
$Instance = Get-OCIComputeInstance -InstanceId $instanceId
