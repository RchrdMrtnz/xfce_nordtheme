#!/bin/sh

API="https://api.kraken.com/0/public/Ticker"

bitcoin=$(curl -sf $API?pair=BTCUSD | jq -r ".result.XXBTZUSD.c[0]")
bitcoin=$(LC_ALL=C printf "%.2f" "$bitcoin")
etherium=$(curl -sf $API?pair=ETHUSD | jq -r ".result.XETHZUSD.c[0]")
etherium=$(LC_ALL=C printf "%.2f" "$etherium")
cardano=$(curl -sf $API?pair=ADAUSD | jq -r ".result.ADAUSD.c[0]")
cardano=$(LC_ALL=C printf "%.2f" "$cardano")
dot=$(curl -sf $API?pair=DOTUSD | jq -r ".result.DOTUSD.c[0]")
dot=$(LC_ALL=C printf "%.2f" "$dot")
MATIC=$(curl -sf $API?pair=MATICUSD | jq -r ".result.MATICUSD.c[0]")
MATIC=$(LC_ALL=C printf "%.2f" "$MATIC")


echo "BTC: $bitcoin"
echo "ETH: $etherium"
echo "ADA: $cardano"
echo "DOT: $dot"
echo "MATIC: $MATIC"
