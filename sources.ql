import javascript
predicate isSource(DataFlow::Node source) {
    exists(DataFlow::Node call |
    call = jquery().getAPropertyRead("fn").getAPropertySource() and
    source = call
    )
}

from DataFlow::Node node
where isSource(node)
select node