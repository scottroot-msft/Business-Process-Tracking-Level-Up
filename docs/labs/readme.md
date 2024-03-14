# Contoso Hospital Lab Demo


This lab demonstrates how to use the Contoso Hospital Patient-Tracking Application to manage patient workflow.  The lab will cover the following topics:

- Business Process Tracking
- Azure Integration Environments

## Prerequisites -  START HERE

There a a few prerequisites for this lab.  Please ensure you have completed the following instructions before starting this lab:
- [START HERE - Environment Setup](environment-setup.md) 


## Instructions

1. Clone this repository to your local machine.
2. Open the **INTEGRATION-ENVIRONMENT-DEMO** folder in Visual Studio Code.
3. Povision and Deploy the Contoso Hospital Workload
   - From the root directory of the project open, follow these steps to provision Azure resources and deploy the application code:
      - Login to your Azure account:
          ```shell
          azd auth login
          ```
      - Create a new azd environment:
          ```shell
          azd env new
          ```
   
       Enter a name that will be used for the resource group.
       This will create a new folder in the `.azure` folder, and set it as the active environment for any calls to `azd` going forward.
4. Select any required/prompted options to complete the deployment.  
      - You will be asked to select a subscription and resource group.  
      - If you do not have a resource group, you can create one at this time. 
      - Also specify the location for the deployment.
      
### Deploying again

If you've only changed the logic app code in the `src` folder, then you don't need to re-provision the Azure resources. You can just run:

```azd deploy```

If you've changed the infrastructure files (`infra` folder or `azure.yaml`), then you'll need to re-provision the Azure resources. You can do that by running:

```azd up```

    
4. Create the Azure Integration Environment Resource
   - [Link to Create Integration Environment Instructions](https://learn.microsoft.com/en-us/azure/integration-environments/create-integration-environment)
5. Create Application
   - Create new Azure Data Explorer Storage
      - Steps for that
6. Create Business Processes

## Conclusion

Summarize the lab and any key takeaways.

## Additional Resources

Provide any additional resources or references for further learning.

