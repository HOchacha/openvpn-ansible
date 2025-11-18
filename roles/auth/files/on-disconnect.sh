#!/usr/bin/env bash
set -eu
logger -t openvpn "DISCONNECT cn=${common_name} ip=${ifconfig_pool_remote_ip}"
exit 0