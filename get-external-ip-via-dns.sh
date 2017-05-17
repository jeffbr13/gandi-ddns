#!/usr/bin/env bash

# requires: dig

dig +short -t txt o-o.myaddr.l.google.com @ns1.google.com | tr -d '"'

