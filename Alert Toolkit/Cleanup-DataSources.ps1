$ResourceGroupName = "czeus-inf-pr-rgp-01"
$WorkspaceName = "LA-PVYVER-001"
Set-Item Env:\SuppressAzurePowerShellBreakingChangeWarnings "true"

function Remove-dataSourcesFromWorkSpace ($DataSources) {
foreach ($DataSource in $DataSources)
{
Remove-AzOperationalInsightsDataSource -WorkspaceName $WorkspaceName -ResourceGroupName $ResourceGroupName -Name $DataSource.Name -Force
write-host $DataSource.Name " Removed"
}
}

$PerformanceDataSources = Get-AzOperationalInsightsDataSource -Kind "WindowsPerformanceCounter" -ResourceGroupName $ResourceGroupName -WorkspaceName $WorkspaceName
Remove-dataSourcesFromWorkSpace  -DataSources $PerformanceDataSources

$EventDataSources = Get-AzOperationalInsightsDataSource -Kind "WindowsEvent" -ResourceGroupName $ResourceGroupName -WorkspaceName $WorkspaceName
Remove-dataSourcesFromWorkSpace  -DataSources $EventDataSources
