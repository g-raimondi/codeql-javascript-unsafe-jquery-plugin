import javascript
predicate isSource(DataFlow::Node source) {
    exists(DataFlow::FunctionNode call |
    call = jquery().getAPropertyRead("fn").getAPropertySource() and
    source = call.getAParameter()
    )
}

from DataFlow::Node node
where isSource(node)
select node