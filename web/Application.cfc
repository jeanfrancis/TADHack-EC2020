component
{
    this.name = "TADHack-FoodFinder";
    this.sessionmanagement = "true";
    this.sessiontimeout = createTimespan(0,1,0,0);
    this.applicationtimeout = createTimespan(1,0,0,0);
    this.ormenabled = true;
    this.ormsettings =
    {
        datasource="restaurant",
        logSQL="true",
        dbcreate="update",
        cfclocation="data"
    };
}
