﻿$.fn.serializeObject = function () {
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

$.getUrlParameter = function (name) {
    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
    var results = regex.exec(location.search);
    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
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

    $('#table-tbody-WorkPlan').empty();

    // Catalogo de Paises
    $('#country_slc').empty()
    $.ajax({
        type: "POST",
        url: url_ + "/Catalogs/ListCountriesCatalog/",
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
        url: url_ + "/Catalogs/ListLanguajeCatalog/",
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
        url: url_ + "/Catalogs/ListYearsCatalog/",
        //data: { 'carId': carId },
        success: function (data) {

            $('#year_slc').append('<option value=""> Select </option>');
            for (i = 0; i < data.length; i++) {
                $('#year_slc').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }
        }
    });


}


function validate() {

    var msg = "";


    if (msg !== "") { alert(msg); return false; }
    return true;

}

function GetRecord(id) {

    console.log("Edit_Record ");
    console.log(id["id"]);
    
    //$('#country_slc').val(id["id"]);

    $('#create_cty_year').css('visibility', 'hidden');
    $.ajax({
        type: "POST",
        url:  url_ + "/Catalogs/IndicatorbyCountryListGet/",
        data: { 'countryid_param': id["id"], 'language_param': '', 'year_param': id["year"] },
        beforeSend: function () { $('#loading').show(); },
        complete: function () { $('#loading').hide(); },
        success: function (data) {
            dataretrive = data;
            $('#country_slc').val(data[i].country_id);
            $('#year_slc').val(data[i].year_select);
            for (i = 0; i < data.length; i++) {
                var tr = "  "
                $('#table-WorkPlan').find('tbody').append('<tr id="indicator" name="indicator">' +
                        '<td style = "display:none">' + '<input id="indicator_id" name="indicator_id"  value="' + data[i].indicator_id + '" type="hidden" ' + '>' +
                            '<input id="country_id" name="country_id"  value="' + data[i].country_id + '" type="hidden" ' + '>' +
                            '<input id="year_select" name="year_select"  value="' + data[i].year_select + '" type="hidden" ' + '>' + '</td>' +
                        '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].objective_ + '<label>' + '</td>' +
                        '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].indicator_group_ + '<label>' + '</td>' +
                        '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].tipo_ + '<label>' + '</td>' +
                        '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].metas_ + '<label>' + '</td>' +
                        '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].frec_Q1 + ((data[i].frec_Q1 != "") ? ' - ' : '') + data[i].frec_Q2 + ((data[i].frec_Q2 != "") ? ' - ' : '') + data[i].frec_Q3 + ((data[i].frec_Q3 != "") ? ' - ' : '') + data[i].frec_Q4 + '<label>' + '</td>' +
                        '<td>' 
                            + '<input id="target_Q1" name="target_Q1" placeholder="Q1"  value="' + data[i].target_Q1 + '" type="text" size="3" ' + '>'
                            + '<input id="target_Q2" name="target_Q2" placeholder="Q2" value="' + data[i].target_Q2 + '" type="text" size="3" ' + '>'
                            + '<input id="target_Q3" name="target_Q3" placeholder="Q3" value="' + data[i].target_Q3 + '" type="text" size="3" ' + '>'
                            + '<input id="target_Q4" name="target_Q4" placeholder="Q4" value="' + data[i].target_Q4 + '" type="text" size="3" ' + '>'
                        + '</td>' +
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
    var jsonItems = JSON.stringify(formData_array);

    console.log(formData_array);
    console.log(jsonItems);
    $.ajax({
        url:  url_ + "/Catalogs/IndicatorbyCountryListGetSave/",
        cache: false,
        async: true,
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
    $('#year_slc').attr('disabled', false);
    $('#table-tbody-WorkPlan').empty();

}

function CreateRecord() {
    var language_id = $("#language").val();
    var formData_array = $('#table-WorkPlan').formtoArray('table-WorkPlan');
    var jsonItems = JSON.stringify(formData_array);

    $.ajax({
        url: url_ + "/Catalogs/IndicatorbyCountryListGetCreateNew/",
        cache: false,
        async: true,
        type: 'POST',
        dataType: 'json',
        contentType: "application/json",
        data: jsonItems,
        success: function (data) {
            $('#DataTableCatalog').DataTable().ajax.reload();
            alert(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("AJAX error: " + textStatus + ' : ' + errorThrown);
        }
    });

    $('#language').attr('disabled', false);
    $('#country_slc').attr('disabled', false);
    $('#year_slc').attr('disabled', false);
    $('#table-tbody-WorkPlan').empty();

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


function CreateIndByCtyYear() {

    $('#table-tbody-WorkPlan').empty();
    $('#create_cty_year').css('visibility', 'visible');
    $('#loading').show();
    if ($('#country_slc').val() != '' && $('#year_slc').val() != '') {

        $.ajax({
            type: "POST",
            url:  url_ + "/Catalogs/IndicatorbyCountryListGetByActivation/",
            data: { 'countryid_param': $('#country_slc').val(), 'language_param': 'ES', 'year_param': $('#year_slc').val() },
            beforeSend: function () { $('#loading').show(); },
            complete: function () { $('#loading').hide(); },
            success: function (data, status, xhr) {
                dataretrive = data;
                console.log(xhr);
                var ct = xhr.getResponseHeader("content-type") || "";
                console.log(ct);
                if (ct.indexOf('html') > -1) {
                    alert(data);
                    $('#country_slc').val("");
                    $('#year_slc').val("");
                    $('#create_cty_year').css('visibility', 'visible');
                } else if (ct.indexOf('json') > -1) {
                    for (i = 0; i < data.length; i++) {
                        var tr = "  "
                        $('#table-WorkPlan').find('tbody').append('<tr id="indicator" name="indicator">' +
                                '<td style = "display:none">' + '<input id="indicator_id" name="indicator_id"  value="' + data[i].indicator_id + '" type="hidden" ' + '>' +
                                    '<input id="country_id" name="country_id"  value="' + data[i].country_id + '" type="hidden" ' + '>' +
                                    '<input id="inputtype" name="inputtype"  value="' + data[i].tipo_ + '" type="hidden" ' + '>' +
                                    '<input id="year_select" name="year_select"  value="' + data[i].year_select + '" type="hidden" ' + '>' + '</td>' +
                                '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].objective_ + '<label>' + '</td>' +
                                '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].indicator_group_ + '<label>' + '</td>' +
                                '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].tipo_ + '<label>' + '</td>' +
                                '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].metas_ + '<label>' + '</td>' +
                                '<td>' + '<label for="ind_' + data[i].indicator_id + '">' + data[i].frec_Q1 + ((data[i].frec_Q1 != "") ? ' - ' : '') + data[i].frec_Q2 + ((data[i].frec_Q2 != "") ? ' - ' : '') + data[i].frec_Q3 + ((data[i].frec_Q3 != "") ? ' - ' : '') + data[i].frec_Q4 + '<label>' + '</td>' +
                                '<td>'
                                    + '<input id="target_Q1" name="target_Q1" placeholder="Q1" value="' + data[i].target_Q1 + '" type="text" size="3" ' + '>'
                                    + '<input id="target_Q2" name="target_Q2" placeholder="Q2" value="' + data[i].target_Q2 + '" type="text" size="3" ' + '>'
                                    + '<input id="target_Q3" name="target_Q3" placeholder="Q3" value="' + data[i].target_Q3 + '" type="text" size="3" ' + '>'
                                    + '<input id="target_Q4" name="target_Q4" placeholder="Q4" value="' + data[i].target_Q4 + '" type="text" size="3" ' + '>'
                                + '</td>' +
                                '<td>' + '<input id="active" name="active"  value="true"' + ((data[i].indicator_selected == true) ? "checked" : "") + ' type="checkbox" size="3" ' + '>' + '</td>' +
                                '<td>' + '<input id="visible" name="visible"  value="true"' + ((data[i].indicator_visible == true) ? "checked" : "") + ' type="checkbox" size="3" ' + '>' + '</td>' +

                                + '</tr>');
                    }
                }

            }
        });

    } else {
        alert('Ingrese País y Año para crear los indicadores');
    }



    $('#language').attr('disabled', false);
    $('#country_slc').attr('disabled', false);
    $('#year_slc').attr('disabled', false);
    $('#create_cty_year').css('visibility', 'hidden');

}

function DisableRecord() {

    $('#Name').attr("disabled", true);
    $('#Code').attr("disabled", true);

}

$(document).ready(function () {


    var table = $('#DataTableCatalog').DataTable({
        "ajax": {
            "url": url_ + "/Catalogs/IndicatorbyCountryListDataTables/" + "?country=" + $.getUrlParameter('country') + "&year_slt=" + $.getUrlParameter('year_slt'),
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

    $('#altEditor-modal').on('hidden.bs.modal', function (e) {
        $('#language').attr('disabled', false);
        $('#country_slc').attr('disabled', false);
        $('#year_slc').attr('disabled', false);
        
        $('#create_cty_year').css('visibility', 'visible');
        $('#table-tbody-WorkPlan').empty();
        //$('#table-WorkPlan').clearSelection();
        //$('#DataTableCatalog').DataTable().fnDraw();
        //$("#DataTableCatalog tbody tr").removeClass('selected');
        $('#DataTableCatalog').DataTable().rows().deselect();

        //var table = $('#myTable').DataTable();

        //table.cell({ page: 'current' }).deselect();
    });



});
