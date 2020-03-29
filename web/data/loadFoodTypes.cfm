<cfscript>

    myFoodType = entityNew("foodType");
    myFoodType.setfoodTypeName("Bar-b-que");
    entitySave(myFoodType);

    myFoodType = entityNew("foodType");
    myFoodType.setfoodTypeName("American Food");
    entitySave(myFoodType);

    myFoodType = entityNew("foodType");
    myFoodType.setfoodTypeName("Mexican");
    entitySave(myFoodType);

    myFoodType = entityNew("foodType");
    myFoodType.setfoodTypeName("Pizza");
    entitySave(myFoodType);

    myFoodType = entityNew("foodType");
    myFoodType.setfoodTypeName("Healthy Food");
    entitySave(myFoodType);

</cfscript>
