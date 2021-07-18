param name string = 'uniquestoragename2021344'
param location string = 'eastus'


var storageSku = 'Standard_LRS'

resource storageaccount 'Microsoft.Storage/storageAccounts@2020-08-01-preview' = {
  name: name
  location: location
  kind: 'Storage'
  sku: {
     name: storageSku
  }
  properties: {
     allowBlobPublicAccess: false
  }
}


output id string = storageaccount.id

// az deployment group create --resource-group csbootcampvore --template-file ./main.json -p name="cslabstorage232021"
