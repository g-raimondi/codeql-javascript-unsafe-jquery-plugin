import javascript
predicate isSource(DataFlow::Node source) {
    exists(DataFlow::FunctionNode call, DataFlow::ParameterNode param |
    call = jquery().getAPropertyRead("fn").getAPropertySource() and
    param = call.getAParameter() and
    source.asExpr() = param.asExpr()
    )
}

from DataFlow::Node node
where isSource(node)
select node