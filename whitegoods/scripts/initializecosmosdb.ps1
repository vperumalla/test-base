workflow  container{
    param(
       
        [Parameter(Mandatory=$true)]
        [string]
        $tenantId,
        
        [Parameter(Mandatory=$true)]
        [string]
        $azureAccountName,

        [Parameter(Mandatory=$true)]
        [string]
        $azurePassword,

        [Parameter(Mandatory=$true)]
        [string]
        $subscriptionId,

        [Parameter(Mandatory=$true)]
        [string]
        $cosmosDBAccountKey,

        [Parameter(Mandatory=$true)]
        [string]
        $cosmosDbAccountName,

        [Parameter(Mandatory=$true)]
        [string]
        $cosmosDbName
    )

    InlineScript{
    
        $tenantId = $Using:tenantId
        $azureAccountName = $Using:azureAccountName
        $azurePassword = $Using:azurePassword
        $subscriptionId = $Using:subscriptionId
        $cosmosDBAccountKey = $Using:cosmosDBAccountKey
        $cosmosDbAccountName = $Using:cosmosDbAccountName
        $cosmosDbName = $Using:cosmosDbName

        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned  -Force
        $password = ConvertTo-SecureString $azurePassword -AsPlainText -Force
        $psCred = New-Object System.Management.Automation.PSCredential($azureAccountName, $password)
        start-Sleep -s 20
        Login-AzureRmAccount -TenantId $tenantId -SubscriptionID $subscriptionId -Credential $psCred 
        start-Sleep -s 20

        Install-Module -Name CosmosDB
        start-Sleep -s 60

        $primaryKey = ConvertTo-SecureString -String $cosmosDBAccountKey  -AsPlainText -Force
        $cosmosDbContext = New-CosmosDbContext -Account $cosmosDbAccountName -Database $cosmosDbName -Key $primaryKey
        start-Sleep -s 20

        New-CosmosDbDatabase -Context $cosmosDbContext -Id $cosmosDbName
        start-Sleep -s 30

        
        New-CosmosDbCollection -Context $cosmosDbContext -Id 'Messages'  -OfferThroughput 400
        start-Sleep -s 20
        New-CosmosDbCollection -Context $cosmosDbContext -Id 'Templates' -OfferThroughput 400
        start-Sleep -s 20
        New-CosmosDbCollection -Context $cosmosDbContext -Id 'Groups' -OfferThroughput 400
    }
}
