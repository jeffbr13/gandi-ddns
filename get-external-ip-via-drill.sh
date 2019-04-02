#!/usr/bin/env bash

# requires drill

drill o-o.myaddr.l.google.com @ns1.google.com TXT | grep TXT | tail -n 1 | cut -f 5 | tr -d '"'