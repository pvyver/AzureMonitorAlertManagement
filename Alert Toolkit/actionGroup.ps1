$NewActionGroupName = "pvyverAGLA"
$ActionGroupShortName = "pvyverAGLA"
$ResourceGroup = "pvyverAlerts-RG"

New-AzResourceGroup -Name "pvyverAlerts-RG" -Location "westeurope"
$pvyverLogicAppID = "/subscriptions/eaeb62b7-c2ca-4ddd-9d14-b26271cad36c/resourceGroups/MyLogicApp-RG/providers/Microsoft.Logic/workflows/MyLogicApp"
$logicAppReceiver =  New-AzActionGroupReceiver -Name "pvyverLogicAppReceiver"  -LogicAppReceiver  -ResourceId $pvyverLogicAppID  -CallbackUrl "http://localhost"
$newActionGroup = Set-AzActionGroup `
 -Name $NewActionGroupName `
 -ResourceGroup $ResourceGroup `
 -ShortName $ActionGroupShortName `
 -Receiver $logicAppReceiver 

$actionGroupObject = Get-AzActionGroup -ResourceGroup $ResourceGroup -Name $NewActionGroupName 
$actionGroupId = $actionGroupObject.Id
Write-Host "Action group with name, '$NewActionGroupName' created successfully"