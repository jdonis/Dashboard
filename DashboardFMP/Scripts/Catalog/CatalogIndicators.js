
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


function ResetRecord(lenguage_id_) {

    lenguage_id = (lenguage_id_ > 0) ? lenguage_id_ : 1;

    $('#input_type').empty()
    $.ajax({
        type: "POST",
        url: url_ + "/Catalogs/ListInputTypeCatalog/",
        //data: { 'carId': carId },
        success: function (data) {

            $('#input_type').append('<option value=""> Select </option>');
            for (i = 0; i < data.length; i++) {
                $('#input_type').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }
        }
    });

    $('#group').empty()
    $.ajax({
        type: "POST",
        url: url_ + "/Catalogs/ListGroupCatalog/",
        data: { 'language_id_': lenguage_id },
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
        url: url_ + "/Catalogs/ListObjectiveCatalog/",
        data: { 'language_id_': lenguage_id },
        async: false,
        success: function (data) {

            $('#objective').append('<option value=""> Select </option>');
            for (i = 0; i < data.length; i++) {
                $('#objective').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }
        }
    });

    $('#annual_calculation').empty()
    $.ajax({
        type: "POST",
        url: url_ + "/Catalogs/ListAnualCalculationCatalog/",
        success: function (data) {

            $('#annual_calculation').append('<option value=""> Select </option>');
            for (i = 0; i < data.length; i++) {
                $('#annual_calculation').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }
        }
    });


            $('#id').val("");
            $('#objective').val("");
            $('#group').val("");
            $('#name').val("");
            $('#short_').val("");
            $('#language').val("");
            $('#mode').val("");
            $('#frequency').val("");
            $("#ind_num_visible").val("");

            $('#frequency_Q1').empty();
            $('#frequency_Q2').empty();
            $('#frequency_Q3').empty();
            $('#frequency_Q4').empty();
            //$('#input_type').val("");
            $('#language').attr("disabled", false);
            $('#Name').attr("disabled", false);

}


function validate() {

    var msg = "";

    if ($("#name").val() == "") { msg  += " Ingrese el nombre" + "\n"; $("#name").focus()}
    if ($("#short_").val() == "") { msg += " Ingrese el nombre corto" + "\n"; $("#short_").focus() };
    if ($("#objective").val() == "") { msg += " Ingrese el Objetivo" + "\n"; $("#objective").focus() };
    if ($("#group").val() == "") { msg += " Ingrese el Grupo" + "\n"; $("#group").focus() };
    if ($("#language").val() == "") { msg += " Ingrese el Idioma" + "\n"; $("#language").focus() };
    if ($("#mode").val() == "") { msg += " Ingrese el Mode" + "\n"; $("#mode").focus() };
    //if ($("#frequency").val() == "") { msg += " Ingrese la Frecuencia" + "\n"; $("#frequency").focus() };
    if ($("#input_type").val() == "") { msg += " Ingrese el Input Type" + "\n"; $("#input_type").focus() };


    if (msg !== "") { alert(msg); return false; }
    return true;

}

function GetRecord(id) {


    $.ajax({
        type: "POST",
        url: url_ + "/Catalogs/IndicatorGet/",
        data: { 'ID': id["id"] },
        success: function (data) {
            //console.log("Response Edit_record");
            //console.log(data);

            $('#id').val(id["id"]);
            $('#objective').val(data[0].objective);
            $('#group').val(data[0].group_id);
            $('#name').val(data[0].name);
            $('#short_').val(data[0].short_name); 
            $('#ind_num_visible').val(data[0].ind_num_visible);
            $('#language').val(data[0].language_id);
            $('#mode').val(data[0].mode);
            $('#annual_calculation').val(data[0].anual_calculation_id);
            $('#input_type').val(data[0].inputtype);
            $('#frequency_Q1').prop('checked', data[0].Q1);
            $('#frequency_Q2').prop('checked', data[0].Q2);
            $('#frequency_Q3').prop('checked', data[0].Q3);
            $('#frequency_Q4').prop('checked', data[0].Q4);

            

        }
    });

    $('#language').attr('disabled', true);

}


function SaveRecord() {
    var language_id = $("#language").val(), mode = $("#mode").val(), frequency = $("#frequency").val(), input_type = $("#input_type").val(), annual_calculation = $("#annual_calculation").val(),  ind_num_visible = $("#ind_num_visible").val() ;
    var group = $("#group").val(), objective = $("#objective").val();
    var formData = $('#altEditor-form').find("select, textarea, input").serializeObject();
    $.extend(formData, { 'language': language_id, 'mode': mode, 'frequency': frequency, 'input_type': input_type, 'group': group, 'objective': objective, 'annual_calculation': annual_calculation, 'ind_num_visible': ind_num_visible }); //Send Additional data
    console.log(formData);

    $.ajax({
        url: url_ + "/Catalogs/IndicatorSave/",
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
    var language_id = $("#language").val(), mode = $("#mode").val(), frequency = $("#frequency").val(), input_type = $("#input_type").val(), annual_calculation = $("#annual_calculation").val();
    var formData = $('#altEditor-form').find("select, textarea, input").serializeObject();
    $.extend(formData, { 'language': language_id, 'mode': mode, 'frequency': frequency, 'input_type': input_type, 'group': group, 'objective': objective, 'annual_calculation': annual_calculation }); //Send Additional data


    $.ajax({
        url: url_ + "/Catalogs/IndicatorCreate/",
        cache: false,
        type: 'POST',
        dataType: 'json',
        data: decodeURIComponent($.param(formData)),
        success: function (data) {
            console.log("Ajax CreateRecord");
            $('#DataTableCatalog').DataTable().ajax.reload();
            console.log("Ajax reload");
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
    var formData = $('#altEditor-form').find("select, textarea, input").serializeObject();
    $.extend(formData, { 'language': language_id }); //Send Additional data

    $.ajax({
        url: url_ + "/Catalogs/IndicatorDelete/",
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
            "url": url_ + "/Catalogs/IndicatorListDataTables/",
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
        url: url_ + "/Catalogs/ListLanguajeCatalog/",
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
        url:url_ + "/Catalogs/ListModeCatalog/",
        //data: { 'carId': carId },
        success: function (data) {

            $('#mode').append('<option value=""> Select </option>');
            for (i = 0; i < data.length; i++) {
                $('#mode').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }
        }
    });

    //$('#frequency').empty()
    //$.ajax({
    //    type: "POST",
    //    url:url_ + "/Catalogs/ListFrequencyCatalog/",
    //    //data: { 'carId': carId },
    //    success: function (data) {

    //        $('#frequency').append('<option value=""> Select </option>');
    //        for (i = 0; i < data.length; i++) {
    //            $('#frequency').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
    //        }
    //    }
    //});

    $('#input_type').empty()
    $.ajax({
        type: "POST",
        url:url_ + "/Catalogs/ListInputTypeCatalog/",
        //data: { 'carId': carId },
        success: function (data) {

            $('#input_type').append('<option value=""> Select </option>');
            for (i = 0; i < data.length; i++) {
                $('#input_type').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }
        }
    });

    $('#annual_calculation').empty()
    $.ajax({
        type: "POST",
        url:url_ + "/Catalogs/ListAnualCalculationCatalog/",
        //data: { 'carId': carId },
        success: function (data) {

            $('#annual_calculation').append('<option value=""> Select </option>');
            for (i = 0; i < data.length; i++) {
                $('#annual_calculation').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }
        }
    });


    
});
