# WARNING : kata users di nama function belum diganti

from databases import index, show, store, update, destroy
from flask import Flask, request, jsonify

application = Flask(__name__)

# Routing khusus users
@application.route('/customers')
def index_users():   
   sql = "SELECT * FROM tb_customer ORDER BY id_customer DESC"
   return index(sql)

@application.route('/customers/<int:id>')
def show_user(id):   
   sql = 'SELECT * FROM tb_customer WHERE id_customer=%s'
   return show(sql, id)

@application.route('/customers', methods=['POST'])
def store_user():
   content = request.get_json()
   val = (content["name"], content["address"], content["phone_number"], content["email"])
   sql = "INSERT INTO tb_customer (name, address, phone_number, email) VALUES (%s, %s, %s, %s)"
   return store(sql, val)

@application.route('/customers/<int:id>', methods=['PUT'])
def update_user(id):
   sql_show = 'SELECT * FROM tb_customer WHERE id_customer=%s'
   sql_update = "UPDATE tb_customer SET name=%s, address=%s, phone_number=%s, email=%s WHERE id_customer=%s"
   content = request.get_json()
   val = (content["name"], content["address"], content["phone_number"], content["email"], id)
   return update(sql_show, id, sql_update, val)

@application.route('/customers/<int:id>', methods=['DELETE'])
def destroy_user(id):
   sql = 'DELETE FROM tb_customer WHERE id_customer=%s'
   val = id
   return destroy(sql, val)

# Routing khusus products


@application.route('/products')
def index_products():   
   sql = "SELECT * FROM tb_product INNER JOIN tb_supplier ON tb_product.id_supplier=tb_supplier.id_supplier"
   return index(sql)

@application.route('/products/<int:id>')
def show_products(id):   
   sql = 'SELECT * FROM tb_product INNER JOIN tb_supplier ON tb_product.id_supplier=tb_supplier.id_supplier WHERE id_product=%s'
   return show(sql, id)

@application.route('/products', methods=['POST'])
def store_products():
   content = request.get_json()
   val = (content["id_supplier"], content["name"], content["price"], content["description"], content["stock"], content["rate"], content["category"])
   sql = "INSERT INTO tb_product (id_supplier, name, price, description, stock, rate, category) VALUES (%s, %s, %s, %s, %s, %s, %s);"
   return store(sql, val)

@application.route('/products/<int:id>', methods=['PUT'])
def update_products(id):
   sql_show = 'SELECT * FROM tb_product WHERE id_product=%s'
   sql_update = "UPDATE tb_product SET id_supplier=%s, name=%s, price=%s, description=%s, stock=%s, rate=%s, category=%s WHERE id_product=%s"
   content = request.get_json()
   val = (content["id_supplier"], content["name"], content["price"], content["description"], content["stock"], content["rate"], content["category"], id)
   return update(sql_show, id, sql_update, val)

@application.route('/products/<int:id>', methods=['DELETE'])
def destroy_products(id):
   sql = 'DELETE FROM tb_product WHERE id_product=%s'
   val = id
   return destroy(sql, val)


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
   application.run(port=5000, debug=True)

