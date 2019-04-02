#!/usr/bin/env bash

# requires drill or dig

# set -x
set -euo pipefail

DNS_RECORD="o-o.myaddr.l.google.com"
DNS_NAMESERVER="ns1.google.com"

if [ -x "$(command -v drill)" ]; then
	drill $DNS_RECORD @$DNS_NAMESERVER TXT | grep TXT | tail -n 1 | cut -f 5 | tr -d '"'
elif [ -x "$(command -v dig)" ]; then
	dig +short -t TXT $DNS_RECORD @$DNS_NAMESERVER | tr -d '"'
else
	echo "Error: must have either drill or dig installed."
	exit 1
fi
