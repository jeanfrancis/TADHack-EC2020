<cfset myFoodList = entityload("restaurant")>

<cfsavecontent variable="myOutput">
    {
    "data":
    [
<cfloop array="#myFoodList#" index="x"><cfoutput>
    [
    "#x.getrestaurantname()#",
    "<cfif x.getcarryout()>Carryout</cfif><cfif x.getcarryout() && x.getdelivery()> / </cfif><cfif x.getdelivery()>Delivery</cfif>",
    "<cfif x.getopenclosed()>Open<cfelse>Closed</cfif>",
    "#x.getwebsite()#",
    "#x.getphone()#",
    "#x.getLocation()#",
    "#x.getFoodType().getFoodTypeName()#",
    "#x.getID()#"
    ] <cfif x.getid() NEQ myFoodList.last().getid()>,</cfif>
</cfoutput></cfloop>
    ]
    }
</cfsavecontent>

<cfcontent type="application/json" reset="true"><cfoutput>#myOutput#</cfoutput>