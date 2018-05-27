# Load Balancer

### Load-balancing Methods

Round Robin
- Continuously rotates a list of services that are attached to it. 

Weighted round robin
- uses the weight allocation to the server to forward the request.

Least Connection
- Selects the service with the fewest active connections.

Least Response Time
- Selects the service with the fewest active connections and the lowest average response time.

Least Bandwidth
- Selects the service that is currently serving the least amount of traffic, measured in megabits per second (Mbps).

Least Packets 
- Selects the service that has received the fewest packets over a specified period of time.


Source
- selects the server based on the source IP address using the hash to connect it to the matching server.
