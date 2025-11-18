#!/usr/bin/env bash
set -eu
# OpenVPN가 환경변수로 정보 제공
# common_name, ifconfig_pool_remote_ip, trusted_ip 등 사용 가능
logger -t openvpn "CONNECT cn=${common_name} ip=${ifconfig_pool_remote_ip} from=${trusted_ip}"
exit 0