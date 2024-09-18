CREATE database musica;
CREATE database noleggio_auto;
CREATE database negozio;


GRANT SELECT ON musica.* TO 'query_user'@'%';
GRANT SELECT ON noleggio_auto.* TO 'query_user'@'%';
GRANT SELECT ON negozio.* TO 'query_user'@'%';

FLUSH PRIVILEGES;