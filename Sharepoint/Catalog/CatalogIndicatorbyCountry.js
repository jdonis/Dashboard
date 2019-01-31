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

$.fn.formtoArray = function(formArray){
    var obj = [];
    var inputs_form;
    var allListElements = $("tbody tr");
    inputs_form = $(this).find(allListElements);
    var allListElements_input = $("input");
    var i = 0;

    $.each(inputs_form, function () {

        var inputs = $(this).find(allListElements_input).serializeObject();
        obj.push(inputs) ;

    });

    return obj;
}

$.fn.serializeToJson = function(serializer) {
    var _string = '{';
    for (var ix in serializer) {
        var row = serializer[ix];
        _string += '' + row.name + ':"' + row.value + '",';
    }
    var end = _string.length - 1;
    _string = _string.substr(0, end);
    _string += '}';
    console.log('_string: ', _string);
    return JSON.parse(_string);
}

function ResetRecord() {
    console.log("... Reset Record");
            $('#id').val("");
            $('#Code_intern').val("");
            $('#Code_short').val("");
            $('#Name').val("");
            $('#Short_name').val("");
            $('#language').val("");
            $('#Code_group_visual').val("");
            $('#Code_intern').attr("disabled", false);
            $('#Code_short').attr("disabled", false);
            $('#Name').attr("disabled", false);
            $('#Short_name').attr("disabled", false);
            $('#language').attr("disabled", false);
            $('#Code_group_visual').attr("disabled", false);

}


function validate() {

    var msg = "";


    if (msg !== "") { alert(msg); return false; }
    return true;

}

function GetRecord(id) {

    console.log("Edit_Record ");
    console.log(id["id"]);
    $('#table-tbody-WorkPlan').empty();
    $('#country_slc').val(id["id"]);
    $('#year_slc').val(id["year"]);
    $('#create_cty_year').css('visibility', 'hidden');
    $.ajax({
        type: "POST",
        url:  url_ + "/Catalogs/IndicatorbyCountryListGet/",
        data: { 'countryid_param': id["id"], 'language_param': 'ES', 'year_param': id["year"] },
        beforeSend: function () { $('#loading').show(); },
        complete: function () { $('#loading').hide(); },
        success: function (data) {
            dataretrive = data;

            for (i = 0; i < data.length; i++) {
                var tr = "  "
                $('#table-WorkPlan').find('tbody').append('<tr id="indicator" name="indicator">' +
                        '<td style = "display:none">' + '<input id="indicator_id" name="indicator_id"  value="' + data[i].indicator_id + '" type="hidden" ' + '>' +
                            '<input id="country_id" name="country_id"  value="' + data[i].country_id + '" type="hidden" ' + '>' +
                            '<input id="year_" name="year_"  value="' + data[i].year_ + '" type="hidden" ' + '>' + '</td>' +
                        '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].objective_ + '<label>' + '</td>' +
                        '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].indicator_group_ + '<label>' + '</td>' +
                        '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].tipo_ + '<label>' + '</td>' +
                        '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].metas_ + '<label>' + '</td>' +
                        '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].frec_ + '<label>' + '</td>' +
                        '<td>' + '<input id="active" name="active"  value="true"' + ((data[i].indicator_selected == true) ? "checked" : "") + ' type="checkbox" size="3" ' + '>' + '</td>' +
                        '<td>' + '<input id="visible" name="visible"  value="true"' + ((data[i].indicator_visible == true) ? "checked" : "") + ' type="checkbox" size="3" ' + '>' + '</td>' +

                        + '</tr>');
            }
        }
    });


    $('#language').attr('disabled', true);
    $('#country_slc').attr('disabled', true);
    $('#year_slc').attr('disabled', true);
    //$('#create_cty_year').css('visibility', 'visible');
    
}


function SaveRecord() {
    var language_id = $("#language").val();
    var formData_array = $('#table-WorkPlan').formtoArray('table-WorkPlan');
    //console.log(formData_array);
    //console.log(JSON.stringify(formData_array));
    var jsonItems = JSON.stringify(formData_array);
    
    $.ajax({
        url:  url_ + "/Catalogs/IndicatorbyCountryListGetSave/",
        cache: false,
        type: 'POST',
        dataType: 'json',
        contentType: "application/json",
        //data: {"name": "John","age": 30,"cars": ["Ford", "BMW", "Fiat"]},
        data: jsonItems,
        success: function (data) {
            alert('Registro guardado');
            $('#DataTableCatalog').DataTable().ajax.reload();
            
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("AJAX error: " + textStatus + ' : ' + errorThrown);
        }
    });

    $('#language').attr('disabled', false);
    $('#country_slc').attr('disabled', false);
    $('#table-tbody-WorkPlan').empty();

}

