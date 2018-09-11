
$.fn.serializeObject = function () {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function () {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};


function ResetRecord() {

            $('#id').val("");
            $('#Name').val("");
            $('#Code').val("");
            $('#Name').attr("disabled", false);
            $('#Code').attr("disabled", false);

}


function validate() {

    var msg = "";

    if ($("#Name").val() == "") { msg  += " Ingrese el nombre" + "\n"; $("#Name").focus()}
    if ($("#Code").val() == "") { msg += " Ingrese el código del lenguaje" + "\n"; $("#Code").focus() };

    if (msg !== "") { alert(msg); return false; }
    return true;

}

function GetRecord(id) {

    console.log("Edit_Record " + id);
    $.ajax({
        type: "POST",
        url: "../Catalogs/LanguageGet/",
        data: { 'ID': id },
        success: function (data) {
            console.log("Response Edit_record");
            console.log(data);

            $('#id').val(id);
            $('#Name').val(data[0].name);
            $('#Code').val(data[0].code);

        }
    });

    $('#languaje').attr('disabled', true);

}


function SaveRecord() {
    var id = $("#id").val();
    var formData = $('#altEditor-form').serializeObject();
    $.extend(formData, { 'language': id }); //Send Additional data
    console.log(formData);

    $.ajax({
        url: "../Catalogs/LanguageSave/",
        cache: false,
        type: 'POST',
        dataType: 'json',
        data: decodeURIComponent($.param(formData)),
        success: function (data) {
            $('#DataTableCatalog').DataTable().ajax.reload();
            alert('Registro guardado');
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("AJAX error: " + textStatus + ' : ' + errorThrown);
        }
    });

    $('#languaje').attr('disabled', false);

}

function CreateRecord() {
    var formData = $('#altEditor-form').serializeObject();

    $.ajax({
        url: "../Catalogs/LanguageCreate/",
        cache: false,
        type: 'POST',
        dataType: 'json',
        data: decodeURIComponent($.param(formData)),
        success: function (data) {
            $('#DataTableCatalog').DataTable().ajax.reload();
            alert(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("AJAX error: " + textStatus + ' : ' + errorThrown);
        }
    });

    $('#languaje').attr('disabled', false);

}

function DeleteRecord() {
    var id = $("#id").val();
    var formData = $('#altEditor-form').serializeObject();
    $.extend(formData, { 'language': id }); //Send Additional data

    $.ajax({
        url: "../Catalogs/LanguageDelete/",
        cache: false,
        type: 'POST',
        dataType: 'json',
        data: decodeURIComponent($.param(formData)),
        success: function (data) {
            $('#DataTableCatalog').DataTable().ajax.reload();
            alert(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("AJAX error: " + textStatus + ' : ' + errorThrown);
        }
    });

    $('#languaje').attr('disabled', false);

}


function DisableRecord() {

    $('#Name').attr("disabled", true);
    $('#Code').attr("disabled", true);

}

$(document).ready(function () {


    var table = $('#DataTableCatalog').DataTable({
        "ajax": {
            "url": "../Catalogs/LanguagesListDataTables/",
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
        { "data": "code" }
        ],
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


});
