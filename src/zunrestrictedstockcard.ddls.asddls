@AbapCatalog.sqlViewName: 'ZUNRESTRICTED'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Unrestricted quantity and value for stock crad'
define view ZUnrestrictedStockCard as select from   
I_StockQuantityCurrentValue_2( P_DisplayCurrency: 'INR') as a
{
    key Product,
    key Plant,
    MaterialBaseUnit,
    MatlWrhsStkQtyInMatlBaseUnit as UnrestrictedStockQuantity,
    DisplayCurrency,
    StockValueInDisplayCurrency as UnrestrictedStockvalue,
    InventoryStockType
    
    
    
}
where a.ValuationAreaType = '1'
and a.InventoryStockType = '01'
and a.InventorySpecialStockType != 'O'
