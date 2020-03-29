<cfsavecontent variable="bodyOutput">
    {
    "flowId" : "XXXXXXXXXXXXXXXXXXXXXXXX",
    "DNIS": "XXXXXXXXXXXXXXXXXXXXX",
    "customerID" : "4",
    "ANI" : "XXXXXXXXXXXXXXXXXXXX"
    }
</cfsavecontent>

<cfhttp url="https://app.smart-flows.intelepeer.com/v2/api/apitriggers" method="POST">
    <cfhttpparam type="header" name="Content-Type" value="application/json">
    <cfhttpparam type="body" value="#bodyOutput#">
</cfhttp>

<cfdump var="#cfhttp#">

<a href="verify.cfm">[Go Back]</a>
