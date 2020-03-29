client = null;
jsCallReady = false;
lastLocationToDial = 0;

// Page Startup
$(document).ready(function()
{
    table = $('#myFoodList').DataTable(
        {
            "ajax": 'data/foodList.cfm',
            "columnDefs":
                [
                    {
                        "targets": [ 5 ],
                        "visible" : false,
                        "searchable" : true
                    },
                    {
                        "targets": [ 6 ],
                        "visible" : false,
                        "searchable" : true
                    },
                    {
                        "targets": [ 4 ],
                        "searchable" : false,
                        "render": renderPhoneNumber
                    },
                    {
                        "targets": [ 7 ],
                        "searchable" : false,
                        "visible" : false
                    },
                    {
                        "targets": [ 0 ],
                        "render": renderWebsiteOnName
                    },
                    {
                        "targets": [ 3 ],
                        "render" : renderWebsiteCol
                    }
                ]
        } );

    // Hide extra columns from mobile users, and don't load WebRTC client.
    if (detectMobileUser())
    {
        table.column(3).visible(false);
        table.column(2).visible(false);
    }
    else
    {
        client = new APIdaze.CLIENT(
            {
                type: "webrtc",
                wsurl: "wss://fs-us-ny-1.apidaze.io:8082",
                apiKey: "XXXXXXXXXXXXXXX",
                onReady: function()
                {
                    console.log("Got OnReady");
                    jsCallReady = true;
                },
                onDisconnected: function()
                {
                    console.log("Got Disconnect");
                    $("#btnDisconnect").hide();
                    $("#btnPlaceCall").show();
                }
            });

    }
} );

function detectMobileUser()
{
    uagent = navigator.userAgent.toLocaleLowerCase();
    return (uagent.search("iphone")>0 || uagent.search("android")>0);
}

// Call Control Functions

function placeCall()
{
    client.call(
        {
            locationID: String(lastLocationToDial)
        },
        {
            onRinging:ring,
            onAnswer:answer,
            onHangup:hangup}
            );
    $("#callStatus").html("Placing Call... Just a moment...");
    $("#btnPlaceCall").hide();
}

function disconnectCall()
{
    console.log("Disconnecting Call.");
    client.disconnect();
}

function dialLocation(locID, locName)
{
    if (!jsCallReady) { return }
    myNumber = String(locName);
    console.log("Dialing Location " + locID);
    $("#callPlaceDialog").modal();
    $("#restName").html( "(" + myNumber.substr(1,3) + ") " + myNumber.substr(4,3) + "-" + myNumber.substr(7,4)  );
    $("#btnDisconnect").hide();
    $("#btnPlaceCall").show();
    lastLocationToDial = locID;
}


// display function from WebRTC Client

function ring()
{
    console.log("Got Ringing Event");
}

function answer()
{
    console.log("Got Answer Event");
    $("#btnDisconnect").show();
    $("#btnPlaceCall").hide();
    $("#callStatus").html("");
}

function hangup()
{
    console.log("Got Hangup");
    $("#btnDisconnect").hide();
    $("#btnPlaceCall").show();
    $("#callPlaceDialog").modal('hide');
}


// Datatables Display Functions

function renderPhoneNumber( data , type, row )
{
    formattedPhone = "(" + data.substr(2,3) + ") " + data.substr(5,3) + "-" + data.substr(8,4);
    myLoc = row[7];
    if (detectMobileUser())
    {
        myString = "<a href='tel:" + data + "'>" + formattedPhone + "</a>";
        return myString;
    }
    return "<a href='#' onclick='dialLocation(" + myLoc + ", " + data + ")'>" + formattedPhone + "</a>";
}

function renderWebsiteOnName(data, type , row)
{
    if (row[2] === "Closed")
    {
        return "<a class='text-danger' href='" + row[3] + "'>" + data + "</a> <span class='badge badge-danger'>Closed!</span>";
    }
    return "<a href='" + row[3] + "'>" + data + "</a>";
}

function renderWebsiteCol(data, type , row)
{
    return "<a href='" + data + "'>" + data + "</a>";
}




