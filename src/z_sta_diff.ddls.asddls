@AbapCatalog.sqlViewName: 'ZSTADIFF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Calculated based on difference'
define view Z_STA_DIff with parameters P_Date : abap.dats
as select from I_MaterialDocumentItem_2 
{

    key Material,
    key Plant,
   QuantityInBaseUnit,
   MaterialBaseUnit,
  abs(dats_days_between(:P_Date , PostingDate))  as daysbtw
   

}
