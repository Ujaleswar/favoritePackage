@AbapCatalog.sqlViewName: 'ZSRTTAMOUNT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Register - Total taxable amount'
define view ZSalesRegisterTT_AMT as select from I_BillingDocumentItem 
{
    key BillingDocument,
    key SalesDocument,
    TransactionCurrency,
    @Semantics.amount.currencyCode: 'TransactionCurrency'
    sum(NetAmount) as TTAmount
}
group by
BillingDocument,
SalesDocument,
TransactionCurrency
