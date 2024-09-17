import os

from flask import Blueprint, request, jsonify, session, abort
from flask import redirect, url_for, render_template
from sqlalchemy import create_engine, text, inspect

from db_config import get_read_only_uri, db, AUTHORIZED_DATABASES, ADDITIONAL_SYMBOLS
from history_routes import log_query_history
from models import QueryHistory, User

# Definisci un Blueprint per le rotte delle query

# Definisci un Blueprint per le rotte delle query
query_bp = Blueprint('query_bp', __name__)


@query_bp.route('/')
def index():
    if 'user_id' not in session:
        return redirect(url_for('history_bp.login'))

    # Elenco dei database disponibili
    available_dbs = AUTHORIZED_DATABASES
    selected_db = session.get('selected_db', None)

    # Verifica che il database selezionato sia nella lista dei database autorizzati
    if selected_db not in AUTHORIZED_DATABASES:
        session.pop('selected_db')
        return jsonify({'error': 'Unauthorized or non-existent database selected'}), 403

    # Recupera lo storico delle query per l'utente loggato
    user_id = session['user_id']
    user = User.getFromID(user_id)
    query_history = [qh.query_text for qh in
                     QueryHistory.query.filter_by(user_id=user_id, db_name=selected_db).order_by(
                         QueryHistory.timestamp.desc()).all()]
    tables = get_tables_and_columns(selected_db)
    print(tables)

    # Carica simboli aggiuntivi dal file JSON
    additional_symbols = ADDITIONAL_SYMBOLS
    print(additional_symbols)

    # Combina i dati delle tabelle con i simboli extra
    tables_and_columns = {**tables, **additional_symbols}

    return render_template('index.html', available_dbs=available_dbs, selected_db=selected_db,
                           query_history=query_history, user=user, tables=tables, tables_and_columns=tables_and_columns)


@query_bp.route('/choose_db', methods=['POST'])
def choose_db():
    db_name = request.form.get('db_name')
    if db_name:
        # Verifica che il database selezionato sia nella lista dei database autorizzati
        if db_name in AUTHORIZED_DATABASES:
            session['selected_db'] = db_name
    return redirect(url_for('query_bp.index'))


# Nuovo endpoint per recuperare i nomi delle tabelle e delle colonne
@query_bp.route('/schema-info', methods=['GET'])
def schema_info():
    try:
        db_name = session.get('selected_db')
        if not db_name:
            return jsonify({'error': 'No database selected'}), 400

        # Verifica che il database selezionato sia nella lista dei database autorizzati
        if db_name not in AUTHORIZED_DATABASES:
            session.pop('selected_db')
            return jsonify({'error': 'Unauthorized or non-existent database selected'}), 403

        return jsonify(get_tables_and_columns(db_name))
    except Exception as e:
        return jsonify({'error': str(e)}), 400


@query_bp.route('/execute', methods=['POST'])
def execute_query():
    if 'user_id' not in session:
        return jsonify({'error': 'Not authenticated'}), 403

    db_name = session.get('selected_db')
    if not db_name:
        return jsonify({'error': 'No database selected'}), 400

    # Verifica che il database selezionato sia nella lista dei database autorizzati
    if db_name not in AUTHORIZED_DATABASES:
        session.pop('selected_db')
        return jsonify({'error': 'Unauthorized or non-existent database selected'}), 403
    try:
        query = request.form['query']

        # Registra la query eseguita nella cronologia del database selezionato
        log_query_history(db_name, query)

        # Crea un'istanza del motore per il database selezionato
        engine = create_engine(get_read_only_uri(db_name))
        with engine.connect() as connection:
            result = connection.execute(text(query))
            columns = result.keys()
            data = [list(row) for row in result.fetchall()]

        # Restituisce i dati e le colonne come JSON
        return jsonify({'columns': list(columns), 'data': data})
    except Exception as e:
        return jsonify({'error': str(e)}), 400


def get_tables_and_columns(db_name):
    """
    Recupera tutte le tabelle e le relative colonne per il database selezionato.
    """
    engine = create_engine(get_read_only_uri(db_name))
    inspector = inspect(engine)

    tables = {}
    for table_name in inspector.get_table_names():
        columns = [col['name'] for col in inspector.get_columns(table_name)]
        tables[table_name] = columns
    return tables
