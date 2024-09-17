from flask import Flask, render_template, request, jsonify
from flask_sqlalchemy import SQLAlchemy
import os

from sqlalchemy import text
from sqlalchemy.engine.result import RMKeyView

app = Flask(__name__)

# Configurazione del database
db_host = os.getenv('DB_HOST', 'localhost')
db_port = os.getenv('DB_PORT', '3306')  # Porta predefinita 3306
db_name = os.getenv('DB_NAME', 'testdb')
db_user = os.getenv('DB_USER', 'root')
db_password = os.getenv('DB_PASSWORD', 'example')

print(f"COnnetto a mysql+pymysql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}")

# Configurazione del database
app.config['SQLALCHEMY_DATABASE_URI'] = f"mysql+pymysql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}"

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)


# Route principale per visualizzare la pagina
@app.route('/')
def index():
    return render_template('index2.html')


# Endpoint per eseguire le query SQL
@app.route('/execute', methods=['POST'])
def execute():
    try:
        query = request.form['query']
        result = db.session.execute(text(query))
        columns = result.keys()
        # Trasforma ogni riga in una lista o dizionario serializzabile
        data = []
        for row in result.fetchall():
            # print("Oggetto:", row)
            data.append([str(item) for item in row])  # Converte ogni oggetto in una stringa se non serializzabile

        # Restituisce i dati e le colonne come JSON
        return jsonify({'columns': list(columns), 'data': data})
    except Exception as e:
        return jsonify({'error': str(e)}), 400


# Nuovo endpoint per recuperare i nomi delle tabelle e delle colonne
@app.route('/schema-info', methods=['GET'])
def schema_info():
    try:
        tables_query = db.session.execute(text("SHOW TABLES"))
        tables = [row[0] for row in tables_query]

        schema = {}
        for table in tables:
            columns_query = db.session.execute(text(f"SHOW COLUMNS FROM {table}"))
            columns = [row[0] for row in columns_query]
            schema[table] = columns

        return jsonify(schema)
    except Exception as e:
        return jsonify({'error': str(e)}), 400


if __name__ == '__main__':
    app.run(debug=True)
