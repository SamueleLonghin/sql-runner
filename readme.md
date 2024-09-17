## Setup History DB

<code>
-- Creare il database history_db
CREATE DATABASE IF NOT EXISTS history_db;

-- Usa il database history_db
USE history_db;

-- Creare la tabella 'users'
CREATE TABLE IF NOT EXISTS users (
id INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(100) NOT NULL UNIQUE,
password_hash VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS query_history (
id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
query_text TEXT NOT NULL,
db_name VARCHAR(255) NOT NULL, -- Campo per il nome del database
timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Creare l'utente per la gestione dello storico
CREATE USER 'history_user'@'%' IDENTIFIED BY 'history_password';
GRANT ALL PRIVILEGES ON history_db.* TO 'history_user'@'%';
</code>

## Setup read only db

<code>
CREATE DATABASE db1;
CREATE DATABASE db2;
CREATE DATABASE db3;
CREATE DATABASE history_db;

-- Creare l'utente di sola lettura
CREATE USER 'readonly_user'@'%' IDENTIFIED BY 'readonly_password';
GRANT SELECT ON db1.* TO 'readonly_user'@'%';
GRANT SELECT ON db2.* TO 'readonly_user'@'%';
GRANT SELECT ON db3.* TO 'readonly_user'@'%';
</code>