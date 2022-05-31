import pymysql.cursors
from flask import request, jsonify, make_response, abort

conn = cursor = None

#fungsi koneksi database
def openDb():
   global conn, cursor
   conn = pymysql.connect(host='localhost',
                             user='root',
                             password='',
                             database='db_mini_project',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)
   cursor = conn.cursor()	

#fungsi untuk menutup koneksi
def closeDb():
   global conn, cursor
   cursor.close()
   conn.close()

# fungsi index() untuk menampilkan data dari database
def index(sql, val = None):   
   openDb()
   cursor.execute(sql, val)
   results = cursor.fetchall()
   return make_response(jsonify({"data": results, "status_code": 200}), 200)

# fungsi show() untuk menampilkan satu data dari database berdasarkan /url
def show(sql, val = None):   
   openDb()
   cursor.execute(sql, val)
   results = cursor.fetchone()
   return make_response(jsonify({"data": results, "status_code": 200}), 200)

# fungsi store() untuk mengisi data
def store(sql, val):
   if request.method == 'POST':
      openDb()
      cursor.execute(sql, val)
      conn.commit()
      closeDb()
      return make_response(jsonify({"deskripsi": "Berhasil", "status_code": 200}))
   else:
      return make_response(jsonify({"deskripsi": "Tidak behasil", "status_code": 401}))

# fungsi update() untuk mengisi data
def update(sql_show, val_show, sql_update, val_update):
   openDb()
   cursor.execute(sql_show, val_show)
   data = cursor.fetchone()
   if data is None:
      abort(404)
   if request.method == 'PUT':
      cursor.execute(sql_update, val_update)
      conn.commit()
      closeDb()
      return make_response(jsonify({"deskripsi": "Berhasil", "status_code": 200}))
   else:
      closeDb()
      return make_response(jsonify({"deskripsi": "Tidak behasil", "status_code": 401}))

# fungsi destroy() untuk menghapus data
def destroy(sql, val):
   openDb()
   cursor.execute(sql, val)
   conn.commit()
   closeDb()
   return make_response(jsonify({"deskripsi": "Berhasil", "status_code": 200}))
