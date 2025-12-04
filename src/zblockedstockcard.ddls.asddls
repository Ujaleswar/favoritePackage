@AbapCatalog.sqlViewName: 'ZBLOCKED'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Blocked qunatity and value for stock card'
define view ZBlockedStockCard as select from I_StockQuantityCurrentValue_2( P_DisplayCurrency: 'INR') as a

{
    key Product,    
    key Plant,
    MatlWrhsStkQtyInMatlBaseUnit as BlockedStockQuantity,
    StockValueInDisplayCurrency as BlockedStockvalue,
      DisplayCurrency,
      MaterialBaseUnit
 
}
where a.ValuationAreaType = '1'
and a.InventoryStockType = '07'
and  a.InventoryStockType != 'O'
