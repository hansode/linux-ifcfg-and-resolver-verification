#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

function append_networking_param() {
  local ifname=${1:-eth0}
  shift; [[ ${#} == 0 ]] || eval local "${@}"

  cat <<-EOS | tee -a /etc/sysconfig/network-scripts/ifcfg-${ifname}
	IPADDR=${ip}
	NETMASK=${mask}
	$([[ -z "${dns}" ]] || echo DNS1=${dns})
	EOS
}

node=node01

append_networking_param eth1 ip=10.126.5.43 mask=255.255.255.0 dns=10.126.5.21

##

/etc/init.d/network restart

##
