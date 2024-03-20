# Contoso Hospital Lab Setup

This lab demonstrates how to use the Contoso Hospital Patient-Tracking Application to manage patient workflow. The lab will cover the following topics:

- Business Process Tracking
- Azure Integration Environments


## Table of Contents
- [Prerequisites - START HERE](#prerequisites---start-here)
- [Instructions](#instructions)
   - [Povision and Deploy the Contoso Hospital Workload](#povision-and-deploy-the-contoso-hospital-workload)
   - [Deploying again](#deploying-again)
   - [The Lab Instructions](#the-lab-instructions)
- [Conclusion](#conclusion)
- [Additional Resources](#additional-resources)


## Prerequisites - START HERE

There a a few prerequisites for this lab. Please ensure you have completed the following instructions before starting this lab:
- [START HERE - Environment Setup](environment-setup.md) 

## Deploy Infrastructure
*Note that this process can take upwards of 20-30 minutes to complete.

1. Clone this repository to your local machine.
2. Open the **INTEGRATION-ENVIRONMENT-DEMO** folder in Visual Studio Code.
3. Povision and Deploy the Contoso Hospital Workload
   - Open a terminal or use VS Code's terminal window
   - From the root directory of the project open, follow these steps to provision Azure resources and deploy the application code:
      - Login to your Azure account:
            ```
            azd auth login
            ```
      - Create a new azd environment:
            ```
            azd env new
            ```

   Enter a name that will be used for the resource group.
   This will create a new folder in the `.azure` folder, and set it as the active environment for any calls to `azd` going forward.
4. Select any required/prompted options to complete the deployment.  
      - You will be asked to select a subscription and resource group.  
      - If you do not have a resource group, you can create one at this time. 
      - Also specify the location for the deployment.

### Deploying again

If you've only changed the logic app code in the `src` folder, then you don't need to re-provision the Azure resources. 

- You can just run:
```azd deploy```

If you've changed the infrastructure files (`infra` folder or `azure.yaml`), then you'll need to re-provision the Azure resources.

- You can do that by running:
```azd up```

    
## The Lab Instructions
Once you have your environment provisioned, you then need to go over and follow the instructions to create the bulk of the rest of this lab exercise.

The lab instructions are found here: 
   - [Business Process Tracking Lab Instructions](instructions/README.md)

## Conclusion

Your infrastructure should now be deployed and you should be ready to start the lab.  If you have any questions, please reach out to the lab facilitator.

## Additional Resources

- [Azure Integration Environments](https://docs.microsoft.com/en-us/azure/logic-apps/create-integration-environment)
- [Azure Logic Apps](https://docs.microsoft.com/en-us/azure/logic-apps/)
- [Azure Service Bus](https://docs.microsoft.com/en-us/azure/service-bus-messaging/)
