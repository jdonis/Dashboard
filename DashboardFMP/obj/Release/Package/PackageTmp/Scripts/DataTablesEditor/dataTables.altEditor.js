﻿/*! Datatables altEditor 2.0
 */
/**
 * @summary     altEditor
 * @description Lightweight editor for DataTables
 * @version     1.0
 * @file        dataTables.editor.lite.js
 * @author      kingkode (www.kingkode.com)
 * @contact     www.kingkode.com/contact
 * @copyright   Copyright 2016 Kingkode
 *
 * This source file is free software, available under the following license:
 *   MIT license - http://datatables.net/license/mit
 *
 * This source file is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE. See the license files for details.
 *
 * For details please refer to: http://www.kingkode.com
 */
/*
 * Modificado por Jesús Rojas (jrojash@jys.pe)
 */
! function(t) {
    "function" == typeof define && define.amd ? define(["jquery", "datatables.net"], function(o) {
        return t(o, window, document)
    }) : "object" == typeof exports ? module.exports = function(o, a) {
        return o || (o = window), a && a.fn.dataTable || (a = require("datatables.net")(o, a).$), t(a, o, o.document)
    } : t(jQuery, window, document)
}(function(t, o, a, e) {
    "use strict";
    var d = t.fn.dataTable,
        l = 0,
        i = function(o, a) {
            if (!d.versionCheck || !d.versionCheck("1.10.8")) throw "Warning: altEditor requires DataTables 1.10.8 or greater";
            this.c = t.extend(!0, {}, d.defaults.altEditor, i.defaults, a), this.s = {
                dt: new d.Api(o),
                namespace: ".altEditor" + l++
            }, this.dom = {
                modal: t('<div class="dt-altEditor-handle"/>')
            }, this._constructor()
        };
    return t.extend(i.prototype, {
        _constructor: function() {
            var o = this,
                e = this.s.dt;
            this._setup(), e.on("destroy.altEditor", function() {
                e.off(".altEditor"), t(e.table().body()).off(o.s.namespace), t(a.body).off(o.s.namespace)
            })
        },
        _setup: function() {
            var o = this;
            this.s.dt;
            t("body").append('<div class="modal fade" id="altEditor-modal" tabindex="-1" role="dialog"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button><h4 class="modal-title"></h4></div><div class="modal-body"><p></p></div><div class="modal-footer"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button><button type="button" class="btn btn-primary">Save changes</button></div></div></div></div>'), this.s.dt.button("edit:name") && (this.s.dt.button("edit:name").action(function(t, a, e, d) {
                a.rows({
                    selected: !0
                }).count();
                o._openEditModal()
            }), t(a).on("click", "#editRowBtn", function(t) {
                t.preventDefault(), t.stopPropagation(), o._editRowData()
            })), this.s.dt.button("delete:name") && (this.s.dt.button("delete:name").action(function(t, a, e, d) {
                a.rows({
                    selected: !0
                }).count();
                o._openDeleteModal()
            }), t(a).on("click", "#deleteRowBtn", function(t) {
                t.preventDefault(), t.stopPropagation(), o._deleteRow()
            })), this.s.dt.button("add:name") && (this.s.dt.button("add:name").action(function(t, a, e, d) {
                a.rows({
                    selected: !0
                }).count();
                o._openAddModal()
            }), t(a).on("click", "#addRowBtn", function(t) {
                t.preventDefault(), t.stopPropagation(), o._addRowData()
            }))
        },
        _emitEvent: function(o, a) {
            this.s.dt.iterator("table", function(e, d) {
                t(e.nTable).triggerHandler(o + ".dt", a)
            })
        },
        _openEditModal: function() {
            for (var o = this.s.dt, a = [], e = 0; e < o.context[0].aoColumns.length; e++) a.push({
                title: o.context[0].aoColumns[e].sTitle
            });
            var d = o.rows({
                    selected: !0
                }),
                l = "";

            ResetRecord();
            GetRecord(d.data()[0]);

            $("#altEditor-modal").find(".modal-title").html("Editar Registro");
            $('#addRowBtn').text("Editar Registro");
            $('#addRowBtn').attr('id', 'editRowBtn');
            $('#deleteRowBtn').attr('id', 'editRowBtn');

            $('#altEditor-modal .modal-body .alert').remove();
            $('#altEditor-modal').on('show.bs.modal', function (e) {
                console.log("show modal _openEditModal")
                //if (!data) return e.preventDefault() // stops modal from being shown
            });
            $("#altEditor-modal").modal("show");
        },
        _editRowData: function() {
            var o = this,
                a = this.s.dt,
                e = {},
                d = t('form[name="altEditor-form"] input.primarykey').attr("name");
            t('form[name="altEditor-form"] input').each(function(o) {
                e[t(this).attr("name")] = t(this).val()
            }), t("#altEditor-modal .modal-body .alert").remove();

            if (validate() == true) {
                SaveRecord();
                ResetRecord();
                $("#altEditor-modal").modal("hide");
            }


            //var l = a.row({
            //        selected: !0
            //    }).index(),
            //    i = '<div class="alert alert-success" role="alert"><strong>Satisfactrio!</strong> El registro ha sido actualizado en la base datos.</div>';
            //t("#altEditor-modal .modal-body").append(i), t(o.s.dt.context[0].nTable).trigger("savedata", ["edit", d, e, l])

        },
        _openDeleteModal: function() {
            for (var o = this.s.dt, a = [], e = 0; e < o.context[0].aoColumns.length; e++) a.push({
                title: o.context[0].aoColumns[e].sTitle
            });
            var d = o.rows({
                    selected: !0
                }),
                l = "";

                ResetRecord();
                GetRecord(d.data()[0]);
                DisableRecord();

                $("#altEditor-modal").find(".modal-title").html("Eliminar Registro");
                $('#addRowBtn').text("Eliminar Registro");
                $('#addRowBtn').attr('id', 'deleteRowBtn');
                $('#editRowBtn').attr('id', 'deleteRowBtn');

                $('#altEditor-modal .modal-body .alert').remove();
                $('#altEditor-modal').on('show.bs.modal', function (e) {
                    console.log("show modal _openDeleteModal")
                    //if (!data) return e.preventDefault() // stops modal from being shown
                });
                $("#altEditor-modal").modal("show");
        },
        _deleteRow: function() {
            var o = this,
                a = this.s.dt;

                DeleteRecord();
                ResetRecord();
                $("#altEditor-modal").modal("hide");
        },
        _openAddModal: function() {
            for (var o = this.s.dt, a = [], e = 0; e < o.context[0].aoColumns.length; e++) a.push({
                title: o.context[0].aoColumns[e].sTitle
            });

            ResetRecord();

            $('#altEditor-modal .modal-body .alert').remove();
            $('#altEditor-modal').on('show.bs.modal', function (e) {
                console.log("show modal _openAddModal");
            });
            $("#altEditor-modal").find(".modal-title").html("Agregar Registro");
            $('#editRowBtn').text("Agregar Registro");
            $('#editRowBtn').attr('id', 'addRowBtn');
            $('#deleteRowBtn').attr('id', 'addRowBtn');
            $('#loading').hide();
            $("#altEditor-modal").modal("show");

        },
        _addRowData: function() {
            var o = this,
                a = (this.s.dt, {}),
                e = t('form[name="altEditor-form"] input.primarykey').attr("name");

            if (validate() == true) {
                console.log("_addRowData")
                CreateRecord();
                ResetRecord();
                $("#altEditor-modal").modal("hide");
            }

            
        },
        _getExecutionLocationFolder: function() {
            var o = "dataTables.altEditor.js",
                a = t("script[src]"),
                e = t.grep(a, function(t) {
                    return -1 !== t.src.indexOf(o) ? t : void 0
                }),
                d = e[0].src,
                l = d.substring(0, d.lastIndexOf("/") + 1);
            return l
        }
    }), i.version = "1.0", i.defaults = {
        alwaysAsk: !1,
        focus: null,
        columns: "",
        update: null,
        editor: null
    }, i.classes = {
        btn: "btn"
    }, t(a).on("preInit.dt.altEditor", function(o, a, e) {
        if ("dt" === o.namespace) {
            var l = a.oInit.altEditor,
                n = d.defaults.altEditor;
            if (l || n) {
                var r = t.extend({}, l, n);
                l !== !1 && new i(a, r)
            }
        }
    }), d.altEditor = i, i
});