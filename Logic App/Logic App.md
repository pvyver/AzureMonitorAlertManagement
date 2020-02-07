# Azure Logic App

## Code

 highlighting	
```json
{
    "definition": {
        "$schema": "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#",
        "actions": {
            "Condition": {
                "actions": {
                    "Send_an_email_(V2)": {
                        "inputs": {
                            "body": {
                                "Body": "<p>@{triggerBody()?['data']?['AlertRuleName']}<br>\n@{triggerBody()?['data']?['IncludeSearchResults']}</p>",
                                "Subject": "@triggerBody()?['data']?['AlertRuleName']",
                                "To": "myemail@awesome.com"
                            },
                            "host": {
                                "connection": {
                                    "name": "@parameters('$connections')['outlook']['connectionId']"
                                }
                            },
                            "method": "post",
                            "path": "/v2/Mail"
                        },
                        "runAfter": {},
                        "type": "ApiConnection"
                    }
                },
                "expression": {
                    "and": [
                        {
                            "equals": [
                                "@triggerBody()?['data']?['Severity']",
                                9
                            ]
                        }
                    ]
                },
                "runAfter": {},
                "type": "If"
            },
            "For_each_2": {
                "actions": {
                    "For_each": {
                        "actions": {
                            "Send_event": {
                                "inputs": {
                                    "body": {
                                        "ContentData": "@{base64(concat('{\"AlertRuleName\":\"',triggerBody()?['data']?['AlertRuleName'],'\",\"Severity\":\"',triggerBody()?['data']?['Severity'],'\",\"AlertThresholdOperator\":\"',triggerBody()?['data']?['AlertThresholdOperator'],'\",\"AlertThresholdValue\":\"',triggerBody()?['data']?['AlertThresholdValue'],'\",\"LinkToSearchResults\":\"',triggerBody()?['data']?['LinkToSearchResults'],'\",\"ResultCount\":\"',triggerBody()?['data']?['ResultCount'],'\",\"SearchInterval\":\"',triggerBody()?['data']?['Search Interval'],'\",\"SearchIntervalStartTime\":\"',triggerBody()?['data']?['Search Interval StartTime'],'\",\"SearchIntervalEndtime\":\"',triggerBody()?['data']?['Search Interval End time'],'\",\"SearchQuery\":\"NA\",\"SubscriptionID\":\"',triggerBody()?['data']?['Subscription ID'],'\",\"Computer\":\"',item()[0],'\",\"TimeGenerated\":\"',item()[1],'\",\"CounterValue\":\"',item()[2],'\",\"AlertType_s\":\"',item()[3],'\",\"SeverityName_s\":\"',item()[5],'\",\"AffectedCI_s\":\"',item()[6],'\",\"AlertTitle_s\":\"',item()[7],'\",\"AlertDetails_s\":\"NA\"}'))}"
                                    },
                                    "host": {
                                        "connection": {
                                            "name": "@parameters('$connections')['eventhubs']['connectionId']"
                                        }
                                    },
                                    "method": "post",
                                    "path": "/@{encodeURIComponent('pvyveralerteventhub')}/events",
                                    "queries": {
                                        "partitionKey": "0"
                                    }
                                },
                                "runAfter": {},
                                "type": "ApiConnection"
                            }
                        },
                        "foreach": "@items('For_each_2')?['rows']",
                        "runAfter": {},
                        "type": "Foreach"
                    }
                },
                "foreach": "@triggerBody()?['data']?['SearchResults']?['tables']",
                "runAfter": {
                    "Condition": [
                        "Succeeded"
                    ]
                },
                "type": "Foreach"
            }
        },
        "contentVersion": "1.0.0.0",
        "outputs": {},
        "parameters": {
            "$connections": {
                "defaultValue": {},
                "type": "Object"
            }
        },
        "triggers": {
            "manual": {
                "inputs": {
                    "schema": {
                        "properties": {
                            "data": {
                                "properties": {
                                    "Alert Type": {
                                        "type": "string"
                                    },
                                    "AlertRuleName": {
                                        "type": "string"
                                    },
                                    "AlertThresholdOperator": {
                                        "type": "string"
                                    },
                                    "AlertThresholdValue": {
                                        "type": "string"
                                    },
                                    "Application ID": {
                                        "type": "string"
                                    },
                                    "IncludeSearchResults": {
                                        "type": "boolean"
                                    },
                                    "LinkToSearchResults": {
                                        "type": "string"
                                    },
                                    "ResultCount": {
                                        "type": "string"
                                    },
                                    "Search Interval": {
                                        "type": "string"
                                    },
                                    "Search Interval End time": {
                                        "type": "string"
                                    },
                                    "Search Interval StartTime": {
                                        "type": "string"
                                    },
                                    "SearchQuery": {
                                        "type": "string"
                                    },
                                    "SearchResults": {
                                        "properties": {
                                            "tables": {
                                                "items": {
                                                    "properties": {
                                                        "columns": {
                                                            "items": {
                                                                "properties": {
                                                                    "name": {
                                                                        "type": "string"
                                                                    },
                                                                    "type": {
                                                                        "type": "string"
                                                                    }
                                                                },
                                                                "required": [
                                                                    "name",
                                                                    "type"
                                                                ],
                                                                "type": "object"
                                                            },
                                                            "type": "array"
                                                        },
                                                        "name": {
                                                            "type": "string"
                                                        },
                                                        "rows": {
                                                            "items": {
                                                                "type": "array"
                                                            },
                                                            "type": "array"
                                                        }
                                                    },
                                                    "required": [
                                                        "name",
                                                        "columns",
                                                        "rows"
                                                    ],
                                                    "type": "object"
                                                },
                                                "type": "array"
                                            }
                                        },
                                        "type": "object"
                                    },
                                    "Severity": {
                                        "type": "string"
                                    },
                                    "Subscription ID": {
                                        "type": "string"
                                    },
                                    "WorkspaceID": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            },
                            "schemaId": {
                                "type": "string"
                            }
                        },
                        "type": "object"
                    }
                },
                "kind": "Http",
                "type": "Request"
            }
        }
    },
    "parameters": {
        "$connections": {
            "value": {
                "eventhubs": {
                    "connectionId": "/subscriptions/SubscriptionID/resourceGroups/MyLogicApp-RG/providers/Microsoft.Web/connections/eventhubs",
                    "connectionName": "eventhubs",
                    "id": "/subscriptions/SubscriptionID/providers/Microsoft.Web/locations/westeurope/managedApis/eventhubs"
                },
                "outlook": {
                    "connectionId": "/subscriptions/SubscriptionID/resourceGroups/MyLogicApp-RG/providers/Microsoft.Web/connections/outlook",
                    "connectionName": "outlook",
                    "id": "/subscriptions/SubscriptionID/providers/Microsoft.Web/locations/westeurope/managedApis/outlook"
                }
            }
        }
    }
}

```
