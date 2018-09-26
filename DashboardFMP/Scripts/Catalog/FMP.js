
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
    var obj = {};
    $.each(formArray, function(i, pair){
        var cObj = obj, pObj, cpName;
        $.each(pair.name.split("."), function(i, pName){
            pObj = cObj;
            cpName = pName;
            cObj = cObj[pName] ? cObj[pName] : (cObj[pName] = {});
        });
        pObj[cpName] = pair.value;
    });
    return obj;
}

$.fn.serializeToJson = function(serializer) {
    var _string = '{';
    for (var ix in serializer) {
        var row = serializer[ix];
        _string += '"' + row.name + '":"' + row.value + '",';
    }
    var end = _string.length - 1;
    _string = _string.substr(0, end);
    _string += '}';
    console.log('_string: ', _string);
    return JSON.parse(_string);
}

function ResetRecord() {

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

    console.log("Edit_Record " + id);

    $.ajax({
        type: "POST",
        url: "../FMP/ListIndicatorbyCountry/",
        data: { 'countryid_param': 3, 'language_param': 'ES', 'year_param': 2017 },
        beforeSend: function () { $('#loading').show(); },
        complete: function () { $('#loading').hide(); },
        success: function (data) {

            $('#table-WorkPlan').find('tbody').append('<input class="primarykey" id="ind_' + data[i].id + '" name="id' + data[i].id + '" placeholder="" value="" type="hidden">');
            for (i = 0; i < data.length; i++) {
                var tr = "  "
                $('#table-WorkPlan').find('tbody').append('<tr id="indicator">' +
                        '<td style = "display:none">' + '<input id="indicator_id_' + data[i].id + '" name="indicator_id_' + data[i].id + '"  value="' + data[i].indicator_id + '" type="hidden" ' + '>' +
                            '<input id="country_id' + data[i].id + '" name="country_id' + data[i].id + '"  value="' + data[i].country_id + '" type="hidden" ' + '>' +
                            '<input id="year_' + data[i].id + '" name="year_' + data[i].id + '"  value="' + data[i].year_ + '" type="hidden" ' + '>' + '</td>' +
                        '<td>' + '<label for="ind_' + data[i].id + '">' + data[i].objective_ + '<label>' + '</td>' +
                        '<td>' + '<label for="ind_' + data[i].id + '">' + data[i].indicator_group_ + '<label>' + '</td>' +
                        '<td>' + '<label for="ind_' + data[i].id + '">' + data[i].tipo_ + '<label>' + '</td>' +
                        '<td>' + '<label for="ind_' + data[i].id + '">' + data[i].metas_ + '<label>' + '</td>' +
                        '<td>' + '<label for="ind_' + data[i].id + '">' + data[i].frec_ + '<label>' + '</td>' +
                        '<td>' + '<label for="ind_target_' + data[i].id + '">' + ((data[i].Q1_target_ == null) ? "" : data[i].Q1_target_) + '<label>' + '</td>' +
                        '<td>' + '<input id="ind_Q1_' + data[i].id + '" name="ind_Q1_' + data[i].id + '"  value="' + ((data[i].Q1_ == null) ? "" : data[i].Q1_) + '" type="text" size="3" ' + 'disabled = disabled' + '>' + '</td>' +
                        '<td>' + '<label for="ind_target_' + data[i].id + '">' + ((data[i].Q2_target_ == null) ? "" : data[i].Q2_target_) + '<label>' + '</td>' +
                        '<td>' + '<input id="ind_Q2_' + data[i].id + '" name="ind_Q2_' + data[i].id + '"  value="' + ((data[i].Q2_ == null) ? "" : data[i].Q2_) + '" type="text" size="3" ' +  'disabled = disabled'  + '>' + '</td>' +
                        '<td>' + '<label for="ind_target_' + data[i].id + '">' + ((data[i].Q3_target_ == null) ? "" : data[i].Q3_target_) + '<label>' + '</td>' +
                        '<td>' + '<input id="ind_Q3_' + data[i].id + '" name="ind_Q3_' + data[i].id + '"  value="' + ((data[i].Q3_ == null) ? "" : data[i].Q3_) + '" type="text" size="3"  ' +  'disabled = disabled'  + '>' + '</td>' +
                        '<td>' + '<label for="ind_target_' + data[i].id + '">' + ((data[i].Q4_target_ == null) ? "" : data[i].Q4_target_) + '<label>' + '</td>' +
                        '<td>' + '<input id="ind_Q4_' + data[i].id + '" name="ind_Q4_' + data[i].id + '"  value="' + ((data[i].Q4_ == null) ? "" : data[i].Q4_) + '" type="text" size="3" ' +  'disabled = disabled' + '>' + '</td>' +

                        '<td>' + '<a href="#edit" id="ind_'+data[i].id+'">Edit</a>  <a href="#save" style="display:none;">Save</a>' + '</td>' +

                        + '</tr>');
            }
        }
    });


    //$.ajax({
    //    type: "POST",
    //    url: "../Catalogs/ObjectiveGet/",
    //    data: { 'ID': id },
    //    success: function (data) {
    //        console.log("Response Edit_record");
    //        console.log(data);

    //        $('#id').val(id);
    //        $('#Code_short').val(data[0].code_short);
    //        $('#Code_intern').val(data[0].code);
    //        $('#Name').val(data[0].name);
    //        $('#Short_name').val(data[0].short_name);
    //        $('#language').val(data[0].language_id);
    //        $('#Code_group_visual').val(data[0].code_group_info);
            

    //    }
    //});

    $('#language').attr('disabled', true);

}


function SaveRecord() {
    var language_id = $("#language").val();
    var formData = $('#altEditor-form').serializeObject();
    //$.extend(formData, { 'language': language_id }); //Send Additional data
    console.log(formData);

    $.ajax({
        url: "../FMP/IndicatorbyCountrySave/",
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

    $(function () {
        $("#tabs").tabs();
    });

    var table = $('#DataTableCatalog').DataTable({
        "ajax": {
            "url": "../FMP/FMPListDataTables/",
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
        { "data": "language"  },
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


});
