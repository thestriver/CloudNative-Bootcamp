
function New-ResourceGroup {
    [cmdletbinding(SupportsShouldProcess)]

    param (
        [parameter(Mandatory)]
        [string]$rgName,

        [parameter(Mandatory)]
        [string]$location
    )

    $params = @{
        'Name' = $rgName
        'Location' = $location
    }
    if($PSCmdlet.ShouldProcess('location')){
        New-AzResourceGroup @params
    }
}


#Errors

#1 The term 'New-AzResourceGroup' is not recognized as a name of a cmdlet, function, script file, or executable program.
#Check the spelling of the name, or if a path was included, verify that the path is correct and try again.
#Solution 1: Make sure Azure CLI are registered.
#Solution 2: https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-6.2.0