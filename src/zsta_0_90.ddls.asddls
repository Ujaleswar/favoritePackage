@AbapCatalog.sqlViewName: 'ZSTA0TO90'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Days 0 to 90'
define view ZSTA_0_90 with parameters P_Date90 : abap.dats as select from Z_STA_DIff( P_Date : $parameters.P_Date90 )


{
    key Material,
    key Plant,

     @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
     sum(QuantityInBaseUnit) as Quantity_0_90,
       MaterialBaseUnit
}
where daysbtw < 91
group by 
Material,
Plant,
MaterialBaseUnit
