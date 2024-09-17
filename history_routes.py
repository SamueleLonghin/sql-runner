from flask import Blueprint, render_template, request, redirect, url_for, flash, session
import bcrypt

from db_config import db
from models import User, QueryHistory

# Definisci un Blueprint per le rotte della gestione utenti e storico
history_bp = Blueprint('history_bp', __name__)


# Registrazione
@history_bp.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        hashed_password = bcrypt.hashpw(password.encode(), bcrypt.gensalt())

        # Verifica se l'username esiste già
        existing_user = User.getFromUsername(username)
        if existing_user:
            flash('Username already exists. Please choose another one.', 'danger')
            return redirect(url_for('history_bp.register'))

        # Crea il nuovo utente
        user = User(username=username, password_hash=hashed_password)
        db.session.add(user)
        db.session.commit()
        flash('User registered successfully!', 'success')
        return redirect(url_for('history_bp.login'))

    return render_template('register.html')


# Login
@history_bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        # Cerca l'utente nel database
        user = User.getFromUsername(username)
        if user and bcrypt.checkpw(password.encode(), user.password_hash.encode()):
            # Salva l'utente nella sessione
            session['user_id'] = user.id
            session['username'] = user.username
            flash('Login successful!', 'success')
            return redirect(url_for('query_bp.index'))
        else:
            flash('Invalid username or password', 'danger')

    return render_template('login.html')


# Logout
@history_bp.route('/logout')
def logout():
    session.pop('user_id', None)
    session.pop('username', None)
    flash('You have been logged out.', 'info')
    return redirect(url_for('history_bp.login'))


def log_query_history(db_name, query):
    """
    Registra la query eseguita nella tabella 'query_history' del database selezionato.
    """
    user_id = session['user_id']  # Recupera l'ID utente dalla sessione

    try:
        # Crea un nuovo record di QueryHistory
        query_history = QueryHistory(user_id=user_id, query_text=query, db_name=db_name)
        db.session.add(query_history)
        db.session.commit()  # Salva i dati nel database
    except Exception as e:
        db.session.rollback()  # Rollback in caso di errore
        print(f"Error while logging query: {str(e)}")
