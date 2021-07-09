/**
 * @name Cross-site scripting vulnerable plugin
 * @kind path-problem
 * @id js/xss-unsafe-plugin
 */
import javascript
import DataFlow::PathGraph

class Plugin extends DataFlow::Node {
    Plugin(){
        //Defines the last parameter of plugin functions
        exists(DataFlow::FunctionNode call |
            call = jquery().getAPropertyRead("fn").getAPropertySource() and
            this = call.getLastParameter()
        )
    }
}

class Config extends TaintTracking::Configuration {
  Config() { this = "Config" }
  override predicate isSource(DataFlow::Node source) {
    source instanceof Plugin 
  }
  override predicate isSink(DataFlow::Node sink) {
    //Define dollar-functions $ as sink
    sink = jquery().getACall().getArgument(0)
  }
}

from Config config, DataFlow::PathNode source, DataFlow::PathNode sink
where config.hasFlowPath(source, sink)
select sink, source, sink, "Potential XSS vulnerability in plugin."