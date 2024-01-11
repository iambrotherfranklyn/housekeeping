README for Software Installation Script


Description
This PowerShell script automates the installation of several commonly used software tools using Chocolatey, a package manager for Windows. The script is designed to streamline the setup of a development environment by installing the following software:

Terraform
Visual Studio Code
Azure CLI
Git (including Git Bash)
Kubernetes CLI (kubectl)
Google Chrome
MySQL Workbench




Prerequisites
PowerShell 5.0 or higher.
Administrative privileges on the Windows system where the script will be executed.




Installation
Run as Administrator: Ensure that you run PowerShell as an administrator before executing the script.
Execution Policy: The script includes a directive to bypass the execution policy. This is required to run the script without interruptions.
Chocolatey Installation: The script checks for the presence of Chocolatey on your system and installs it if it's not already installed.
Software Installation: The script then proceeds to install the listed software using Chocolatey.




Usage
To use the script:

Save the script with a .ps1 extension, for example, installation_script.ps1.
Open PowerShell as an administrator.
Navigate to the directory containing the script.
Execute the script by typing .\installation_script.ps1.




Post-Installation Notes
Desktop Icons: Some programs, like MySQL Workbench, may not automatically create a desktop icon. You can search for these programs using the Windows search bar and create shortcuts manually if needed.




Verifying Installations:
Terraform: Verify by running terraform -version in the PowerShell.
Visual Studio Code: Should be available in the Start Menu or search for "Visual Studio Code".
Azure CLI: Verify by running az --version.
Git and Git Bash: Search for "Git Bash" in the Start Menu or verify by running git --version.
Kubernetes CLI (kubectl): Verify by running kubectl version --client.
Google Chrome: Should be available in the Start Menu or search for "Google Chrome".
MySQL Workbench: Search for it using the Windows search bar.




Customization
The script is designed for easy customization. To install additional software:

Find the Chocolatey package name for the desired software from the Chocolatey Community Package Repository.
Add a new line in the script using the InstallProgram function with the package name. For example, to install Jenkins, add InstallProgram "jenkins".




Troubleshooting
If any installations fail, the script will list them under "Failed to install programs".
Check the Chocolatey logs at C:\ProgramData\chocolatey\logs\chocolatey.log for detailed error information.




License
This script is provided "as is", without warranty of any kind. Use it at your own risk.

