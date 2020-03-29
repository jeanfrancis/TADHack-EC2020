component persistent="true"
{
    property name="id" column="restaurantID" fieldtype="id" generator="increment";
    property name="restaurantName" ormType="string";
    property name="carryout" ormType="boolean";
    property name="delivery" ormType="boolean";
    property name="openclosed" ormType="boolean";
    property name="website" ormType="string";
    property name="phone" ormType="string";
    property name="location" ormType="string";
    property name="foodType" fieldtype="many-to-one" cfc="foodType";

}
