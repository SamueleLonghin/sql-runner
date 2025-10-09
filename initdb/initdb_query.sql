CREATE database musica;
CREATE database noleggio_auto;
CREATE database aziende;


GRANT SELECT ON musica.* TO 'query_user'@'%';
GRANT SELECT ON noleggio_auto.* TO 'query_user'@'%';
GRANT SELECT ON aziende.* TO 'query_user'@'%';

FLUSH PRIVILEGES;