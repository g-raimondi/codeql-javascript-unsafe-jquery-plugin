import javascript
from DataFlow::SourceNode plugcall
where plugcall = jquery().getAPropertyRead("fn").getAPropertySource()
select plugcall