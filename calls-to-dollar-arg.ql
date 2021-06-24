import javascript

from CallExpr dollarCall, CallExpr dollarArg
where dollarCall.getCalleeName() = "$" and dollarArg = dollarCall.getArgument(0)
select dollarCall, dollarArg