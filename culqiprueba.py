import requests
import json

url ="https://api.culqi.com/v2/charges"

headers_public = {'Content-type': 'application/json','Authorization':'Bearer pk_test_zbPfFB9YNYzd9GmB'}

headers_privada = {'Content-type': 'application/json','Authorization':'Bearer sk_test_0R0Ik7VbS6NKV7TD'}

data={"amount": 1000,"currency_code": "PEN","email": "joelunmsm@gmail.com","source_id": "tkn_test_Mt04HRxhtr6r8DPr"}

r = requests.post(url, data=json.dumps(data), headers=headers_privada)

print r.text



