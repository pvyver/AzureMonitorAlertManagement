Set-Item Env:\SuppressAzurePowerShellBreakingChangeWarnings "true"

$resourceGroup =  "czeus-inf-pr-rgp-01"
$scheduledQueryRules = Get-AzScheduledQueryRule -ResourceGroupName $resourceGroup

#Remove All ScheduledQuery Rules in ResourceGroup
foreach ($scheduledQueryRule in $scheduledQueryRules) {
Remove-AzScheduledQueryRule -ResourceGroupName $resourceGroup -Name $scheduledQueryRule.Name
write-host $scheduledQueryRule.Name " removed"
}