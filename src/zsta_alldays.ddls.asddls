@AbapCatalog.sqlViewName: 'ZSTREP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cobination of all days and ther fields'
define view ZSTA_AllDays with parameters P_MDate : abap.dats 
as select from I_ProductValuationBasic as a 
left outer join I_StockQuantityCurrentValue_2( P_DisplayCurrency: 'INR') as b on a.Product = b.Product and a.ValuationArea=b.Plant 

left outer join ZSTA_0_90(P_Date90 : $parameters.P_MDate )
as c on c.Material = a.Product and c.Plant = a.ValuationArea


left outer join ZSTA_91_180(P_Date90180 : $parameters.P_MDate )
as d on d.Material = a.Product and d.Plant = a.ValuationArea 


left outer join ZAbove180(P_DateAbove180 : $parameters.P_MDate )
as e on e.Material = a.Product and e.Plant = a.ValuationArea


{
    key a.Product,
    a.ValuationArea as plant,
    b.MatlWrhsStkQtyInMatlBaseUnit,
    b.MaterialBaseUnit,
    b.ValuationAreaType,
    b.InventoryStockType,
     a.StandardPrice,
     a.BaseUnit,
     a.Currency,
    a.InventoryValuationProcedure,
    a.MovingAveragePrice,
     case when a.InventoryValuationProcedure = 'V'
    then a.MovingAveragePrice
    else a.StandardPrice end as UnitPrice,
    coalesce(c.Quantity_0_90,0) as Quantity_0_90,
    coalesce(d.Quantity_91_180,0) as Quantity_91_180,
    coalesce(e.Quantity_Above_180,0) as Quantity_Above_180
   
}
where b.ValuationAreaType = '1' 
 and b.InventoryStockType = '01'
 and b.InventorySpecialStockType != 'O'
