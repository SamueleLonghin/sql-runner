document.addEventListener('DOMContentLoaded', () => {
    const offlineToggle = document.getElementById('offlineToggle');
    const offlineCookie = document.cookie.split('; ').find(row => row.startsWith('offlineMode='));
    const offlineValue = offlineCookie ? offlineCookie.split('=')[1] === 'true' : false;

    offlineMode = offlineValue;
    offlineToggle.checked = offlineMode;

});


function aggiungiHistory(query) {
    $("#history").prepend('<li class="history-item">' + query + '</li>');
}


$('.history-item').on('click', (e, f) => {
    editor.setValue(e.target.innerHTML)
});

$('.column-list>li, .table-item>strong').on('click', (e, f) => {
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