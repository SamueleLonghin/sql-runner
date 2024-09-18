-- Creare il database history_db
CREATE DATABASE IF NOT EXISTS history_db;

-- Usa il database history_db
USE history_db;

-- Creare la tabella 'users'
CREATE TABLE IF NOT EXISTS users
(
    id            INT AUTO_INCREMENT PRIMARY KEY,
    username      VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS query_history
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    user_id    INT          NOT NULL,
    query_text TEXT         NOT NULL,
    db_name    VARCHAR(255) NOT NULL, -- Campo per il nome del database
    timestamp  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

GRANT ALL PRIVILEGES ON history_db.* TO 'history_user'@'%';