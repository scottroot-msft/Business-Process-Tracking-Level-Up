# Environment Setup
This page includes information about setting up the environment for the integration environment lab.

## Local Environment Setup
To develop logic apps locally, you need to install the following tools:

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Azure Developer CLI](https://docs.microsoft.com/en-us/azure/developer/azure-cli)
- [Azure Function Core Tools](https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local)
- [Visual Studio Code](https://code.visualstudio.com/)  
 
### Visual Studio Code Extensions Required:

- [Azurite](https://marketplace.visualstudio.com/items?itemName=Azurite.azurite)
- [Azure CLI Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azurecli)
- [Azure Account](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azure-account)
- [Azure Developer CLI](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.azure-dev)
- [Azure Functions](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurefunctions)
- [Azure Logic Apps Standard Designer](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurelogicapps)


## Check Your Environment 
PowerShell Script: checkenvironment.ps1

The `checkenvironment.ps1` script is a PowerShell script located in the `scripts` folder. This script is used to check the environment setup for the labs.

### Purpose

The purpose of the `checkenvironment.ps1` script is to verify that all the necessary dependencies and configurations are in place for the integration environment lab. It performs various checks and validations to ensure that the environment is properly set up and ready for use.

### Usage

To use the `checkenvironment.ps1` script, follow these steps:

1. Open a PowerShell terminal.
2. Navigate to the `scripts` folder.
3. Run the script using the following command:

   ```powershell
   .\checkenvironment.ps1
