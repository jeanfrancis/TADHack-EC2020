<cfset myLocation = entityLoadByPK("restaurant",url.LocationID)>

<cfsavecontent variable="return">
    <document>
        <work>
            <answer/>
            <speak>
                Thank you.  Just a moment while I connect you.
            </speak>
            <wait>3</wait>
            <dial caller-id-number="XXXXXXXXXXXXXXXXXXXX">
                <number><cfoutput>#mid(myLocation.getPhone(),2,11)#</cfoutput></number>
            </dial>
            <hangup/>
        </work>
    </document>
</cfsavecontent>

<cfcontent type="text/xml" reset="true"><cfoutput>#return#</cfoutput>