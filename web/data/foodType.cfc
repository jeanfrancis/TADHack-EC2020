component persistent="true"
{
    property name="id" column="foodTypeID" fieldtype="id" generator="increment";
    property name="foodTypeName" ormType="string";

    property name="restaurant" fieldtype="one-to-many" cfc="restaurant" fkcolumn="foodTypeID";
}
