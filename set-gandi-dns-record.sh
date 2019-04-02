#!/usr/bin/env bash

# requires: HTTPie

# set -x
set -euo pipefail

EXTERNAL_IP=$(./get-external-ip-via-dns.sh || ./get-external-ip-via-http.sh)

DNS_TYPE=${DNS_TYPE:-'A'}
DNS_TTL=${DNS_TTL:-900}

echo "Setting $DNS_RECORD.$DNS_DOMAIN $DNS_TYPE record to \"$EXTERNAL_IP\"…"

http --ignore-stdin put "https://dns.api.gandi.net/api/v5/domains/$DNS_DOMAIN/records/$DNS_RECORD/$DNS_TYPE" \
	X-Api-key:"$GANDI_API_KEY" \
	rrset_ttl:=$DNS_TTL \
	rrset_values:='["'$EXTERNAL_IP'"]'
