import javascript
from DataFlow::FunctionNode plugin, DataFlow::ParameterNode param
//Function and last parameter (for $.fn.<some-property> plugins) where data flows into.
where plugin = jquery().getAPropertyRead("fn").getAPropertySource() and
param = plugin.getLastParameter()
select plugin, param