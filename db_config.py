import json
import os

from dotenv import load_dotenv
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import create_engine, text

# Carica le variabili di ambiente
load_dotenv()

# Unica istanza di SQLAlchemy
db = SQLAlchemy()

AUTHORIZED_DATABASES = []

ADDITIONAL_SYMBOLS = {}


def init_app(app):
    # Configurazione statica per entrambi i database
    app.config['SQLALCHEMY_BINDS'] = {
        'history_db': f"mysql+pymysql://{os.getenv('HISTORY_DB_USER')}:{os.getenv('HISTORY_DB_PASSWORD')}@{os.getenv('HISTORY_DB_HOST')}:{os.getenv('HISTORY_DB_PORT_I')}/{os.getenv('HISTORY_DB_NAME')}"
    }
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    # Inizializza l'istanza di SQLAlchemy
    db.init_app(app)

    print("Connesso a ",
          f"mysql+pymysql://{os.getenv('HISTORY_DB_USER')}:{os.getenv('HISTORY_DB_PASSWORD')}@{os.getenv('HISTORY_DB_HOST')}:{os.getenv('HISTORY_DB_PORT')}/{os.getenv('HISTORY_DB_NAME')}")

    load_additional_symbols()
    load_autorized_databases()


# Funzione per generare dinamicamente la stringa di connessione al database di sola lettura
def get_read_only_uri(db_name=""):
    return f"mysql+pymysql://{os.getenv('QUERY_DB_USER')}:{os.getenv('QUERY_DB_PASSWORD')}@{os.getenv('QUERY_DB_HOST')}:{os.getenv('QUERY_DB_PORT_I')}/{db_name}"


def load_additional_symbols():
    """
    Carica simboli extra da un file JSON, ad esempio funzioni SQL o parole chiave.
    """
    global ADDITIONAL_SYMBOLS
    json_path = os.path.join(os.getcwd(), 'static/extra.json')  # Percorso del file JSON
    with open(json_path, 'r') as json_file:
        ADDITIONAL_SYMBOLS.update(json.load(json_file))

    print("Trovati:", ADDITIONAL_SYMBOLS, "In", json_path)


def load_autorized_databases():
    global AUTHORIZED_DATABASES
    # Connessione al database (modifica 'mysql+pymysql' in base al tuo DBMS)
    print("Connetto a Query DB:", get_read_only_uri())
    engine = create_engine(get_read_only_uri())

    # Query per ottenere i nomi dei database
    query = text("SHOW DATABASES")

    # Esecuzione della query
    with engine.connect() as connection:
        result = connection.execute(query)
        excluded_databases = {'information_schema', 'mysql', 'performance_schema', 'phpmyadmin'}
        AUTHORIZED_DATABASES.extend([row[0] for row in result if row[0] not in excluded_databases])

    print("Disponibili i seguenti databases:", AUTHORIZED_DATABASES)
