from db_config import db as database


# Modello per gli utenti
class User(database.Model):
    __bind_key__ = 'history_db'  # Bind per il database history_db
    __tablename__ = 'users'
    id = database.Column(database.Integer, primary_key=True)
    username = database.Column(database.String(100), unique=True, nullable=False)
    password_hash = database.Column(database.String(255), nullable=False)

    @classmethod
    def getFromID(cls, id):
        return User.query.filter_by(id=id).first()

    @classmethod
    def getFromUsername(cls, username):
        return User.query.filter_by(username=username).first()


class QueryHistory(database.Model):
    __bind_key__ = 'history_db'  # Assicurati che questo puntatore sia corretto
    __tablename__ = 'query_history'

    id = database.Column(database.Integer, primary_key=True)
    user_id = database.Column(database.Integer, nullable=False)
    query_text = database.Column(database.Text, nullable=False)
    db_name = database.Column(database.String(255), nullable=False)  # Nome del database
    timestamp = database.Column(database.DateTime, server_default=database.func.now())  # Tempo dell'esecuzione
