// Inizializza CodeMirror per l'editor SQL
var tablesAndColumns = tablesAndColumns || {};
var editor = CodeMirror.fromTextArea(document.getElementById('editor'), {
    mode: 'text/x-sql',
    lineNumbers: true,
    theme: 'default',
    autocorrect: false,
    extraKeys: { "Ctrl-Space": "autocomplete" },
    hintOptions: {
        tables: tablesAndColumns
    },
    completeSingle: false,
});


// Aggiunge la funzionalità di autocompletamento su Ctrl-Space
editor.on('inputRead', function (instance, event) {
    if (!instance.state.completionActive && event.keyCode !== 32) {  // Trigger autocompletion
        CodeMirror.commands.autocomplete(editor);
    }
});