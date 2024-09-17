import os

from flask import Flask

from db_config import init_app, load_additional_symbols, ADDITIONAL_SYMBOLS
from history_routes import history_bp
from query_routes import query_bp

app = Flask(__name__)
app.secret_key = os.getenv("SECRET_KEY", "mysecretkey")

# Inizializza i database
init_app(app)
load_additional_symbols()

print(ADDITIONAL_SYMBOLS)

# Registra i Blueprint
app.register_blueprint(query_bp)
app.register_blueprint(history_bp)

if __name__ == '__main__':
    app.run(debug=True)
