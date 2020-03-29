<cfset myListing = entityload("restaurant")>

<table border="1">
    <thead>
    <tr>
        <th>Name</th>
        <th>Open</th>
        <th>Carryout / Delivery</th>
        <th>Phone Number</th>
        <th>Locale</th>
        <th>Type</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <cfloop array="#myListing#" index="x">
    <cfoutput>
    <tr>
        <td>#x.getrestaurantName()#</td>
        <td>#x.getopenclosed()#</td>
        <td>#x.getCarryout()# / #x.getDelivery()#</td>
        <td>#x.getphone()#</td>
        <td>#x.getLocation()#</td>
        <td>#x.getFoodType().getFoodTypeName()#</td>
        <td><a href="validate.cfm?id=#x.getID()#">[Validate]</a> <a href="edit.cfm">[Edit]</a> </td>
    </tr>
    </cfoutput>
    </cfloop>
    </tbody>
</table>
<a href="addSite.cfm">[Add New]</a> <a href="validate.cfm">[Validate All Sites]</a>