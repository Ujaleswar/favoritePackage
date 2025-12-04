@AbapCatalog.sqlViewName: 'ZSTATOTALQTY'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'STA Total Quantity'
define view ZSTA_TotalQuantiy
  as select from I_MaterialDocumentItem_2 as a
  
  
{
  
  key a.Material,
  key a.Plant,
        a.MaterialDocument,
        a.MaterialDocumentItem,
      a.EntryUnit as Meins,
      a.QuantityInBaseUnit,
      a.TotalGoodsMvtAmtInCCCrcy,
      a.DebitCreditCode,
      @Semantics.quantity.unitOfMeasure: 'Meins'
      sum(a.QuantityInBaseUnit) as Quantity,
      a.CompanyCodeCurrency,
      @Semantics.amount.currencyCode: 'CompanyCodeCurrency'
      sum(a.TotalGoodsMvtAmtInCCCrcy) as Amount
      
      
}
group by
  a.Material,
  a.Plant,
  a.EntryUnit,
  a.DebitCreditCode,
  a.CompanyCodeCurrency,
  a.QuantityInBaseUnit,
  a.TotalGoodsMvtAmtInCCCrcy,
  a.MaterialDocument,
  a.MaterialDocumentItem
