@AbapCatalog.sqlViewName: 'ZSTOCKCARDREP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Final Rpeort For Stock Card'
define view Z_Stock_Card_Report with parameters P_Mdate : abap.dats as select from ZSTA_Report_Slabs2(P_Mdate : $parameters.P_Mdate ) as a
left outer join ZProductStockCard as b on a.Product = b.Product and a.plant = b.Plant
{
    key a.Product,
    key a.plant,
    a.AsOnDate,
    b.ProcurementType,
    b.PurchasingGroup,
    b.SpecialProcurementType,
    b.ProductGroup,
    b.AuthorizationGroup as Shop,
    b.ProductDescription,
    b.blockedstockquantity,
    b.displaycurrency,
    b.blockedstockvalue,
    b.unrestrictedstockquantity,
    b.unrestrictedstockvalue,
    b.UnitOfMeasure,
    a.MatlWrhsStkQtyInMatlBaseUnit,
    a.MaterialBaseUnit,
    a.ValuationAreaType,
    a.InventoryStockType,
    a.InventoryValuationProcedure,
    a.UnitPrice,
    a.BaseUnit,
    a.Currency,
    a.qty_0_90,
    a.Value_0_90,
    a.qty_91_180,
    a.Value_91_180,
    a.qty_Above_180,
    a.Value_Above_180
}
