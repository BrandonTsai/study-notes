# DNS Concept

### DNS name server:
- stores the DNS records for a domain; 
- uses the **UDP** port **53** to serve requests

### Resource Records (RRs):


| Type | Description | Function |
| ---- | ----------- | -------- |
| SOA | Start (Zone) of Authority | authoritative information about a DNS zone,<br> - primary name server <br> - several timers relating to refreshing the zone. |
| A | IP addresses  | map hostnames to an 32-bit IPv4 address |
| AAAA | **IPv6** IP addresses  | map hostnames to an   128-bit Ipv6 address |
| CAA | (DNS) Certification Authority Authorization | constraining acceptable CAs for a host/domain |
| MX | mail exchangers | Maps a domain name to a list of MTA (message transfer agents) for that domain |
| NS | name servers  | assign a DNS zone to use the given authoritative name servers <br> - Used by Top level domain server <br> - direct traffic to the authoritative Contebt Domain servers |
| CNAME | Canonical name record <br> domain name aliases | Alias of one name to another <br> -> an alias for only the exact name |
| DNAME |  | Alias for a name and all its subnames|


### TTL (Time-To-Live)
The length that a DNS record cached on the Resolving server

- an expiration time after which the results must be discarded or refreshed. 
- changes to DNS records do not propagate throughout the network immediately, 
    - require all caches to expire and to be refreshed after the TTL.

### Reverse DNS lookup

- Used when IP address is known, but do not know the associated domain name 
- querying of the Domain Name System (DNS) to determine the domain name associated with an IP address


# Linux local Files Related to DNS:

`/etc/resolv.conf` : Add or Change DNS server information 

`/etc/hosts` : Local DNS service

`/etc/named.conf `: the settings for the BIND ((Berkeley Internet Name Domain) name server