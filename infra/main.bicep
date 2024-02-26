targetScope = 'subscription'

@minLength(1)
@maxLength(64)
@description('Name of the the environment which is used to generate a short unique hash used in all resources.')
param environmentName string = 'hospitalintegration'

@minLength(1)
@description('Primary location for all resources')
param location string

param resourceGroupName string = ''

var abbrs = loadJsonContent('./abbreviations.json')

var tags = {
  'azd-env-name': environmentName
}

var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: !empty(resourceGroupName) ? resourceGroupName : '${abbrs.resourcesResourceGroups}${environmentName}'
  location: location
  tags: tags
}

module loggingDeployment 'modules/logging.bicep' = {
  name: 'logging-deployment'
  scope: rg
  params: {
    appInsightsName: 'ain-${resourceToken}'
    logAnalyticsWorkspaceName: 'law-${resourceToken}'
    location: location
  }
}

module keyVaultDeployment 'modules/keyvault.bicep' = {
  name: 'key-vault-deployment'
  scope: rg
  params: {
    keyVaultName: '${abbrs.keyVaultVaults}${resourceToken}' 
    logAnalyticsWorkspaceName: loggingDeployment.outputs.logAnalyticsWorkspaceName
    location: location
    managedIdentityName: managedIdentityDeployment.outputs.managedIdentityName
  }
}

module managedIdentityDeployment 'modules/managedidentity.bicep' = {
  name: 'managed-identity-deployment'
  scope: rg
  params: {
    location: location
    managedIdentityName: '${abbrs.managedIdentityUserAssignedIdentities}${resourceToken}'
  }
}

var queueNames = [
  'patient-queue'
  'checked-in-queue'
  'triaged-queue'
  'taken-vitals-queue'
  'examined-queue'
  'labs-drawn-queue'
  'labs-processed-queue'
]

module serviceBusDeployment 'modules/servicebus.bicep' = {
  name: 'service-bus-deployment'
  scope: rg
  params: {
    keyVaultName: keyVaultDeployment.outputs.keyVaultName
    location: location
    serviceBusConnectionStringSecretName: 'service-bus-connection-string'
    serviceBusNamespaceName: 'sb-${resourceToken}'
    serviceBusQueueNames: queueNames
    managedIdentityName: managedIdentityDeployment.outputs.managedIdentityName
  }
}

module logicAppDeployment 'modules/logicapp.bicep' = {
  scope: rg
  name: 'logic-app-deployment'
  params: {
    appInsightsName: loggingDeployment.outputs.appInsightsName
    logicAppName: '${abbrs.logicWorkflows}${resourceToken}'
    appServicePlanName: '${abbrs.webSitesAppService}${resourceToken}'
    keyVaultName: keyVaultDeployment.outputs.keyVaultName
    location: rg.location
    logAnalyticsWorkspaceName: loggingDeployment.outputs.logAnalyticsWorkspaceName
    managedIdentityName: managedIdentityDeployment.outputs.managedIdentityName
    serviceBusConnectionStringSecretName: serviceBusDeployment.outputs.serviceBusConnectionStringSecretName
    logicAppStorageAccountConnectionStringSecretName: 'logic-app-storage-account-connection-string'
    logicAppStorageAccountName: '${abbrs.storageStorageAccounts}${resourceToken}'
  }
}

output AZURE_LOCATION string = location
output AZURE_TENANT_ID string = tenant().tenantId
output AZURE_SUBSCRIPTION_ID string = subscription().subscriptionId
output AZURE_RESOURCE_GROUP_NAME string = rg.name
output AZURE_LOGIC_APP_NAME string = logicAppDeployment.outputs.logicAppName
