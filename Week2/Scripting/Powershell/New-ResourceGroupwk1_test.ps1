#To Invoke test:
#Invoke-Pester .\resourcegroupwk1.ps1

Describe "New-ResourceGroup" {
    $location = 'eastus2'
    $name = 'csbootcampvore'

    It "Name should be youtube92" {
        $name | Should -Be 'youtube92"'
    }

    It "Location should be eastus" {
        $location | Should -Be 'eastus2'
    }
}