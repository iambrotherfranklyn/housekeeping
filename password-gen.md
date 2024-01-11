README for Azure VM and Database Server Password Generation Script



Description
This PowerShell script is designed to generate passwords up to 11 characters in length. It's particularly suited for creating passwords for Azure Windows Virtual Machines (VMs), database servers, and securely storing them in Azure KeyVault secrets using Terraform. This script is ideal for practice environments where frequent regeneration of secrets is necessary without waiting for KeyVault secrets to expire. It comes in handy for gernerating secrets for mutiple azure VM and database servers.


look how it is used in one of out projects here: https://github.com/iambrotherfranklyn/fully-automated-secure-azure-infrastructure-/blob/main/kv.tf#L70



Prerequisites
PowerShell 
Access to an Azure subscription and appropriate permissions to create and manage VMs, database servers, and KeyVault secrets.
Terraform installed and configured for Azure. Basic understanding of Azure services and Terraform.




Installation
No specific installation is required for this script itself, but ensure that PowerShell, Azure CLI, and Terraform are installed and configured on your system.




Usage
To use the script, provide a comma-separated list of VM names as an argument. The script will then generate a unique password for each VM name in the list.

look how it is used in one of out projects here: https://github.com/iambrotherfranklyn/fully-automated-secure-azure-infrastructure-/blob/main/kv.tf#L70

Syntax
powershell
Copy code
.\PasswordGenerator.ps1 -VmNames "vmName1,vmName2"
Replace "vmName1,vmName2" with your actual VM names.




Warnings and Permissions
Dependency on KeyVault: Since the script generates new passwords, it causes dependencies where the Windows VMs rely on KeyVault secrets. Each time terraform apply is executed, it might lead to the recreation of Windows VMs due to password change.
Administrative Permissions: Ensure you have the necessary permissions in Azure to create and manage VMs, database servers, and KeyVault secrets.




Script Execution Policy: You might need to modify your PowerShell execution policy to run this script. Use Set-ExecutionPolicy with caution, as it affects PowerShell scripts' security. This may not be your case. Script runs simply by default.




Troubleshooting and Support
If the script fails to execute, check your PowerShell execution policy and Azure/Terraform configurations.
Ensure that the VM names provided are correctly formatted and exist in your Azure subscription.
Contribution and Feedback
For any feedback, improvements, or issues, please open an issue in the repository where this script is hosted.

License
This script is provided "as is", without warranty of any kind. Use it at your own risk.