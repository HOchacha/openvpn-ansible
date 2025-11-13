# Variables
Key variables can be customized in group_vars/openvpn.yml:

- openvpn_port: OpenVPN listening port (default: 1194).
- openvpn_proto: Protocol, "udp" or "tcp" (default: "udp").
- openvpn_dns_choice: DNS push option (e.g., "google", "cloudflare", "system").
- openvpn_client_name: Default client name for initial certificate.
- openvpn_use_firewalld: Use firewalld instead of iptables (default: false).
- openvpn_use_tls_crypt: Enable TLS crypt for added security (default: true).
- openvpn_nat_subnet_v4: VPN subnet (default: "10.8.0.0/24").
