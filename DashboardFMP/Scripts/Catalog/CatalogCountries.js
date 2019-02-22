
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
            $('#Description').val("");
            $('#Group').prop('checked', false);
            $('#Code').val("");
            $('#languaje').val("");
}


function validate() {

    var msg = "";

    if ($("#Name").val() == "") { msg  += " Ingrese el nombre" + "\n"; $("#Name").focus()}
    if ($("#Code").val() == "") { msg += " Ingrese el código del país" + "\n"; $("#Code").focus() };
    if ($("#languaje").val() == "") { msg += " Ingrese el lenguaje" + "\n"; $("#languaje").focus() };

    if (msg !== "") { alert(msg); return false; }
    return true;

}

function GetRecord(id) {

    console.log("Edit_Record " + id);
    $.ajax({
        type: "POST",
        url: url_ + "/Catalogs/CountryGet/",
        data: { 'ID': id["id"] },
        success: function (data) {
            console.log("Response Edit_record");
            console.log(data);

            $('#id').val(id["id"]);
            $('#Name').val(data[0].name);
            $('#Description').val(data[0].description);
            if (data[0].group == true)
                $('#Group').prop('checked', true);
            $('#Code').val(data[0].code);
            $('#languaje').val(data[0].language_id);

        }
    });

    $('#languaje').attr('disabled', true);

}


function SaveRecord() {
    var id = $("#id").val();
    var formData = $('#altEditor-form').serializeObject();
    console.log(formData);
    $.extend(formData, { 'country': id }); //Send Additional data
    $.extend(formData, { 'language': $("#languaje option:selected").val() }); //Send Additional data  $("#languaje").val()

    $.ajax({
        url: url_ + "/Catalogs/CountrySave/",
        cache: false,
        type: 'POST',
        dataType: 'json',
        data: decodeURIComponent($.param(formData)),
        success: function (data) {
            $('#Countries').DataTable().ajax.reload();
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
    console.log(formData);
    $.extend(formData, { 'language': $("#languaje option:selected").val() }); //Send Additional data  $("#languaje").val()


    $.ajax({
        url: url_ + "/Catalogs/CountryCreate/",
        cache: false,
        type: 'POST',
        dataType: 'json',
        data: decodeURIComponent($.param(formData)),
        success: function (data) {
            $('#Countries').DataTable().ajax.reload();
            alert('Registro creado');
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
    $.extend(formData, { 'country': id }); //Send Additional data

    $.ajax({
        url: url_ + "/Catalogs/CountryDelete/",
        cache: false,
        type: 'POST',
        dataType: 'json',
        data: decodeURIComponent($.param(formData)),
        success: function (data) {
            $('#Countries').DataTable().ajax.reload();
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
    $('#Description').attr("disabled", true);
    $('#Group').attr("disabled", true);
    $('#Code').attr("disabled", true);
    $('#languaje').attr("disabled", true);


}

$(document).ready(function () {

    //$.validate({
    //    validateHiddenInputs: true
    //});

        //$("#altEditor-modal_AM").modal("hide");

    var table = $('#Countries').DataTable({
        "ajax": {
            "url": url_ + "/Catalogs/CountriesListDataTables/",
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


// Catalogo de idiomas
    $('#languaje').empty()
    $.ajax({
        type: "POST",
        url: url_ + "/Catalogs/ListLanguajeCatalog/",
        //data: { 'carId': carId },
        success: function (data) {

            $('#languaje').append('<option value=""> Select </option>');
            for (i = 0; i < data.length; i++) {
                //console.log(data[i].id + "---" + data[i].name);
                $('#languaje').append('<option value="' + data[i].id + '">' + data[i].name + '</option>');
            }

            //$.each(opts, function (i, d) {
            //    // You will need to alter the below to get the right values from your json object.  Guessing that d.id / d.modelName are columns in your carModels data
            //    $('#emptyDropdown').append('<option value="' + d.id + '">' + d.name + '</option>');
            //});
        }
    });

    //var $modal = $('#altEditor-modal_AM');

    ////when hidden
    //$modal.on('hidden.bs.modal', function (e) {
    //    return this.render(); //DOM destroyer
    //});

    //$modal.modal('hide'); //start hiding



});
