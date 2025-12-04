@AbapCatalog.sqlViewName: 'ZSTA91TO180'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Days 91 to 180'
define view ZSTA_91_180 with parameters P_Date90180 : abap.dats as select from Z_STA_DIff( P_Date : $parameters.P_Date90180 )
{

    key Material,
    key Plant,

     @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
     sum(QuantityInBaseUnit) as Quantity_91_180,
       MaterialBaseUnit
}
where daysbtw > 90 and daysbtw < 181
group by 
Material,
Plant,
MaterialBaseUnit
