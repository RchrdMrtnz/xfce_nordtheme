#!/bin/bash
RESULT= ping -qc1 1.1.1.1 2>&1 | awk -F'/' 'END{ print (/^rtt/? "Cloudflare: "$5"ms":"Cloudflare: 404") }'
echo $RESULT