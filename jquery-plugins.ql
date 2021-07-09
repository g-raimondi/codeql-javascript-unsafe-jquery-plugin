import javascript
from DataFlow::SourceNode call
//Functions $.fn.<some-property> where data flows into.
where call = jquery().getAPropertyRead("fn").getAPropertySource()
select call