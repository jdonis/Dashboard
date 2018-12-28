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
    console.log(id);
    $('#table-tbody-WorkPlan').empty();
    $('#country_slc').val(id["id"]);
    $('#year_slc').val(id["year"]);
    $.ajax({
        type: "POST",
        url: "../FMP/ListIndicatorbyCountry/",
        data: { 'countryid_param': id["id"], 'language_param': 'ES', 'year_param': id["year"] },
        beforeSend: function () { $('#loading').show(); },
        complete: function () { $('#loading').hide(); },
        success: function (data) {
            dataretrive = data;
            //console.log(data);

            for (i = 0; i < data.length; i++) {
                var tr = "  ";
                var onclick_ = (data[i].tipo_ == "checklist") ? "$('#tabs').tabs({ active: " + (data[i].CheckList[0].id_checklist) + " });" : "";
                //(data[i].tipo_ == "checklist") ?  console.log(data[i].CheckList): "";
                $('#table-WorkPlan').find('tbody').append('<tr id="indicator" name="indicator">' +
                        '<td style = "display:none">' + '<input id="indicator_id" name="indicator_id"  value="' + data[i].indicator_id + '" type="hidden" ' + '>' +
                            '<input id="country_id" name="country_id"  value="' + data[i].country_id + '" type="hidden" ' + '>' +
                            '<input id="year_" name="year_"  value="' + data[i].year_ + '" type="hidden" ' + '>' + '</td>' +
                        '<td>' + '<label for="ind_' + data[i].id + '">' + data[i].objective_ + '</label>' + '</td>' +
                        '<td>' + '<label for="ind_' + data[i].id + '">' + data[i].indicator_group_ + '</label>' + '</td>' +
                        '<td>' + '<label for="ind_' + data[i].id + '">' + data[i].tipo_ + '</label>' + '</td>' +
                        '<td>' + ((data[i].tipo_ == "checklist") ? '<div class="page-link" onclick="' + onclick_ + '">' : "") + '<label for="ind_' + data[i].id + '">' + data[i].metas_ + '</label>' + ((data[i].tipo_ == "checklist") ? "</div>" : "") + '</td>' +
                         //  $('#tabs a[href="#tabtwo"]').click();
                         //$("#workflowTab").tabs({ active: 0 });
                         //+ ((data[i].tipo_ == "checklist") ? "<a href='#tab-" + data[i].CheckList[0].link_checklist + "checklist'>" : "")
                        '<td>' + '<label for="ind_' + data[i].id + '">' + data[i].frec_ + '<label>' + '</td>' +
                        '<td>' + '<label for="ind_target_' + data[i].id + '">' + ((data[i].Q1_target_ == null) ? "" : data[i].Q1_target_) + '<label>' + '</td>' +
                        '<td>' + '<input id="ind_Q1_" name="ind_Q1_"  value="' + ((data[i].Q1_ == null) ? "" : data[i].Q1_) + '" type="text" size="3" ' + ((data[i].tipo_ == "checklist") ? "disabled = disabled" : "") + '>' + '</td>' +
                        //+ 'disabled = disabled'
                        '<td>' + '<label for="ind_target_' + data[i].id + '">' + ((data[i].Q2_target_ == null) ? "" : data[i].Q2_target_) + '<label>' + '</td>' +
                        '<td>' + '<input id="ind_Q2_" name="ind_Q2_"  value="' + ((data[i].Q2_ == null) ? "" : data[i].Q2_) + '" type="text" size="3" ' + ((data[i].tipo_ == "checklist") ? "disabled = disabled" : "") + '>' + '</td>' +
                        '<td>' + '<label for="ind_target_' + data[i].id + '">' + ((data[i].Q3_target_ == null) ? "" : data[i].Q3_target_) + '<label>' + '</td>' +
                        '<td>' + '<input id="ind_Q3_" name="ind_Q3_"  value="' + ((data[i].Q3_ == null) ? "" : data[i].Q3_) + '" type="text" size="3"  ' + ((data[i].tipo_ == "checklist") ? "disabled = disabled" : "") + '>' + '</td>' +
                        '<td>' + '<label for="ind_target_' + data[i].id + '">' + ((data[i].Q4_target_ == null) ? "" : data[i].Q4_target_) + '<label>' + '</td>' +
                        '<td>' + '<input id="ind_Q4_" name="ind_Q4_"  value="' + ((data[i].Q4_ == null) ? "" : data[i].Q4_) + '" type="text" size="3" ' + ((data[i].tipo_ == "checklist") ? "disabled = disabled" : "") + '>' + '</td>' +

                        //'<td>' + '<a href="#edit" id="ind_'+data[i].id+'">Edit</a>  <a href="#save" style="display:none;">Save</a>' + '</td>' +

                        + '</tr>');

                if (data[i].tipo_ == "checklist" && data[i].CheckList != null) {
                    //console.log('#table-' + data[i].CheckList[0].link_checklist + 'checklist');
                    $('#table-' + data[i].CheckList[0].link_checklist + 'checklist').find('indicator_EBPchecklist').append(
                        '<label>' + data[i].metas_ + '<label>');
                    for (j = 0; j < data[i].CheckList.length; j++) {
                        $('#table-' + data[i].CheckList[0].link_checklist + 'checklist').find('tbody').append('<tr id="checklist" name="checklist">' +
                            '<td colspan="2">' + '<label for="chklist_' + data[i].CheckList[j].orden + '">' + data[i].CheckList[j].question + '</label>' + '</td>' +
                            '<td>' + '<input id="chklist_' + data[i].CheckList[0].link_checklist + '_Q1_" name="chklist_' + data[i].CheckList[0].link_checklist + '_Q1_"  value="' + ((data[i].CheckList[j].Q1_value == null) ? "" : data[i].CheckList[j].Q1_value) + '" type="text" size="3" ' + ((data[i].frec_ == "EQ" || data[i].frec_ == "BQ") ? "" : "disabled = disabled") + '>' + '</td>' +
                            '<td>' + '<input id="chklist_' + data[i].CheckList[0].link_checklist + '_Q1_" name="chklist_' + data[i].CheckList[0].link_checklist + '_Q1_"  value="' + ((data[i].CheckList[j].Q2_value == null) ? "" : data[i].CheckList[j].Q2_value) + '" type="text" size="3" ' + ((data[i].frec_ == "EQ" ) ? "" : "disabled = disabled") + '>' + '</td>' +
                            '<td>' + '<input id="chklist_' + data[i].CheckList[0].link_checklist + '_Q1_" name="chklist_' + data[i].CheckList[0].link_checklist + '_Q1_"  value="' + ((data[i].CheckList[j].Q3_value == null) ? "" : data[i].CheckList[j].Q3_value) + '" type="text" size="3" ' + ((data[i].frec_ == "EQ" ) ? "" : "disabled = disabled") + '>' + '</td>' +
                            '<td>' + '<input id="chklist_' + data[i].CheckList[0].link_checklist + '_Q1_" name="chklist_' + data[i].CheckList[0].link_checklist + '_Q1_"  value="' + ((data[i].CheckList[j].Q4_value == null) ? "" : data[i].CheckList[j].Q4_value) + '" type="text" size="3" ' + ((data[i].frec_ == "EQ" || data[i].frec_ == "BQ" || data[i].frec_ == "LQ") ? "" : "disabled = disabled") + '>' + '</td>' +
                            '</tr>');

                    }
                }
            }
        }
    });


    $("#tabs").tabs({ active: 0 });
    $('#language').attr('disabled', true);
    $('#country_slc').attr('disabled', true);
    $('#year_slc').attr('disabled', true);

}


function SaveRecord() {
    var language_id = $("#language").val();
    var formData_array = $('#table-WorkPlan').formtoArray('table-WorkPlan');
    //console.log(formData_array);
    //console.log(JSON.stringify(formData_array));
    var jsonItems = JSON.stringify(formData_array);
    
    $.ajax({
        url: "../FMP/IndicatorbyCountrySave/",
        cache: false,
        type: 'POST',
        dataType: 'json',
        contentType: "application/json",
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
    $('#table-tbody-WorkPlan').empty();

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

    $("#tabs").tabs({ active: 0 });
    //$("#tabs").tabs("option", "active", 0);
    //$("#tabs").tabs('select', '#tab-WorkPlan');

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
        //    {
        //    text: 'Agregar',
        //    name: 'add'        // do not change name
        //},
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
        url: "../Catalogs/ListCountriesCatalog/",
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
        url: "../Catalogs/ListLanguajeCatalog/",
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
        url: "../Catalogs/ListYearsCatalog/",
        //data: { 'carId': carId },
        success: function (data) {

            $('#year_slc').append('<option value=""> Select </option>');
            for (i = 0; i < data.length; i++) {
                $('#year_slc').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }
        }
    });


});
