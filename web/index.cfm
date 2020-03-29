<html>

    <head>
        <title>FoodFinder - Eat Local!</title>

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        <!-- Data Tables Dependencies -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.20/b-1.6.1/r-2.2.3/sp-1.0.1/datatables.min.css"/>
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.20/b-1.6.1/r-2.2.3/sp-1.0.1/datatables.min.js"></script>

        <!-- APIDaze Dependencies -->
        <script src="https://api4.apidaze.io/javascript/releases/APIdaze-3.0.0-dev-master.js"></script>

        <link rel="stylesheet" href="css/foodfinder.css">
        <script type="text/javascript" src="js/food-finder.js"></script>
    </head>

    <body>

    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
        <a class="navbar-brand" href="#"><img src="images/food-finder-logo.png" alt="FoodFinder"> </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Suggest a restaurant</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Change Location</a>
                    <div class="dropdown-menu" aria-labelledby="dropdown01">
                        <a class="dropdown-item" href="#">Lansing, Michigan</a>
                        <a class="dropdown-item" href="#">Grand Rapids, Michigan</a>
                        <a class="dropdown-item" href="#">Detroit (Corktown)</a>
                        <a class="dropdown-item" href="#">Detroit (Midtown)</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>

    <main role="main" class="container">

        <div class="foodpage">
            <h1>Welcome to FoodFinder!</h1>
            <p class="lead">As entire states are going into lock-down and restricting which places can be open, you may
                be left wondering where you can get some food for pickup or delivery.  Cooking at home is fine, but
                sometimes you just want something different than yet another frozen pizza.  If you get some takeout or
                delivery, make sure to support your local community and buy local! Your local restaurants need the help!</p>
        </div>

        <table id="myFoodList" class="table table-striped table-bordered" style="width: 100%">
            <thead>
                <tr>
                    <td>
                        Restaurant
                    </td>
                    <td>
                        Availability
                    </td>
                    <td>
                        Status
                    </td>
                    <td>
                        Website
                    </td>
                    <td>
                        Phone
                    </td>
                    <td>
                        Locale
                    </td>
                    <td>
                        Type
                    </td>
                    <td>

                    </td>
                </tr>
            </thead>
        </table>

    </main>

    <div class="modal fade" tabindex="-1" role="dialog" id="callPlaceDialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Dial Restaurant</h4>
                </div>
                <div class="modal-body">
                    <p>You have selected to call <i id="restName"> a place </i>.  Make sure you have a microphone and headset ready.
                        It might take a few moments for the call to go through. This call is <em>FREE!</em></p>
                </div>
                <div class="modal-footer">
                    <i id="callStatus"></i>
                    <button id="btnDisconnect" type="button" class="btn btn-danger" onclick="disconnectCall()">Disconnect</button>
                    <button id="btnPlaceCall" type="button" class="btn btn-primary" onclick="placeCall()">Place Call</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    </body>

</html>
