import javascript
predicate isSource(DataFlow::Node source) {
    exists(DataFlow::FunctionNode call, DataFlow::ParameterNode param |
        call = jquery().getAPropertyRead("fn").getAPropertySource() and
        //Sorting to one parameter prevents duplicate findings in functions with multiple arguments
        param = call.getLastParameter() and
        source = param
    )
}

from DataFlow::Node node
where isSource(node)
select node