# Ensure the directory exists
$directory = "C:\Temp"
if (-not (Test-Path -Path $directory)) {
    New-Item -Path $directory -ItemType Directory
}

# Define the script path
$scriptPath = "C:\Temp\tool-installations.ps1"

# Download the script to the specified path
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/iambrotherfranklyn/housekeeping/main/tool-installations.ps1' -OutFile $scriptPath

# Define the task name
$taskName = "ContinueScriptAfterReboot"

# Check if the scheduled task already exists
if (Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue) {
    # Unregister/delete the existing task
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
}

# Create a scheduled task action to run the script
$action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument "-File `"$scriptPath`""
$trigger = New-ScheduledTaskTrigger -AtStartup

# Register the new scheduled task
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description "Run script after reboot"

# Continue with the rest of the script...

# Run PowerShell as Administrator before executing this script

# Check if Chocolatey is installed
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    # Install Chocolatey package manager
    Set-ExecutionPolicy Bypass -Scope Process -Force
    Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression

    # Restart PowerShell to make sure Chocolatey is in the PATH
    Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    exit
}

# Update Chocolatey
choco upgrade chocolatey -y

# ... rest of your script for installing software ...





# PowerShell.exe -ExecutionPolicy Bypass -File "%~dp0installation1.bat.ps1" %*

# Run PowerShell as Administrator before executing this script

# Check if Chocolatey is installed
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    # Install Chocolatey package manager
    Set-ExecutionPolicy Bypass -Scope Process -Force
    Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression

    # Restart PowerShell to make sure Chocolatey is in the PATH
    Start-Process powershell -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`""
    exit
}

# Update Chocolatey
choco upgrade chocolatey -y

# Initialize lists for tracking installations
$successfulInstalls = @()
$failedInstalls = @()

# Function to install a program using Chocolatey, with optional additional arguments
function InstallProgram($programName, $additionalArgs = "") {
    try {
        $command = "choco install $programName $additionalArgs -y"
        Invoke-Expression $command
        if ($LASTEXITCODE -eq 0) {
            $successfulInstalls += $programName
        } else {
            Write-Host "Failed to install $programName"
            $failedInstalls += $programName
        }
    } catch {
        Write-Host "Failed to install $programName. Error: $_"
        $failedInstalls += $programName
    }
}

# Install desired programs using Chocolatey

# Install Terraform
InstallProgram "terraform"

# Install Visual Studio Code
InstallProgram "vscode"

# Install Azure CLI
InstallProgram "azure-cli"

# Install Git (includes Git Bash)
InstallProgram "git"

# Install Kubernetes CLI (kubectl)
InstallProgram "kubernetes-cli"

# Install Google Chrome with bypassing checksum (use cautiously)
InstallProgram "googlechrome" "--ignore-checksums"


# Install MySQL Workbench
InstallProgram "mysql.workbench"

# Print out the results
Write-Host "Successfully installed programs:"
$successfulInstalls | ForEach-Object { Write-Host "- $_" }

Write-Host "Failed to install programs:"
$failedInstalls | ForEach-Object { Write-Host "- $_" }

# Additional programs can be added to the install list as needed
# For example, to install Jenkins: InstallProgram "jenkins"
