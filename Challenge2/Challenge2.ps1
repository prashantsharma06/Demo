# Below code will query the metadata of an Azure Instance 


# Azure Instance Metadata Service (IMDS) will be used here whose URI is http://169.254.169.254/metadata/instance?api-version=2021-02-01

$metadata = Invoke-RestMethod -Method GET -Proxy $Null -Uri http://169.254.169.254/metadata/instance?api-version=2021-02-01 -Headers @{“Metadata”=”True”}

#Metadata storage ArrayList

$datainfo = New-Object System.Collections.ArrayList

$datainfo.Add([internalobject] @{"Properties" = "Name of the Azure Server"; "Data" = $metadata.compute.name}) | Out-Null

$datainfo.Add([internalobject] @{"Properties" = "Name of the Azure Instance Resource Group"; "Data" = $metadata.compute.resourceGroupName}) | Out-Null

$datainfo.Add([internalobject] @{"Properties" = "Name of the Azure Location"; "Data" = $metadata.compute.location}) | Out-Null

$datainfo.Add([internalobject] @{"Properties" = "Name of the type of Operating System"; "Data" = $metadata.compute.osType}) | Out-Null

$datainfo.Add([internalobject] @{"Properties" = "Azure IP address "; "Data" = $metadata.network.interface.ipv4.ipAddress.privateIpAddress}) | Out-Null

$datainfo.Add([internalobject] @{"Properties" = "Size of the Azure VM"; "Data" = $metadata.compute.vmSize}) | Out-Null

#metadata converted to json

$metadatajson = Invoke-RestMethod -Method GET -Uri http://169.254.169.254/metadata/instance?api-version=2021-02-01 -Headers @{“Metadata”=”True”} | ConvertTo-JSON -Depth 99
$metadatajson | Out-File -FilePath "D:\Metadatadetails.json" -Force


# Display the metadata output

Write-Output $datainfo