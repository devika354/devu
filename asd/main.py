from flask import Flask
from public import public
from admin import admin
from health import health
from staff import staff


app=Flask(__name__)

app.register_blueprint(public)
app.register_blueprint(admin)
app.register_blueprint(health)
app.register_blueprint(staff)


app.secret_key='key'

app.run(debug=True,port=5005)
