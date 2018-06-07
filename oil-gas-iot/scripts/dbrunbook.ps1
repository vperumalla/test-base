  workflow db_schema{
    param(
         [Parameter(Mandatory=$true)]
         [string]
         $azurelogin,

         [Parameter(Mandatory=$true)]
         [string]
         $azurepassword,

         [Parameter(Mandatory=$true)]
         [string]
         $TenantId,

         [Parameter(Mandatory=$true)]
         [string]
         $SubscriptionId,

         [Parameter(Mandatory=$true)]
         [string]
         $serverusername,

         [Parameter(Mandatory=$true)]
         [string]
         $serverpassword,

         [Parameter(Mandatory=$true)]
         [string]
         $SQLServerName
         
        )
    InlineScript{
        
    $serverusername=$Using:serverusername
    $serverpassword=$Using:serverpassword
    $azurelogin=$Using:azurelogin
    $azurepassword=$Using:azurepassword
    $TenantId=$Using:TenantId
    $SubscriptionId=$Using:SubscriptionId
    $SQLServerName=$Using:SQLServerName

    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned  -Force
    $azureAccountName = $azurelogin
    $azurePassword = ConvertTo-SecureString $azurepassword  -AsplainText -force
    $psCred = New-Object System.Management.Automation.PSCredential($azureAccountName, $azurePassword)
    start-Sleep -s 20
    Login-AzureRmAccount -TenantId $TenantId -SubscriptionID $SubscriptionId -Credential $psCred
    start-Sleep -s 20
        
    ## Creating Database
    $AzureSQLServerName = $SQLServerName + ".database.windows.net,1433"
    $ScriptURL="https://raw.githubusercontent.com/BlueMetal/iot-edge-dynocard/master/code/containers/mssql_db/create-dynocard-db-azure.sql"
    $ScriptFromGit = Invoke-WebRequest -Uri $ScriptURL -UseBasicParsing
    start-Sleep -s 20
    Invoke-Sqlcmd -ServerInstance $AzureSQLServerName -Database "master" -Username "sqladmin" -Password "Password@1234" -Query $ScriptFromGit.Content
    start-Sleep -s 40

    ## Creating Schema
    $ScriptURL2="https://raw.githubusercontent.com/BlueMetal/iot-edge-dynocard/master/code/containers/mssql_db/create-dynocard-schema.sql" 
    $ScriptFromGit2 = Invoke-WebRequest -Uri $ScriptURL2 -UseBasicParsing
    start-Sleep -s 20
    Invoke-Sqlcmd -ServerInstance $AzureSQLServerName -Database "db4cards" -Username "sqladmin" -Password "Password@1234" -Query $ScriptFromGit2.Content 
    }
}
  
 