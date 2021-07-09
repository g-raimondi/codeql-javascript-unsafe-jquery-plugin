import javascript
class Plugin extends DataFlow::Node {
    Plugin(){
        exists(DataFlow::Node call |
            call = jquery().getAPropertyRead("fn").getAPropertySource() and
            this = call
        )
    }
}
predicate isSource(DataFlow::Node source) {
    source instanceof Plugin
}

from DataFlow::Node node
where isSource(node)
select node