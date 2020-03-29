<cfset REST = deserializeJSON(gethttprequestdata().content)>
<cfset myID = REST.customerID>
<cfif REST.status EQ "retry">
    <cfsavecontent variable="returnDBCall">
        {
        "status": "retry confirmed"
        }
    </cfsavecontent>
<cfelse>
    <cfset me = entityLoadByPK("restaurant", myID)>
    <cfif REST.status EQ "open">
        <cfset me.setOpenClosed(true)>
    <cfelse>
        <cfset me.setOpenClosed(false)>
    </cfif>
    <cfif (findNoCase("yes",REST.delivery) OR (findNoCase("sure",REST.delivery)))>
        <cfset me.setdelivery(true)>
    <cfelseif (findNoCase("no",REST.delivery) OR (findNoCase("nope",REST.delivery)))>
        <cfset me.setdelivery(false)>
    </cfif>
    <cfif (findNoCase("yes",REST.carryout) OR (findNoCase("sure",REST.carryout)))>
        <cfset me.setcarryout(true)>
    <cfelseif (findNoCase("no",REST.carryout) OR (findNoCase("nope",REST.carryout)))>
        <cfset me.setcarryout(false)>
    </cfif>

    <cfset entitySave(me)>

    <cfsavecontent variable="returnDBCall">
        {
        "status": "success"
        }
    </cfsavecontent>
</cfif>

<cfcontent type="application/json" reset="true"><cfoutput>#returnDBCall#</cfoutput>