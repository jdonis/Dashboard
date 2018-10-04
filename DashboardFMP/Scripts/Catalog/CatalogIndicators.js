
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
            $('#objective').val("");
            $('#group').val("");
            $('#name').val("");
            $('#short_').val("");
            $('#language').val("");
            $('#mode').val("");
            $('#frequency').val("");
            $('#input_type').val("");
            $('#language').attr("disabled", false);
            $('#Name').attr("disabled", false);

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
    console.log(id);

    $('#group').empty()
    $.ajax({
        type: "POST",
        url: "../Catalogs/ListGroupCatalog/",
        data: { 'language_id_': id["language_id"] },
        async: false,
        success: function (data) {

            $('#group').append('<option value=""> Select </option>');
            for (i = 0; i < data.length; i++) {
                $('#group').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }
        }
    });

    $('#objective').empty()
    $.ajax({
        type: "POST",
        url: "../Catalogs/ListObjectiveCatalog/",
        data: { 'language_id_': id["language_id"] },
        async: false,
        success: function (data) {

            $('#objective').append('<option value=""> Select </option>');
            for (i = 0; i < data.length; i++) {
                $('#objective').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }
        }
    });



    $.ajax({
        type: "POST",
        url: "../Catalogs/IndicatorGet/",
        data: { 'ID': id["id"] },
        success: function (data) {
            console.log("Response Edit_record");
            console.log(data);

            $('#id').val(id["id"]);
            $('#objective').val(data[0].objective);
            $('#group').val(data[0].group_id);
            $('#name').val(data[0].name);
            $('#short_').val(data[0].short_name);
            $('#language').val(data[0].language_id);
            $('#mode').val(data[0].mode);
            $('#frequency').val(data[0].frequency);
            $('#input_type').val(data[0].inputtype);
            

        }
    });

    $('#language').attr('disabled', true);

}


function SaveRecord() {
    var language_id = $("#language").val();
    var formData = $('#altEditor-form').serializeObject();
    $.extend(formData, { 'language': language_id }); //Send Additional data
    console.log(formData);

    $.ajax({
        url: "../Catalogs/ObjectiveSave/",
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
            "url": "../Catalogs/IndicatorListDataTables/",
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
        { "data": "language_id", "visible": false },
        { "data": "language" },
        { "data": "indicatorgroup" },
        { "data": "objective" },
        { "data": "name" },
        { "data": "short_name", "visible": false },
        { "data": "mode" },
        { "data": "frequency" },
        { "data": "inputtype" }
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

    $('#mode').empty()
    $.ajax({
        type: "POST",
        url: "../Catalogs/ListModeCatalog/",
        //data: { 'carId': carId },
        success: function (data) {

            $('#mode').append('<option value=""> Select </option>');
            for (i = 0; i < data.length; i++) {
                $('#mode').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }
        }
    });

    $('#frequency').empty()
    $.ajax({
        type: "POST",
        url: "../Catalogs/ListFrequencyCatalog/",
        //data: { 'carId': carId },
        success: function (data) {

            $('#frequency').append('<option value=""> Select </option>');
            for (i = 0; i < data.length; i++) {
                $('#frequency').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }
        }
    });

    $('#input_type').empty()
    $.ajax({
        type: "POST",
        url: "../Catalogs/ListInputTypeCatalog/",
        //data: { 'carId': carId },
        success: function (data) {

            $('#input_type').append('<option value=""> Select </option>');
            for (i = 0; i < data.length; i++) {
                $('#input_type').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }
        }
    });


    
});
