@AbapCatalog.sqlViewName: 'ZSTOCKCARDSLABS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Slabs side for Stock Card report'
define view ZSTA_Report_Slabs with parameters P_Mdate : abap.dats as select from ZSTA_AllDays(P_MDate : $parameters.P_Mdate )
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
    UnitPrice,
    BaseUnit,
    $parameters.P_Mdate as AsOnDate,
    Currency,
    Quantity_0_90,
    Quantity_91_180,
    Quantity_Above_180,
    case when  Quantity_0_90 < MatlWrhsStkQtyInMatlBaseUnit or Quantity_0_90 = MatlWrhsStkQtyInMatlBaseUnit
    then 
    Quantity_0_90
    else 
    MatlWrhsStkQtyInMatlBaseUnit
    end as qty_0_90,
    
    case when  Quantity_0_90 < MatlWrhsStkQtyInMatlBaseUnit or Quantity_0_90 = MatlWrhsStkQtyInMatlBaseUnit
    then 
    Quantity_0_90 * UnitPrice
    else 
    MatlWrhsStkQtyInMatlBaseUnit * UnitPrice
    end as Value_0_90,
    
    case when  Quantity_0_90 < MatlWrhsStkQtyInMatlBaseUnit or Quantity_0_90 = MatlWrhsStkQtyInMatlBaseUnit
    then 
    MatlWrhsStkQtyInMatlBaseUnit - Quantity_0_90
    else 
    0
    end as Sub_Qty_0_90 
  
}
