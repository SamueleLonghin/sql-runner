// var tablesAndColumns = {};

// Inizializza CodeMirror per l'editor SQL
var editor = CodeMirror.fromTextArea(document.getElementById('editor'), {
    mode: 'text/x-sql',
    lineNumbers: true,
    theme: 'default',
    autocorrect: false,
    // extraKeys: {"Ctrl-Space": "autocomplete"},
    hintOptions: {
        tables: tablesAndColumns
    }
});

//
// // Caricamento delle tabelle e colonne dal backend
// $.ajax({
//     url: '/schema-info',
//     method: 'GET',
//     success: function (response) {
//         tablesAndColumns = response;
//         editor.setOption('hintOptions', {tables: tablesAndColumns});
//     }
// });

// Aggiunge la funzionalità di autocompletamento su Ctrl-Space
editor.on('inputRead', function (instance, event) {
    if (!instance.state.completionActive && event.keyCode !== 32) {  // Trigger autocompletion
        CodeMirror.commands.autocomplete(editor);
    }
});

// Gestione dell'invio del form
$('#query-form').on('submit', function (e) {
    e.preventDefault();
    var query = editor.getValue();

    $.ajax({
        url: '/execute',
        method: 'POST',
        data: {query: query},
        success: function (response) {
            if (response.error) {
                $('#results').html('<p class="text-danger">Error: ' + response.error + '</p>');
            } else {
                // Genera la tabella dei risultati
                var table = '<table class="table table-bordered"><thead><tr>';
                for (var i = 0; i < response.columns.length; i++) {
                    table += '<th>' + response.columns[i] + '</th>';
                }
                table += '</tr></thead><tbody>';
                for (var i = 0; i < response.data.length; i++) {
                    table += '<tr>';
                    for (var j = 0; j < response.data[i].length; j++) {
                        table += '<td>' + response.data[i][j] + '</td>';
                    }
                    table += '</tr>';
                }
                table += '</tbody></table>';
                $('#results').html(table);
                $('#count').html("Ottenuti "+ response.count + " record")
            }
        },
        error: function (xhr, textStatus, error) {
            if (xhr && xhr.responseJSON) {

                $('#results').html('<p class="text-danger">Error: ' + xhr.responseJSON.error + '</p>');
            } else {
                $('#results').html('<p class="text-danger">Error: ' + error + '</p>');
            }
        }
    });
});


$('.history-item').on('click', (e, f) => {
    console.log(e.target.innerHTML);
    editor.setValue(e.target.innerHTML)
});

$('.column-list>li, .table-item>strong').on('click', (e, f) => {
    console.log(e.target.innerHTML);
    var textToInsert = e.target.innerHTML + ' ';  // Ottieni il testo cliccato

    // Ottieni la posizione corrente del cursore in CodeMirror
    var doc = editor.getDoc();
    var cursor = doc.getCursor();  // Ottieni la posizione corrente del cursore

    // Inserisci il testo alla posizione del cursore
    doc.replaceRange(textToInsert, cursor);

    // Focus sull'editor per continuare a scrivere
    editor.focus();

    $(e.target).css('background-color', '#d4edda').delay(300).queue(function (next) {
        $(this).css('background-color', '');  // Rimuovi l'evidenziazione dopo 100ms
        next();
    });
});


// Funzione per espandere e comprimere le colonne
function toggleExpand(columnId) {
    var column = document.getElementById(columnId);
    var lockButton = document.getElementById('lock-btn-' + columnId);

    // Se la colonna è già espansa e bloccata
    if (column.classList.contains('expanded')) {
        // Rimuovi la classe espansa
        column.classList.remove('expanded');
        // Cambia l'icona del pulsante in un lucchetto aperto
        lockButton.innerHTML = '<i class="fas fa-lock-open"></i>';
    } else {
        // Aggiungi la classe espansa
        column.classList.add('expanded');
        // Cambia l'icona del pulsante in un lucchetto chiuso
        lockButton.innerHTML = '<i class="fas fa-lock"></i>';
    }
}