@AbapCatalog.sqlViewName: 'ZSTOCKCARDSLABS2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'slabs above 180'
define view ZSTA_Report_Slabs2   with parameters P_Mdate : abap.dats as select from ZSTA_Report_Slabs1(P_Mdate : $parameters.P_Mdate )

{
 key Product,
 plant,
 MatlWrhsStkQtyInMatlBaseUnit,
 MaterialBaseUnit,
 ValuationAreaType,
 InventoryStockType,
 InventoryValuationProcedure,
 UnitPrice,
 AsOnDate,
 BaseUnit,
 Currency,
 Value_0_90,
 qty_91_180,
 Value_91_180,
 qty_0_90,
 
 
   case when  Quantity_Above_180 < Sub_Qty_91_180 or Quantity_Above_180 = Sub_Qty_91_180
    then 
    Quantity_Above_180
    else 
    Sub_Qty_91_180
    end as qty_Above_180,
    
    case when  Quantity_Above_180 < Sub_Qty_91_180 or Quantity_Above_180 = Sub_Qty_91_180
    then 
    Quantity_Above_180 * UnitPrice
    else 
    Sub_Qty_91_180 * UnitPrice
    end as Value_Above_180
}
