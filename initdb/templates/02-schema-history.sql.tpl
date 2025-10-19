-- Usa il DB storico
USE `${HISTORY_DB_NAME}`;

-- Tabelle base
CREATE TABLE IF NOT EXISTS users (
  id            INT AUTO_INCREMENT PRIMARY KEY,
  username      VARCHAR(100) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS query_history (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  user_id    INT          NOT NULL,
  query_text TEXT         NOT NULL,
  db_name    VARCHAR(255) NOT NULL,
  timestamp  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_query_user FOREIGN KEY (user_id) REFERENCES users(id)
);

DELIMITER $$
-- Esempio di procedura
CREATE PROCEDURE interrogazioni_da (IN inizio DATE)
BEGIN
  SELECT * FROM query_history WHERE timestamp > inizio;
END$$
DELIMITER ;
