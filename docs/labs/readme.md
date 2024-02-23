# Contoso Hospital Lab Demo


This lab demonstrates how to use the Contoso Hospital application to manage patient data.  The lab will cover the following topics:

- Business Process Management
- Azure Integration Environments

## Prerequisites -  START HERE

List any prerequisites or requirements for completing the lab.
There a a few prerequisites for this lab.  Please ensure you have completed the following instructions before starting this lab:
- [START HERE - Environment Setup](link-to-environment-setup.md) 


## Instructions

1. Clone this repository to your local machine.
2. Open the **INTEGRATION-ENVIRONMENT-DEMO** folder in Visual Studio Code.
3. Povision and Deploy the Contoso Hospital Workload
   - From the root directory of the project open, in a new terminal window, run the following command:
     ```bash
     azd up
     ```
   - Select any required/prompted options to complete the deployment.  
      - You may be prompted to login to your Azure account. 
      - You will also be asked to select a subscription and resource group.  
      - If you do not have a resource group, you can create one at this time. 
      - Also specify the location for the deployment.
4. Create the Azure Integration Environment Resource
   - [Link to Create Integration Environment Instructions](https://learn.microsoft.com/en-us/azure/integration-environments/create-integration-environment)
5. TBD

## Conclusion

Summarize the lab and any key takeaways.

## Additional Resources

Provide any additional resources or references for further learning.

