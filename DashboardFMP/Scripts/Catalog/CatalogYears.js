
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
            $('#active').val("");
            $('#Name').attr("disabled", false);
            $('#active').attr("disabled", false);

}


function validate() {

    var msg = "";

    if ($("#Name").val() == "") { msg  += " Ingrese el año a activar" + "\n"; $("#Name").focus()}
    //if ($("#active").val() == "") { msg += " Ingrese si el año estará activo o no" + "\n"; $("#Code").focus() };

    if (msg !== "") { alert(msg); return false; }
    return true;

}

function GetRecord(id) {

   
    console.log("Edit_Record " + id);
    $.ajax({
        type: "POST",
        url: url_ + "/Catalogs/YearGet/",
        data: { 'ID': id["id"] },
        success: function (data) {
            console.log("Response Edit_record");
            console.log(data);

            $('#id').val(id["id"]);
            $('#Name').val(data[0].name);
            if (data[0].active == true)
                $('#active').prop('checked', true)
            else
                $('#active').prop('checked', false)

        }
    });

    $('#languaje').attr('disabled', true);

}


function SaveRecord() {
    var id = $("#id").val();
    var formData = $('#altEditor-form').find("select, textarea, input").serializeObject();

    $.extend(formData, { 'activated': ($('#active').is(':checked')) ? true : false }); //Send Additional data
    //console.log(formData);

    $.ajax({
        url: url_ + "/Catalogs/YearSave/",
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
    var formData = $('#altEditor-form').find("select, textarea, input").serializeObject();
    $.extend(formData, { 'activated': ($('#active').is(':checked')) ? true : false }); //Send Additional data

    $.ajax({
        url: url_ + "/Catalogs/YearCreate/",
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
    var formData = $('#altEditor-form').find("select, textarea, input").serializeObject();
    $.extend(formData, { 'language': id }); //Send Additional data

    $.ajax({
        url: url_ + "/Catalogs/YearDelete/",
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
            "url": url_ + "/Catalogs/YearsListDataTables/",
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
        { "data": "active" }
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
