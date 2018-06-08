workflow db_schema{
    param(
         [Parameter(Mandatory=$true)]
         [string]
         $azureLogin,

         [Parameter(Mandatory=$true)]
         [string]
         $azurePassword,

         [Parameter(Mandatory=$true)]
         [string]
         $tenantId,

         [Parameter(Mandatory=$true)]
         [string]
         $subscriptionId,

         [Parameter(Mandatory=$true)]
         [string]
         $serverLogin,

         [Parameter(Mandatory=$true)]
         [string]
         $serverPassword,

         [Parameter(Mandatory=$true)]
         [string]
         $sqlServerName
         
        )
    InlineScript{
        
    $serverLogin=$Using:serverLogin
    $serverPassword=$Using:serverPassword
    $azureLogin=$Using:azureLogin
    $azurePassword=$Using:azurePassword
    $tenantId=$Using:tenantId
    $subscriptionId=$Using:subscriptionId
    $sqlServerName=$Using:sqlServerName

    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned  -Force
    $azureAccountName = $azureLogin
    $azurePassword = ConvertTo-SecureString $azurePassword  -AsplainText -force
    $psCred = New-Object System.Management.Automation.PSCredential($azureAccountName, $azurePassword)
    start-Sleep -s 20
    Login-AzureRmAccount -TenantId $tenantId -SubscriptionID $subscriptionId -Credential $psCred
        
    ## Creating Database
    $AzureSQLServerName = $sqlServerName + ".database.windows.net,1433"
    $ScriptURL="https://raw.githubusercontent.com/BlueMetal/iot-edge-dynocard/master/code/containers/mssql_db/create-dynocard-db-azure.sql"
    $ScriptFromGit = Invoke-WebRequest -Uri $ScriptURL -UseBasicParsing
    start-Sleep -s 40
    Invoke-Sqlcmd -ServerInstance $AzureSQLServerName -Database "master" -Username "sqladmin" -Password "Password@1234" -Query $ScriptFromGit.Content -connectiontimeout
    start-Sleep -s 40

    ## Creating Schema
    $ScriptURL2="https://raw.githubusercontent.com/BlueMetal/iot-edge-dynocard/master/code/containers/mssql_db/create-dynocard-schema.sql" 
    $ScriptFromGit2 = Invoke-WebRequest -Uri $ScriptURL2 -UseBasicParsing
    start-Sleep -s 120
    Invoke-Sqlcmd -ServerInstance $AzureSQLServerName -Database "db4cards" -Username "sqladmin" -Password "Password@1234" -Query $ScriptFromGit2.Content  -connectiontimeout 
    }
}
