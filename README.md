# OpenVPN Solid Cloud Ansible

This Ansible playbook automates the installation and configuration of an OpenVPN server on a Linux host. It sets up a secure VPN server with PKI (Public Key Infrastructure), firewall rules, and client certificate generation. The playbook is designed to work with Debian-based and Red Hat-based distributions.

## Features

- Automated OpenVPN server installation and configuration.
- PKI setup using EasyRSA for certificate management.
- Firewall configuration (iptables or firewalld).
- Support for IPv4 and IPv6 forwarding.
- Client certificate issuance via a separate playbook.
- Customizable DNS push options and encryption settings.

## Requirements

### Local Machine (Ansible Control Node)
- Ansible 2.9 or later.
- SSH access to the target OpenVPN server host.
- Python 3.x (for Ansible modules).

### Target Server
The playbook installs the following packages on the target server automatically:
- `openvpn`
- `openssl`
- `ca-certificates`
- `curl`
- `tar`
- (For RHEL/Fedora: `firewalld` if `openvpn_use_firewalld` is true)
- `sshpass` (if you are trying to authenticate with password)

Ensure the target server has internet access for downloading EasyRSA and other dependencies.

## Installation

1. Clone or download this repository to your local machine.
2. Edit the inventory file to specify your OpenVPN server host. Example:
   - Use `inventory/hosts.ini` for production or `inventory/test-boan.kloud.zone.ini` for testing.
3. Customize variables in `group_vars/openvpn.yml` as needed (e.g., port, protocol, DNS settings).
4. Run the playbook to install and configure OpenVPN.

## Usage

### Initial OpenVPN Server Setup
To install and configure the OpenVPN server, run the main playbook:

```bash
ansible-playbook -i hosts.ini site.yml --ask-pass
```

Replace inventory/hosts.ini with your desired inventory file (e.g., inventory/test-boan.kloud.zone.ini for testing).

This will:
- install required packages.
- Set up EasyRSA and generate PKI certificates.
- Configure OpenVPN server settings.
- Enable firewall rules and IP forwarding.
- Start the OpenVPN service.
- Issuing Client Certificates
- To generate a new client certificate and create an .ovpn profile:

Replace myclient with the desired client name.
The client profile will be saved on the server at `/home/<ansible_user>/clients/<client_name>.ovpn`.
Download the `.ovpn` file and import it into your OpenVPN client.

