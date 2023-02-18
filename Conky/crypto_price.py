import requests

vs_currencies='usd'
def list_cripto(symbol):
    response=requests.get(f'https://api.coingecko.com/api/v3/simple/price?ids={symbol}&vs_currencies={vs_currencies}&include_24hr_change=true')
    if response.status_code == 200:
        payload=response.json()
        value_crypto_usd=payload[symbol][vs_currencies]
        value_daily_change=payload[symbol]['usd_24h_change']

        #TODO best view
        if symbol == 'ripple' or symbol=='cardano' or symbol == 'matic-network':
            value_crypto_usd=f'{value_crypto_usd:.2f}'
        elif symbol == 'ethereum' or 'bitcoin':
            value_crypto_usd=f'{value_crypto_usd:.0f}'

        #TODO arrows view 
        if value_daily_change > 0:
            value_daily_change=f"{value_daily_change:.2f}↑"
        else:
            value_daily_change=f"{value_daily_change:.2f}↓"

        #TODO position 
        if symbol == 'matic-network':
            final_format=f'{value_crypto_usd:>5}{"24h:":>6}{value_daily_change:>7}'
        else:
            final_format=f'{value_crypto_usd:>7}{"24h:":>6}{value_daily_change:>7}'
        return final_format

print(f"""{'BTC:'}{list_cripto('bitcoin')}
{'ETH:'}{list_cripto('ethereum')}
{'XRP:'}{list_cripto('ripple')}
{'BNB:'}{list_cripto('binancecoin')}
{'ADA:'}{list_cripto('cardano')}
{'DOT:'}{list_cripto('polkadot')}
{'MATIC:'}{list_cripto('matic-network')}""")

