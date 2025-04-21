function eseguiQueryRemoto(query, postQuery) {
    $.ajax({
        url: '/execute',
        method: 'POST',
        data: { query: query },
        success: function (response) {
            if (response.error) {
                res = { error: response.error }
            } else {
                res = { data: response.data, columns: response.columns, count: response.count }
            }
            postQuery(res)
        },
        error: function (xhr, textStatus, error) {
            if (xhr && xhr.responseJSON) {
                res = { error: xhr.responseJSON.error }
            } else {
                res = { error: error }
            }
            postQuery(res)
        }
    });
}
