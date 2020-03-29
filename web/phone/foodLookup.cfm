<cfif NOT isJSON(gethttprequestdata().content)>

    <cfsavecontent variable="myFood">
    {
        "fulfillmentText" : "I'm not sure about your request.  I will have to try again later."
    }
    </cfsavecontent>

<cfelse>

    <cfset requestFromGoogle = deserializeJSON(gethttprequestdata().content)>
    <cfset foodTypeResult = entityload("foodType", { foodTypeName = requestFromGoogle.queryResult.outputContexts[1].parameters.ResturantTypes}, true)>

    <cfset mySampleItem = createObject("component", "data.restaurant")>
    <cfset mySampleItem.setFoodType(foodTypeResult)>
    <cfset mySampleItem.setLocation(requestFromGoogle.queryResult.outputContexts[1].parameters.LansingLocations)>
    <cfset rests = entityLoadByExample(mySampleItem)>

    <cfsavecontent variable="myFood">
    {
        "fulfillmentText" : "<cfoutput>There are #arraylen(rests)# places that would probably work. <cfloop array="#rests#" index="x">#x.getrestaurantName()# has <cfif x.getDelivery()>Delivery</cfif> <cfif x.getDelivery() && x.getCarryout()> and </cfif> <cfif x.getCarryout()>Take out</cfif>.</cfloop></cfoutput>."
    }
    </cfsavecontent>

</cfif>

<cfcontent type="application/json" reset="true"><cfoutput>#myFood#</cfoutput>