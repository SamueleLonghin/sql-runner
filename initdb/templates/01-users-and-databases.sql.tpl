-- Utente full sul DB history
CREATE USER IF NOT EXISTS '${HISTORY_DB_USER}'@'%' IDENTIFIED BY '${HISTORY_DB_PASSWORD}';

-- Utente read-only sugli altri 4 DB
CREATE USER IF NOT EXISTS '${QUERY_DB_USER}'@'%' IDENTIFIED BY '${QUERY_DB_PASSWORD}';

-- Creazione dei db
CREATE DATABASE IF NOT EXISTS `${HISTORY_DB_NAME}`;
CREATE DATABASE IF NOT EXISTS `musica`;
CREATE DATABASE IF NOT EXISTS `museo`;
CREATE DATABASE IF NOT EXISTS `aziende`;
CREATE DATABASE IF NOT EXISTS `noleggio_auto`;

-- Permessi completi su history_db allo user_history
GRANT ALL PRIVILEGES ON `${HISTORY_DB_NAME}`.* TO '${HISTORY_DB_USER}'@'%';

-- Permessi di sola lettura sui 4 DB allo user_query
GRANT SELECT ON `musica`.* TO '${QUERY_DB_USER}'@'%';
GRANT SELECT ON `museo`.* TO '${QUERY_DB_USER}'@'%';
GRANT SELECT ON `aziende`.* TO '${QUERY_DB_USER}'@'%';
GRANT SELECT ON `noleggio_auto`.* TO '${QUERY_DB_USER}'@'%';

FLUSH PRIVILEGES;
