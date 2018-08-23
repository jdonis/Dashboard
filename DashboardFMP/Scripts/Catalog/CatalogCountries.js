

$(document).ready(function () {

    var table = $('#Countries').DataTable({
        "ajax": {
            "url": "../Catalogs/ListCountries/",
            "dataSrc": ""
        },
        "columns": [
        //{
        //    data: null,
        //    defaultContent: '',
        //    className: 'select-checkbox',
        //    orderable: false
        //},
        { "data": "id", "visible": false },
        { "data": "name"  },
        { "data": "description" },
        { "data": "group" },
        { "data": "code" },
        { "data": "language" }],
        //select: {
        //    style: 'os',
        //    selector: 'td:first-child'
        //}
        dom: 'Bfrtip',        // Needs button container
        select: 'single',
        responsive: true,
        altEditor: true,     // Enable altEditor
        buttons: [{
            text: 'Agregar',
            name: 'add'        // do not change name
        },
        {
            extend: 'selected', // Bind to Selected row
            text: 'Editar',
            name: 'edit'        // do not change name
        },
        {
            extend: 'selected', // Bind to Selected row
            text: 'Borrar',
            name: 'delete'      // do not change name
        }]
    });

    $('#Countries').on('click', 'tbody td:not(:first-child)', function () {
        //var rowIdx = table
        //    .cell(this)
        //    .index().row;

        console.log($(this).data('name'));
        //table
        //    .rows(rowIdx)
        //    .nodes()
        //    .to$()
        //    .addClass('clicked');

    }); 

});
