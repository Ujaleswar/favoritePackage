@AbapCatalog.sqlViewName: 'ZSTAABOVE180'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Above 180'
define view ZAbove180 with parameters P_DateAbove180 : abap.dats as select from Z_STA_DIff( P_Date : $parameters.P_DateAbove180 )
{
    key Material,
    key Plant,

     @Semantics.quantity.unitOfMeasure: 'MaterialBaseUnit'
     sum(QuantityInBaseUnit) as Quantity_Above_180,
       MaterialBaseUnit
}
where daysbtw > 180
group by 
Material,
Plant,
MaterialBaseUnit
