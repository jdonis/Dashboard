
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
            $('#order_view').val("");
            $('#language').val("");
            $('#checklist').val("");
            $('#Name').attr("disabled", false);
            $('#language').attr("disabled", false);
            $('#checklist').attr("disabled", false);

}


function validate() {

    var msg = "";

    if ($("#Name").val() == "") { msg  += " Ingrese el nombre" + "\n"; $("#Name").focus()}
    if ($("#Code_intern").val() == "") { msg += " Ingrese el código del objetivo" + "\n"; $("#Code").focus() };

    if (msg !== "") { alert(msg); return false; }
    return true;

}

function GetRecord(id) {

    console.log("Edit_Record " + id);
    $.ajax({
        type: "POST",
        url: "../Catalogs/CheckListQuestionGet/",
        data: { 'ID': id["id"] },
        success: function (data) {
            console.log("Response Edit_record");
            console.log(data);

            $('#id').val(id["id"]);
            $('#Name').val(data[0].name);
            $('#language').val(data[0].language_id);
            $('#checklist').val(data[0].checklist_id);
            $('#order_view').val(data[0].orden_view);
            

        }
    });

    $('#language').attr('disabled', true);

}


function SaveRecord() {
    var language_id = $("#language").val();
    var checklist_id = $("#checklist").val();
    var formData = $('#altEditor-form').serializeObject();
    $.extend(formData, { 'language': language_id, 'checklist': checklist_id }); //Send Additional data
    console.log(formData);

    $.ajax({
        url: "../Catalogs/CheckListQuestionSave/",
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

    $('#language').attr('disabled', false);

}

function CreateRecord() {
    var language_id = $("#language").val();
    var formData = $('#altEditor-form').serializeObject();
    $.extend(formData, { 'language': language_id }); //Send Additional data

    $.ajax({
        url: "../Catalogs/ObjectiveCreate/",
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

    $('#language').attr('disabled', false);

}

function DeleteRecord() {
    var language_id = $("#language").val();
    var formData = $('#altEditor-form').serializeObject();
    $.extend(formData, { 'language': language_id }); //Send Additional data

    $.ajax({
        url: "../Catalogs/ObjectiveDelete/",
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

    $('#language').attr('disabled', false);

}


function DisableRecord() {

    $('#Name').attr("disabled", true);
    $('#Code').attr("disabled", true);

}

$(document).ready(function () {


    var table = $('#DataTableCatalog').DataTable({
        "ajax": {
            "url": "../Catalogs/CheckListQuestionListDataTables/",
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
        { "data": "orden_despliegue" },
        { "data": "name" },
        { "data": "checklist" },
        { "data": "language" }
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

    // Catalogo de idiomas
    $('#language').empty()
    $.ajax({
        type: "POST",
        url: "../Catalogs/ListLanguajeCatalog/",
        //data: { 'carId': carId },
        success: function (data) {

            $('#language').append('<option value=""> Select </option>');
            for (i = 0; i < data.length; i++) {
                $('#language').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }
        }
    });

    $('#checklist').empty()
    $.ajax({
        type: "POST",
        url: "../Catalogs/ListCheckListCatalog/",
        //data: { 'carId': carId },
        success: function (data) {

            $('#checklist').append('<option value=""> Select </option>');
            for (i = 0; i < data.length; i++) {
                $('#checklist').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }
        }
    });


});
