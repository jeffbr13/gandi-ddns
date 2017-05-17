#!/usr/bin/env bash

# requires: stuntman

stunclient --mode basic stun.nottingham.ac.uk | sed -n -e "s/^Mapped address: \(.*\):.*$/\1/p"