function CreateRecord() {
    var language_id = $("#language").val();
    var formData = $('#altEditor-form').serializeObject();
    $.extend(formData, { 'language': language_id }); //Send Additional data

    $.ajax({
        url:  url_ + "/Catalogs/ObjectiveCreate/",
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
        url:  url_ + "/Catalogs/ObjectiveDelete/",
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


function CreateIndByCtyYear(id) {

    //console.log("Edit_Record ");
    //console.log(id["id"]);
    $('#table-tbody-WorkPlan').empty();
    $('#country_slc').val(id["id"]);
    $('#year_slc').val(id["year"]);
    $('#create_cty_year').css('visibility', 'visible');
    $('#loading').hide();
    if ($('#country_slc').val() != '' && $('#year_slc').val() != '') {

        $.ajax({
            type: "POST",
            url:  url_ + "/Catalogs/IndicatorbyCountryListGetByActivation/",
            data: { 'countryid_param': id["id"], 'language_param': 'ES', 'year_param': id["year"]},
            beforeSend: function () { $('#loading').show(); },
            complete: function () { $('#loading').hide(); },
            success: function (data) {
                dataretrive = data;

                for (i = 0; i < data.length; i++) {
                    var tr = "  "
                    $('#table-WorkPlan').find('tbody').append('<tr id="indicator" name="indicator">' +
                            '<td style = "display:none">' + '<input id="indicator_id" name="indicator_id"  value="' + data[i].indicator_id + '" type="hidden" ' + '>' +
                                '<input id="country_id" name="country_id"  value="' + data[i].country_id + '" type="hidden" ' + '>' +
                                '<input id="year_" name="year_"  value="' + data[i].year_ + '" type="hidden" ' + '>' + '</td>' +
                            '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].objective_ + '<label>' + '</td>' +
                            '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].indicator_group_ + '<label>' + '</td>' +
                            '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].tipo_ + '<label>' + '</td>' +
                            '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].metas_ + '<label>' + '</td>' +
                            '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].frec_ + '<label>' + '</td>' +
                            '<td>' + '<input id="active" name="active"  value="true"' + ((data[i].indicator_selected == true) ? "checked" : "") + ' type="checkbox" size="3" ' + '>' + '</td>' +
                            '<td>' + '<input id="visible" name="visible"  value="true"' + ((data[i].indicator_visible == true) ? "checked" : "") + ' type="checkbox" size="3" ' + '>' + '</td>' +

                            + '</tr>');
                }
            }
        });

    } else {
        alert('Ingrese País y Año para crear los indicadores');
    }



    $('#language').attr('disabled', false);
    $('#country_slc').attr('disabled', false);
    $('#year_slc').attr('disabled', false);
    //$('#create_cty_year').css('visibility', 'hidden');

}

function DisableRecord() {

    $('#Name').attr("disabled", true);
    $('#Code').attr("disabled", true);

}

$(document).ready(function () {

    //$(function () {
    //    $("#tabs").tabs();
    //});
    console.log( url_ + url_ + "/Catalogs/IndicatorbyCountryListDataTables/");
    var table = $('#DataTableCatalog').DataTable({
        "ajax": {
            "url":  url_ + "/Catalogs/IndicatorbyCountryListDataTables/",
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
        { "data": "name" },
        { "data": "code" },
        { "data": "year"  }

        ],
        //select: {
        //    style: 'os',
        //    selector: 'td:first-child'
        //}
        dom: 'Bfrtip',        // Needs button container
        select: 'single',
        responsive: true,
        altEditor: true,     // Enable altEditor
        buttons: [
            {
            text: 'Agregar',
            name: 'add'        // do not change name
        },
        {
            extend: 'selected', // Bind to Selected row
            text: 'Editar',
            name: 'edit'        // do not change name
        },
        //{
        //    extend: 'selected', // Bind to Selected row
        //    text: 'Borrar',
        //    name: 'delete'      // do not change name
        //}
        ]
    });

    // Catalogo de Paises
    $('#country_slc').empty()
    $.ajax({
        type: "POST",
        url:  url_ + "/Catalogs/ListCountriesCatalog/",
        //data: { 'carId': carId },
        success: function (data) {

            $('#country_slc').append('<option value=""> Select </option>');
            for (i = 0; i < data.length; i++) {
                $('#country_slc').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }
        }
    });

    // Catalogo de idiomas
    $('#language').empty()
    $.ajax({
        type: "POST",
        url:  url_ + "/Catalogs/ListLanguajeCatalog/",
        //data: { 'carId': carId },
        success: function (data) {

            $('#language').append('<option value=""> Select </option>');
            for (i = 0; i < data.length; i++) {
                $('#language').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }
        }
    });

    // Catalogo de años
    $('#year_slc').empty()
    $.ajax({
        type: "POST",
        url:  url_ + "/Catalogs/ListYearsCatalog/",
        //data: { 'carId': carId },
        success: function (data) {

            $('#year_slc').append('<option value=""> Select </option>');
            for (i = 0; i < data.length; i++) {
                $('#year_slc').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }
        }
    });


});
