using './main.bicep'

param resourceGroupName = ''
param environmentName = readEnvironmentVariable('AZURE_ENV_NAME', 'levelup')
param location = 'eastus'
