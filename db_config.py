import json
import os

from dotenv import load_dotenv
from flask_sqlalchemy import SQLAlchemy

# Carica le variabili di ambiente
load_dotenv()

# Unica istanza di SQLAlchemy
db = SQLAlchemy()

AUTHORIZED_DATABASES = os.getenv('READ_DB_NAMES').split(',')

ADDITIONAL_SYMBOLS = {}


def init_app(app):
    # Configurazione statica per entrambi i database
    app.config['SQLALCHEMY_BINDS'] = {
        'history_db': f"mysql+pymysql://{os.getenv('HISTORY_DB_USER')}:{os.getenv('HISTORY_DB_PASSWORD')}@{os.getenv('HISTORY_DB_HOST')}:{os.getenv('HISTORY_DB_PORT')}/{os.getenv('HISTORY_DB_NAME')}"
    }
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    # Inizializza l'istanza di SQLAlchemy
    db.init_app(app)


# Funzione per generare dinamicamente la stringa di connessione al database di sola lettura
def get_read_only_uri(db_name):
    return f"mysql+pymysql://{os.getenv('READ_DB_USER')}:{os.getenv('READ_DB_PASSWORD')}@{os.getenv('READ_DB_HOST')}:{os.getenv('READ_DB_PORT')}/{db_name}"


def load_additional_symbols():
    """
    Carica simboli extra da un file JSON, ad esempio funzioni SQL o parole chiave.
    """
    global ADDITIONAL_SYMBOLS
    json_path = os.path.join(os.getcwd(), 'static/extra.json')  # Percorso del file JSON
    with open(json_path, 'r') as json_file:
        ADDITIONAL_SYMBOLS.update(json.load(json_file))

    print("Trovati:", ADDITIONAL_SYMBOLS, "In", json_path)
