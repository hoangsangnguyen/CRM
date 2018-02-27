
$(document).ready(function () {
    var url = window.location.href;
    var lstIndexOf = url.lastIndexOf("/");
    var tenantId = url.substring(lstIndexOf + 1, url.length);

    gridInit(tenantId);
    //setTimeout(rowCheckClick, 500);
    //DeleteFieldChoose();

    //AddEventListener();

    $('#nav-search-input').keypress(function (e) {
        if (e.which == 13) {
            jQuery(this).blur();
            jQuery('#btn_search').focus().click();
            return false;
        }
    });

    $('#btn_search').click(function () {
        var keyword = $('#nav-search-input').val();
        var dataSource = new kendo.data.DataSource({
            transport: {
                prefix: "",
                read: {
                    url: "/admin/log/search/?keyword=" + keyword,
                    dataType: "json",
                    type: "POST"
                }
            },
            pageSize: 10,
            page: 1,
            total: 0,
            sortable: true,
            serverPaging: true,
            serverSorting: true,
            serverFiltering: true,
            serverGrouping: true,
            serverAggregates: true,
            type: "aspnetmvc-ajax",
            filter: [],
            //error: error_handler,
            schema: {
                data: "Data",
                total: "Total",
                errors: "Errors",
                model:
                    {
                        id: "LogId",
                        fields: {
                            "LoginDate": { "type": "date" },
                            "Component": { "type": "string" },
                            "ActionName": { "type": "string" },
                            "Result": { "type": "string" },
                            "DetectedIp": { "type": "string" },
                            "AccessBrowser": { "type": "string" },
                            "CreatedLogBy": { "type": "string" }
                        }
                    }
            }
        });
        dataSource.bind("error", dataSource_error);
        gridConfigInit(dataSource);
    });
});

function gridInit(tenantId) {
    var dataSource = new kendo.data.DataSource({
        transport: {
            prefix: "",
            read: {
                url: "/admin/log/List/" + tenantId,
                dataType: "json",
                type: "POST"
            },
        },
        pageSize: 10,
        page: 1,
        sortable: true,
        total: 0,
        serverPaging: true,
        serverSorting: true,
        serverFiltering: true,
        serverGrouping: true,
        serverAggregates: true,
        type: "aspnetmvc-ajax",
        filter: [],
        //error: error_handler,
        schema: {
            data: "Data",
            total: "Total",
            errors: "Errors",
            model:
                {
                    id: "LogId",
                    fields: {
                        "LoginDate": { "type": "date" },
                        "Component": { "type": "string" },
                        "ActionName": { "type": "string" },
                        "Result": { "type": "string" },
                        "DetectedIp": { "type": "string" },
                        "AccessBrowser": { "type": "string" },
                        "CreatedLogBy": { "type": "string" }
                    }
                }
        }
    });
    dataSource.bind("error", dataSource_error);
    gridConfigInit(dataSource);
}

function dataSource_error(e) {
    if (e.status == "error") {
        loadError();
    }
    //console.log(e);
}

function loadError() {
    var msg = $("#error-page-load").val();
    if (msg == null || msg == "") {
        msg = "Loading Error!";
    }
    admincommon.showMessageDefault(msg, "Error");
}

function addCssForTable() {
    ////$('#CreatedDate').addClass('txt_align_c');
    var divControl = $("td:last-child");
    divControl.attr("class", "center");
    $("td#Active").addClass('txt_align_c');
}

function onDataBound(e) {
    if (this.dataSource.data().length < 1) {
        this.pager.element.hide();
    }
    else this.pager.element.show();
    addCssForTable();
    //OnPageChanged();
    //EditEventListener(e);
    //selectAllClick();
}


function gridConfigInit(dataSource) {
    var grid = $("#grid").data("kendoGrid");
    jQuery("#grid").kendoGrid({
        "dataBound": onDataBound,
        "columns": [
        {
            "title": "LoginDate", "attributes": { "id": "LoginDate", "name": "LoginDate" },
            "field": "LoginDate", "filterable": {}, "encoded": true, "editor": null,
            format: "{0:MM/dd/yyyy HH:mm:ss}",
            sortable: true,
        },
         {
             "title": "Component", "attributes": { "id": "Component", "name": "Component", "class": "hidden-1090" },
             "field": "Component", "filterable": {}, "encoded": true, "editor": null,

         },
          {
              "title": "ActionName", "attributes": { "id": "ActionName", "name": "ActionName", "class": "hidden-1090" },
              "field": "ActionName", "filterable": {}, "encoded": true, "editor": null,

          },
         {
             "title": "Result", "attributes": { "id": "Result", "name": "Result", "class": "hidden-610" },
             "field": "Result", "filterable": {}, "encoded": true, "editor": null,

         },
         {
             "title": "DetectedIp", "attributes": { "id": "DetectedIp", "name": "DetectedIp", "class": "hidden-480" },
             "field": "DetectedIp", "filterable": {}, "encoded": true, "editor": null,
             sortable: false,
         },
         {
             "title": "AccessBrowser", "attributes": { "id": "AccessBrowser", "name": "AccessBrowser", "class": "hidden-480" },
             "field": "AccessBrowser", "filterable": {}, "encoded": true, "editor": null,
             sortable: false,
         },
         {
             "title": "CreatedLogBy", "attributes": { "id": "CreatedLogBy", "name": "CreatedLogBy", "class": "hidden-480" },
             "field": "CreatedLogBy", "filterable": {}, "encoded": true, "editor": null,
             sortable: false,
         },
         {
             "template": "<div class=\"hidden-sm hidden-xs btn-group\">"
                 + "<button class=\"btn_table\" onClick=\"detailTenant(#= LogId #)\" ><i class=\"multi-icon fa icon_menu-square_alt2 bigger-120\"></i></button></div>",
             "field": null,
             "sortable": false,
             "filterable": false,
             "encoded": true,
             "editor": null
         }],
        "pageable": { "pageSizes": [10, 20, 30, 50, 100], "buttonCount": 10 },
        "scrollable": false,
        sortable: true,
        "dataSource": dataSource
    });
}

function detailTenant(id) {

    var siteUrl = "/admin/log/details/";
    $(location).attr('href', siteUrl + id);
}