<cfsavecontent variable="myVariable">
    <document>
        <work>
            <answer/>
            <speak>Thank you for calling.  Just a quick moment while I connect you with an agent.</speak>
            <wait>3</wait>
            <dial caller-id-number="xxxxxxxxxxxxxxx">
                <number>xxxxxxxxxxxxxxxxxxx</number>
            </dial>
            <hangup/>
        </work>
    </document>
</cfsavecontent>

<cfcontent reset="true" type="text/xml"><cfoutput>#myVariable#</cfoutput>
