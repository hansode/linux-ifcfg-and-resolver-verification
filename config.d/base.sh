#!/bin/bash
#
# requires:
#  bash
#
#set -e
set -o pipefail
set -x

# functions

## common

function gen_ifcfg_path() {
  local ifname=${1:-eth0}
  local ifcfg_path=/etc/sysconfig/network-scripts/ifcfg

  echo ${ifcfg_path}-${ifname}
}

function install_ifcfg_file() {
  local ifname=${1:-eth0}

  tee $(gen_ifcfg_path ${ifname}) </dev/stdin
}

function render_ifcfg_eth() {
  local ifname=${1:-eth0}
  shift; [[ ${#} == 0 ]] || eval local "${@}"

  cat <<-EOS
	DEVICE=${ifname}
	TYPE=Ethernet
	BOOTPROTO=none
	ONBOOT=yes
	EOS
}

function install_ifcfg_eth() {
  local ifname=${1:-eth0}
  shift; [[ ${#} == 0 ]] || eval local "${@}"

  render_ifcfg_eth ${ifname} | install_ifcfg_file ${ifname}
}

##

install_ifcfg_eth eth1
