let db;

// Inizializza sql.js e carica db-schema.sql
async function initDB(db_file) {
    console.log("Scarico offline il db", db_file)
    const SQL = await initSqlJs({
        locateFile: file => `https://cdnjs.cloudflare.com/ajax/libs/sql.js/1.6.2/${file}`
    });

    db = new SQL.Database();

    // Carica il file db-schema.sql
    const res = await fetch(db_file);
    const sqlText = await res.text();

    // Esegui le istruzioni iniziali
    db.run(sqlText);
    console.log("Pronto per l'utilizzo offline del db", db_file)
}

function eseguiQueryOffline(query, postQuery) {
    try {
        const results = db.exec(query);

        if (results.length === 0) {
            res = { error: "Nessun risultato" }
            postQuery(res);
            return;
        }

        res = { data: results[0].values, columns: results[0].columns, count: 100 }
        postQuery(res)
    } catch (e) {
        postQuery({ error: e.message })
    }
}