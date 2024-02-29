$MissingSomething = [bool]::Parse("false")

$greenCheck = @{
    Object = [Char]8730
    ForegroundColor = 'Green'
    NoNewLine = $true
    }

# Check if the needed components are installed
Write-Host "------------------------------------"
Write-Host "Checking Azure CLI"
try{ az --version }
catch
    { 
        Write-Error ">>>> Azure CLI not installed.  Please install and try again" 
        $MissingSomething = [bool]::Parse("true")
    }
Write-Host ""

Write-Host "------------------------------------"
Write-Host "Checking Azure Developer CLI (azd)"
try{ 
    $azdVersion = azd version
    Write-Host @greenCheck
    write-host " - Azure Developer CLI version: $azdVersion"
}
catch
    { 
        Write-Error ">>>> Azure Developer CLI not installed.  Please install and try again"  
        Write-Error ">>>> You can install it by running the following command in a terminal window: winget install microsoft.azd" 
        $MissingSomething = [bool]::Parse("true")
    }
Write-Host ""

Write-Host "------------------------------------"
Write-Host "Checking Azure Functions Core Tools"
try {
    $funcVersion = func --version
    Write-Host @greenCheck
    Write-Host " - Azure Functions Core Tools version: $funcVersion"
    }
catch 
    { 
        Write-Error ">>>> Azure Functions Core Tools not installed.  Please install and try again" 
        Write-Error ">>>> You can install it by running the visiting https://learn.microsoft.com/en-us/azure/azure-functions/functions-run-local" 
        $MissingSomething = [bool]::Parse("true")
    }
Write-Host ""

Write-Host "------------------------------------"
Write-Host "Checking Visual Studio Code"
try {
    $funcVersion = code --version
    Write-Host @greenCheck
    Write-Host " - Visual Studio Code version: $funcVersion"
    }
catch 
    { 
        Write-Error ">>>> Visual Studio Code not installed.  Please install and try again" 
        Write-Error ">>>> You can install it by visiting https://code.visualstudio.com/" 
        $MissingSomething = [bool]::Parse("true")
    }
Write-Host ""

# check if the needed vs code extensions are installed
Write-Host "------------------------------------"
Write-Host "Checking Visual Studio Code Extensions"

$listofextensions= code --list-extensions

if ($listofextensions -notcontains "azurite.azurite") {
    Write-Error ">>>> Azurite.azurite extension not installed.  Please install and try again"
    Write-Error ">>>> You can install it by running the following command in a terminal window:"
    Write-Error ">>>> code --install-extension Azurite.azurite"
    $MissingSomething = [bool]::Parse("true")
} else {
    Write-Host @greenCheck
    Write-Host " - Azurite.azurite extension installed"
}

if ($listofextensions -notcontains "ms-vscode.azurecli") {
    Write-Error ">>>> ms-vscode.azurecli extension not installed.  Please install and try again"
    Write-Error ">>>> You can install it by running the following command in a terminal window:"
    Write-Error ">>>> code --install-extension ms-vscode.azurecli"
    $MissingSomething = [bool]::Parse("true")
} else {
    Write-Host @greenCheck
    Write-Host " - ms-vscode.azurecli extension installed"
}

if ($listofextensions -notcontains "ms-vscode.azure-account") {
    Write-Error ">>>> ms-vscode.azure-account extension not installed.  Please install and try again"
    Write-Error ">>>> You can install it by running the following command in a terminal window:"
    Write-Error ">>>> code --install-extension ms-vscode.azure-account"
    $MissingSomething = [bool]::Parse("true")
} else {
    Write-Host @greenCheck
    Write-Host " - ms-vscode.azure-account extension installed"
}

if ($listofextensions -notcontains "ms-dotnettools.csharp") {
    Write-Error ">>>> ms-dotnettools.csharp extension not installed.  Please install and try again"
    Write-Error ">>>> You can install it by running the following command in a terminal window:"
    Write-Error ">>>> code --install-extension ms-dotnettools.csharp"
    $MissingSomething = [bool]::Parse("true")
} else {
    Write-Host @greenCheck
    Write-Host " - ms-dotnettools.csharp extension installed"
}

if ($listofextensions -notcontains "ms-azuretools.azure-dev") {
    Write-Error ">>>> ms-azuretools.azure-dev extension not installed.  Please install and try again"
    Write-Error ">>>> You can install it by running the following command in a terminal window:"
    Write-Error ">>>> code --install-extension ms-azuretools.azure-dev"
    $MissingSomething = [bool]::Parse("true")
} else {
    Write-Host @greenCheck
    Write-Host " - ms-azuretools.azure-dev extension installed"
}

if ($listofextensions -notcontains "ms-azuretools.vscode-azurefunctions") {
    Write-Error ">>>> ms-azuretools.vscode-azurefunctions extension not installed.  Please install and try again"
    Write-Error ">>>> You can install it by running the following command in a terminal window:"
    Write-Error ">>>> code --install-extension ms-azuretools.vscode-azurefunctions"
    $MissingSomething = [bool]::Parse("true")
} else {
    Write-Host @greenCheck
    Write-Host " - ms-azuretools.vscode-azurefunctions extension installed"
}

if ($listofextensions -notcontains "ms-azuretools.vscode-azurelogicapps") {
    Write-Error ">>>> ms-azuretools.vscode-azurelogicapps extension not installed.  Please install and try again"
    Write-Error ">>>> You can install it by running the following command in a terminal window:"
    Write-Write-ErrorHost ">>>> code --install-extension ms-azuretools.vscode-azurelogicapps"
    $MissingSomething = [bool]::Parse("true")
} else {
    Write-Host @greenCheck
    Write-Host " - ms-azuretools.vscode-azurelogicapps extension installed"
}

# Did we run into any problems?
if ($MissingSomething)
    {
        Write-Error "------------------------------------"
        Write-Error "One or more components are missing. "
        Write-Error "Please review the log above and install the missing components before continuing" 
    }
    else {
        Write-Host "------------------------------------"
        Write-Host "Everything looks good.  You are ready to go!" -ForegroundColor green
        Write-Host "------------------------------------"
    }