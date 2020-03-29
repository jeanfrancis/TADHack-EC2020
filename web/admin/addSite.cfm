<cfif isDefined("form.restaurantName")>

    <cfset myFoodItem = entityloadbypk("foodType",form.foodType)>
    <cfset myNewItem = entityNew("restaurant")>
    <cfset myNewItem.setrestaurantName(form.restaurantName)>
    <cfset myNewItem.setopenclosed(form.openclosed)>
    <cfset myNewItem.setWebsite(form.website)>
    <cfset myNewItem.setLocation(form.location)>
    <cfset myNewItem.setphone(form.phone)>
    <cfset myNewItem.setFoodType(myFoodItem)>
    <cfif isDefined("form.carryout")><cfset myNewItem.setcarryout(true)><cfelse><cfset myNewItem.setcarryout(false)></cfif>
    <cfif isDefined("form.delivery")><cfset myNewItem.setdelivery(true)><cfelse><cfset myNewItem.setdelivery(false)></cfif>

    <cfset entitySave(myNewItem)>

    <cfdump var="#myNewItem#">

</cfif>

<form method="post">

    <table>
        <tr>
            <td>Name</td>
            <td><input name="restaurantName" type="text"></td>
        </tr>
        <tr>
            <td>Availability</td>
            <td>
                Carryout:<input name="carryout" type="checkbox" value="true"><br/>
                Delivery:<input name="delivery" type="checkbox" value="true">
            </td>
        </tr>
        <tr>
            <td>Status</td>
            <td><Select name="openclosed"><option value="true">Open</option><option value="false">Closed</option> </Select> </td>
        </tr>
        <tr>
            <td>Website</td>
            <td><input name="website" type="text"> </td>
        </tr>
        <tr>
            <td>Phone Number</td>
            <td><input name="phone" type="text"> </td>
        </tr>
        <tr>
            <td>Location</td>
            <td>
                <input name="location" list="locations">
                <datalist id="locations">
                    <option value="East Lansing" />
                    <option value="Downtown" />
                    <option value="REO Town" />
                    <option value="Old Town" />
                    <option value="South Lansing" />
                    <option value="East Side" />
                    <option value="West Side" />
                </datalist>
            </td>
        </tr>
        <tr>
            <td>Food Type</td>
            <td>
                <select name="foodType">
                    <option value="1">Bar-b-que</option>
                    <option value="2">American Food</option>
                    <option value="3">Mexican</option>
                    <option value="4">Pizza</option>
                    <option value="5">Healthy Food</option>
                    <option value="6">Mediterranean</option>
                    <option value="7">Sushi</option>
                    <option value="8">Coffee</option>
                    <option value="9">Burger</option>
                    <option value="10">Italian</option>
                    <option value="11">Asian</option>
                </select>
            </td>
        </tr>
    </table>
    <input type="submit">
</form>
