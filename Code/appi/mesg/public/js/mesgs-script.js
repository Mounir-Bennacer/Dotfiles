"use strict";
// Class definition

var KTDatatableRecordSelectionDemo = (function() {
    // Private functions

    var options = {
        // datasource definition
        data: {
            type: "remote",
            source: {
                read: {
                    url:
                        "http://localhost:8000/api/mesg",
                        method:'GET'
                }
            },
            pageSize: 10,
            serverPaging: true,
            serverFiltering: true,
            serverSorting: true
        },

        // layout definition
        layout: {
            scroll: true, // enable/disable datatable scroll both horizontal and
            // vertical when needed.
            height: 350, // datatable's body's fixed height
            footer: false // display/hide footer
        },

        // column sorting
        sortable: true,

        pagination: true,

        // columns definition

        columns: [
            {
                field: "id",
                title: "#",
                sortable: false,
                width: 20,
                selector: { class: "kt-checkbox--solid" },
                textAlign: "center"
            },
            {
                field: "num",
                title: "Numéro"
            },
            {
                field: "programme",
                title: "Programme"
            },
            {
                field: "commune",
                title: "Commune"
            },
            {
                field: "nb_pce",
                title: "NB PCE"
            },
            {
                field: "batiment",
                title: "Batiment"
                // autoHide: false,
                // callback function support for column rendering
                // template: function(row) {
                //     var status = {
                //         1: { title: "Online", state: "danger" },
                //         2: { title: "Retail", state: "primary" },
                //         3: { title: "Direct", state: "success" }
                //     };
                //     return (
                //         '<span class="kt-badge kt-badge--' +
                //         status[row.Type].state +
                //         ' kt-badge--dot"></span>&nbsp;<span class="kt-font-bold kt-font-' +
                //         status[row.Type].state +
                //         '">' +
                //         status[row.Type].title +
                //         "</span>"
                //     );
                // }
            },
            {
                field: "Actions",
                title: "Actions",
                sortable: false,
                width: 110,
                overflow: "visible",
                textAlign: "left",
                autoHide: false,
                template: function() {
                    return '\
                    <div class="dropdown">\
                        <a href="javascript:;" class="btn btn-sm btn-clean btn-icon btn-icon-sm" data-toggle="dropdown">\
                            <i class="flaticon2-settings"></i>\
                        </a>\
                        <div class="dropdown-menu dropdown-menu-right">\
                            <a class="dropdown-item" href="#"><i class="la la-edit"></i> Edit Details</a>\
                            <a class="dropdown-item" href="#"><i class="la la-leaf"></i> Update Status</a>\
                            <a class="dropdown-item" href="#"><i class="la la-print"></i> Generate Report</a>\
                        </div>\
                    </div>\
                    <a href="javascript:;" class="btn btn-sm btn-clean btn-icon btn-icon-sm" title="Edit details">\
                        <i class="flaticon2-file"></i>\
                    </a>\
                    <a href="javascript:;" class="btn btn-sm btn-clean btn-icon btn-icon-sm" title="Delete">\
                        <i class="flaticon2-delete"></i>\
                    </a>\
                ';
                }
            }
        ]
    };

    // ajax demo
    var serverSelectorDemo = function() {
        // enable extension
        options.extensions = {
            checkbox: true
        };
        options.search = {
            input: $("#generalSearch1")
        };

        var datatable = $("#server_record_selection").KTDatatable(options);

        $("#kt_form_status1").on("change", function() {
            datatable.search(
                $(this)
                    .val()
                    .toLowerCase(),
                "Status"
            );
        });

        $("#kt_form_type1").on("change", function() {
            datatable.search(
                $(this)
                    .val()
                    .toLowerCase(),
                "Type"
            );
        });

        $("#kt_form_status1,#kt_form_type1").selectpicker();

        datatable.on(
            "kt-datatable--on-click-checkbox kt-datatable--on-layout-updated",
            function(e) {
                // datatable.checkbox() access to extension methods
                var ids = datatable.checkbox().getSelectedId();
                var count = ids.length;
                $("#kt_datatable_selected_number1").html(count);
                if (count > 0) {
                    $("#kt_datatable_group_action_form1").collapse("show");
                } else {
                    $("#kt_datatable_group_action_form1").collapse("hide");
                }
            }
        );

        $("#kt_modal_fetch_id_server")
            .on("show.bs.modal", function(e) {
                var ids = datatable.checkbox().getSelectedId();
                var c = document.createDocumentFragment();
                for (var i = 0; i < ids.length; i++) {
                    var li = document.createElement("li");
                    li.setAttribute("data-id", ids[i]);
                    li.innerHTML = "Selected record ID: " + ids[i];
                    c.appendChild(li);
                }
                $(e.target)
                    .find(".kt-datatable_selected_ids")
                    .append(c);
            })
            .on("hide.bs.modal", function(e) {
                $(e.target)
                    .find(".kt-datatable_selected_ids")
                    .empty();
            });
    };

    return {
        // public functions
        init: function() {
            serverSelectorDemo();
        }
    };
})();

jQuery(document).ready(function() {
    KTDatatableRecordSelectionDemo.init();
});
