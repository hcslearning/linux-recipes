# firewall

**Source**: https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-using-firewalld-on-rocky-linux-8

Regardless of how dynamic your network environment may be, it is still useful to be familiar with the general idea behind each of the predefined zones for firewalld. The predefined zones within firewalld are, in order from least trusted to most trusted:

- **drop**: The lowest level of trust. All incoming connections are dropped without reply and only outgoing connections are possible.
- **block**: Similar to the above, but instead of dropping connections, incoming requests are rejected with an icmp-host-prohibited or icmp6-adm-prohibited message.
- **public**: Represents public, untrusted networks. You don’t trust other computers but may allow selected incoming connections on a case-by-case basis.
- **external**: External networks in the event that you are using the firewall as your gateway. It is configured for NAT masquerading so that your internal network remains private but reachable.
- **internal**: The other side of the external zone, used for the internal portion of a gateway. The computers are fairly trustworthy and some additional services are available.
- **dmz**: Used for computers located in a DMZ (isolated computers that will not have access to the rest of your network). Only certain incoming connections are allowed.
- **work**: Used for work machines. Trust most of the computers in the network. A few more services might be allowed.
- **home**: A home environment. It generally implies that you trust most of the other computers and that a few more services will be accepted.
- **trusted**: Trust all of the machines in the network. The most open of the available options and should be used sparingly.


## Rule permanence

```bash
firewall-cmd --runtime-to-permanent
```

## Firewall Running

```bash
sudo firewall-cmd --state
```

```bash
firewall-cmd --get-default-zone
firewall-cmd --get-active-zones
```

```bash
sudo firewall-cmd --list-all
sudo firewall-cmd --zone=home --list-all
```

```bash
firewall-cmd --get-active-zones
sudo firewall-cmd --zone=home --change-interface=eth0
sudo firewall-cmd --set-default-zone=home
```

```bash
firewall-cmd --get-services
```

Note: You can find more details about each of these services by looking at their associated .xml file within the /usr/lib/firewalld/services directory. For instance, the SSH service is defined like this:

```xml
<?xml version="1.0" encoding="utf-8"?>
<service>
  <short>SSH</short>
  <description>Secure Shell (SSH) is a protocol for logging into and executing commands on remote machines. It provides secure encrypted communications. If you plan on accessing your machine remotely via SSH over a firewalled interface, enable this option. You need the openssh-server package installed for this option to be useful.</description>
  <port protocol="tcp" port="22"/>
</service>
```

```bash
sudo firewall-cmd --zone=public --add-service=http
sudo firewall-cmd --zone=public --list-services
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --runtime-to-permanent
```
