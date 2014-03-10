Linux: ifcfg and resolver verification
======================================

System Requirements
-------------------

+ CentOS 6.4

Scenario Verification
---------------------

1. configure a DNS server on /etc/sysconfig/network-scripts/ifcfg-eth1
2. backup /etc/resolv.conf
3. restart networking
4. compare before /etc/resolv.conf with after /etc/resolv.conf

Getting Started
---------------

```
$ vagrant up
```
