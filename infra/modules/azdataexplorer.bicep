param clusterName string
param location string = resourceGroup().location
param skuName string
param skuCapacity int = 1
param managedIdentityName string
param databaseName string

resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2021-09-30-preview' existing = {
  name: managedIdentityName
}

resource cluster 'Microsoft.Kusto/clusters@2023-08-15' = {
  name: clusterName
  location: location
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${managedIdentity.id}': {}
    }
  }
  sku: {
    name: skuName
    capacity: skuCapacity
    tier: 'Basic'
  }
  properties: {
  }
}

resource database 'Microsoft.Kusto/clusters/databases@2023-08-15' = {
  parent: cluster
  name: databaseName
  kind: 'ReadWrite'
  location: location
  properties: {
    softDeletePeriod: 'P60D'
    hotCachePeriod: 'P30D'
  }
}
