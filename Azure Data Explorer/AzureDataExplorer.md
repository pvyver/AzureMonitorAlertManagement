# Azure Data Explorer

## Create Table

```c
 .create table Alerts (
AlertRuleName: string, 
Severity: string, 
AlertThresholdOperator: string, 
AlertThresholdValue: string, 
LinkToSearchResults: string, 
ResultCount: string, 
SearchInterval: string, 
SearchIntervalStartTime: string, 
SearchIntervalEndtime: string, 
SearchQuery: string, 
ApplicationID: string, 
SubscriptionID: string,
Computer: string,
TimeGenerated: string,
CounterValue: string,
AlertType_s: string,
SeverityName_s: string,
AffectedCI_s: string,
AlertTitle_s: string,
AlertDetails_s: string
)
```

## Create ingestion json mapping
```c
.create table Alerts ingestion json mapping 'AlertsMapping' '[{"column":"AlertRuleName","path":"$.AlertRuleName","datatype":"string"},{"column":"Severity","path":"$.Severity","datatype":"string"},{"column":"AlertThresholdOperator","path":"$.AlertThresholdOperator","datatype":"string"},{"column":"AlertThresholdValue","path":"$.AlertThresholdValue","datatype":"string"},{"column":"LinkToSearchResults","path":"$.LinkToSearchResults","datatype":"string"},{"column":"ResultCount","path":"$.ResultCount","datatype":"string"},{"column":"SearchInterval","path":"$.SearchInterval","datatype":"string"},{"column":"SearchIntervalStartTime","path":"$.SearchIntervalStartTime","datatype":"string"},{"column":"SearchIntervalEndtime","path":"$.SearchIntervalEndtime","datatype":"string"},{"column":"SearchQuery","path":"$.SearchQuery","datatype":"string"},{"column":"ApplicationID","path":"$.ApplicationID","datatype":"string"},{"column":"SubscriptionID","path":"$.SubscriptionID","datatype":"string"},{"column":"Computer","path":"$.Computer","datatype":"string"},{"column":"TimeGenerated","path":"$.TimeGenerated","datatype":"string"},{"column":"CounterValue","path":"$.CounterValue","datatype":"string"},{"column":"AlertType_s","path":"$.AlertType_s","datatype":"string"},{"column":"SeverityName_s","path":"$.SeverityName_s","datatype":"string"},{"column":"AffectedCI_s","path":"$.AffectedCI_s","datatype":"string"},{"column":"AlertTitle_s","path":"$.AlertTitle_s","datatype":"string"},{"column":"AlertDetails_s","path":"$.AlertDetails_s","datatype":"string"}]'
```