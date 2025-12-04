@AbapCatalog.sqlViewName: 'ZPRDSTOCKCARD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aditional Fields for Stock Card'
define view ZProductStockCard as select from I_ProductPlantBasic as a 
left outer join zblocked as b on b.product = a.Product and b.plant = a.Plant
left outer join zunrestricted as c on c.product = a.Product and c.plant = a.Plant
{
    key a.Product,
        key a.Plant,
        a.ProcurementType,
        a.PurchasingGroup,
        a.SpecialProcurementType,
        a._Product.ProductGroup,
        a._Product.AuthorizationGroup,
        a._Text.ProductDescription,
        b.blockedstockquantity,
        b.displaycurrency,
        b.blockedstockvalue,
        c.unrestrictedstockquantity,
        c.unrestrictedstockvalue,
        case c.materialbaseunit when  'ST'
        then 'PC' else c.materialbaseunit
        end as UnitOfMeasure  ,
        c.inventorystocktype
        
}

