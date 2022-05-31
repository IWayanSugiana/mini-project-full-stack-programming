from itertools import product
import json
from flask import Flask, request, jsonify, make_response
import requests

application = Flask(__name__)
server1 = "http://127.0.0.1:5000"
server2 = "http://127.0.0.1:7000"

@application.route("/", methods=["GET"])
def index():
    return "welcome to server 3"


@application.route("/order", methods=["GET", "POST"])
def index_order():
  try:
    content = request.get_json()
    id_product = content['id_product']
    id_customer = content['id_product']
    qty = content['qty']
    print(content)

    # get data product and customer to Server 1
    products = requests.request("GET", f"{server1}/products/{id_product}")
    products = products.json()
    customer = requests.request("GET", f"{server1}/customers/{id_customer}")
    customer = customer.json()
  

    # send data payment to Server 2,  
    headers = {
      'Content-Type': 'application/json'
    }

    payload = json.dumps({
      "product": [products['data']["name"]],
      "qty": [qty],
      "price": [products['data']["price"]],
      "description": [products['data']["description"]],
      "returnUrl": "https://google.com",
      "notifyUrl": "https://google.com",
      "cancelUrl": "https://google.com",
      "paymentMethod": "va"
    })

    payment = requests.request("POST", f"{server2}/api/redirect_payment", headers=headers, data=payload)
    payment = payment.json()



    # give response 

    return make_response(
        jsonify({
            "status" : 200,
            "result" :{
              "hai" : "test",
              "product" : products['data'],
              "customer" : customer['data'],
              "payment" : payment['Data']
            },
        })
    )
  except:
      return make_response(
          jsonify({
              "status" : 404,
              "result" : "Error",
          })
      )

# Mendapatkan data customers dari server 1
@application.route("/users", methods=["GET"])
def index_users():  
  try:
    users=None
    users = requests.request("GET", f"{server1}/customers")

    return make_response(
        jsonify({
            "status" : 200,
            "result" : users.json(),
        })
    )
  except:
      return make_response(
          jsonify({
              "status" : 404,
              "result" : users.json(),
          })
      )

@application.errorhandler(404)
def showMessage(error=None):
    message = {
        'status': 404,
        'message': 'Record not found: ' + request.url,
    }
    respone = jsonify(message)
    respone.status_code = 404
    return respone

if __name__ == '__main__':
   application.run(port=6000, debug=True)