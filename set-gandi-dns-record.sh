#!/usr/bin/env bash

# requires: HTTPie

http put "https://dns.api.gandi.net/api/v5/zones/$GANDI_ZONE_UUID/records/@/A" X-Api-key:"$GANDI_API_KEY" rrset_ttl:=900 rrset_values:='["'$(./get-external-ip-via-stun.sh)'"]'

