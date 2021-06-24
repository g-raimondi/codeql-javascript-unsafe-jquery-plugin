import javascript

from CallExpr dollarCall, Expr dollarArg
where dollarArg = dollarCall.getArgument(0)
select dollarArg