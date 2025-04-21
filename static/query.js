initDB("/static/databases/" + selected_db + ".sql");

function renderResult(result) {
    if (result.error) {
        $('#results').html('<p class="text-danger">Error: ' + result.error + '</p>');
    }
    else if (result.columns && result.data && result.count) {
        var table = '<table class="table table-bordered"><thead><tr>';
        for (var i = 0; i < result.columns.length; i++) {
            table += '<th>' + result.columns[i] + '</th>';
        }
        table += '</tr></thead><tbody>';
        for (var i = 0; i < result.data.length; i++) {
            table += '<tr>';
            for (var j = 0; j < result.data[i].length; j++) {
                table += '<td>' + result.data[i][j] + '</td>';
            }
            table += '</tr>';
        }
        table += '</tbody></table>';
        $('#results').html(table);
        $('#count').html("Ottenuti " + result.count + " record")
    } else {
        $('#results').html('<p class="text-danger">Error: ' + "Errore generico" + '</p>');
    }
}



async function toggleOffline() {
    offlineMode = document.getElementById('offlineToggle').checked;

    if (offlineMode) {
        if (!selected_db || selected_db === "Select a database...") {
            alert("Please select a database before enabling offline mode.");
            document.getElementById('offlineToggle').checked = false;
            offlineMode = false;
            return;
        }

        try {
            const response = await fetch(`/static/databases/${selected_db}-tables.json`);
            if (!response.ok) {
                throw new Error("Failed to download tables and name file.");
            }
            const result = await response.json();
            console.log("Downloaded tables and names:", result);
            // Handle the JSON result as needed
        } catch (error) {
            console.error("Error downloading tables and names:", error);
        }
    }
    document.cookie = `offlineMode=${offlineMode}; path=/;`;
}

$('#query-form').on('submit', function (e) {
    e.preventDefault();
    var query = editor.getValue();
    console.log("Eseguo query", query)
    if (offlineMode) {
        console.log("Eseguo query offline", query)
        eseguiQueryOffline(query, renderResult)
    }
    else {
        console.log("Eseguo query remota", query)
        eseguiQueryRemoto(query, renderResult)
    }
    if (enableHistory) {
        aggiungiHistory(query)
    }
});