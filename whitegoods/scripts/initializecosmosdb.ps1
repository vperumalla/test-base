workflow  container{
    param(
       
        [Parameter(Mandatory=$true)]
        [string]
        $tenantId,

        [Parameter(Mandatory=$true)]
        [string]
        $clientId,

        [Parameter(Mandatory=$true)]
        [string]
        $clientSecret,

        [Parameter(Mandatory=$true)]
        [string]
        $deviceManagementUri,
        
        [Parameter(Mandatory=$true)]
        [string]
        $azureAccountName,

        [Parameter(Mandatory=$true)]
        [string]
        $azurePassword,

        [Parameter(Mandatory=$true)]
        [string]
        $objectId,

        [Parameter(Mandatory=$true)]
        [string]
        $subscriptionId,

        [Parameter(Mandatory=$true)]
        [string]
        $cosmosDbAccountName,

        [Parameter(Mandatory=$true)]
        [string]
        $cosmosDbName
    )

    InlineScript{
    
        $tenantId = $Using:tenantId
        $clientId = $Using:clientId
        $clientSecret = $Using:clientSecret
        $deviceManagementUri = $Using:deviceManagementUri
        $azureAccountName = $Using:azureAccountName
        $azurePassword = $Using:azurePassword
        $objectId = $Using:objectId
        $subscriptionId = $Using:subscriptionId
        $cosmosDbAccountName = $Using:cosmosDbAccountName
        $cosmosDbName = $Using:cosmosDbName

        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned  -Force
        $password = ConvertTo-SecureString $azurePassword -AsPlainText -Force
        $psCred = New-Object System.Management.Automation.PSCredential($azureAccountName, $password)
        start-Sleep -s 20
        Login-AzureRmAccount -TenantId $tenantId -SubscriptionID $subscriptionId -Credential $psCred 
        start-Sleep -s 20

        $cosmosDbContext = New-CosmosDbContext -Account $cosmosDbAccountName -Database $cosmosDbName

        New-CosmosDbDatabase -Context $cosmosDbContext -Id $cosmosDbName

        
        New-CosmosDbCollection -Context $cosmosDbContext -Id 'Messages'  -OfferThroughput 400
        New-CosmosDbCollection -Context $cosmosDbContext -Id 'Templates' -OfferThroughput 400
        New-CosmosDbCollection -Context $cosmosDbContext -Id 'Groups' -OfferThroughput 400
    }
}
