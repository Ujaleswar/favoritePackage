@AbapCatalog.sqlViewName: 'ZSTOCKCARDSLABS1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Slabs for 91 to 180'
define view ZSTA_Report_Slabs1  with parameters P_Mdate : abap.dats as select from ZSTA_Report_Slabs(P_Mdate : $parameters.P_Mdate )
{
    key Product,
    plant,
    MatlWrhsStkQtyInMatlBaseUnit,
    MaterialBaseUnit,
    ValuationAreaType,
    InventoryStockType,
    StandardPrice,
    InventoryValuationProcedure,
    MovingAveragePrice,
    AsOnDate,
    UnitPrice,
    BaseUnit,
    Currency,
    Quantity_0_90,
    Quantity_91_180,
    Quantity_Above_180,
    qty_0_90,
    Value_0_90,
    Sub_Qty_0_90,
    
    case when  Quantity_91_180 < Sub_Qty_0_90 or Quantity_91_180 = Sub_Qty_0_90
    then 
    Quantity_91_180
    else 
    Sub_Qty_0_90
    end as qty_91_180,
    
    case when  Quantity_91_180 < Sub_Qty_0_90 or Quantity_91_180 = Sub_Qty_0_90
    then 
    Quantity_91_180 * UnitPrice
    else 
    Sub_Qty_0_90 * UnitPrice
    end as Value_91_180,
    
    case when  Quantity_91_180 < Sub_Qty_0_90 or Quantity_91_180 = Sub_Qty_0_90
    then 
    Sub_Qty_0_90 - Quantity_91_180
    else 
    0
    end as Sub_Qty_91_180 
    
    
}
