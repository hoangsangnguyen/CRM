﻿
$(document).ready(function () {
    gridInit();
    setTimeout(rowCheckClick, 500);
    DeleteFieldChoose();

    AddEventListener();

    $('#nav-search-input').keypress(function (e) {
        if (e.which == 13) {
            jQuery(this).blur();
            jQuery('#btn_search').focus().click();
            return false;
        }
    });

    $('#btn_search').click(function () {
        var id = $('#id').text();
        var keyword = $('#nav-search-input').val();
        var dataSource = new kendo.data.DataSource({
            transport: {
                prefix: "",
                read: {
                    url: "/admin/user/search/?keyword=" + keyword + "&id=" + id,
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
                        id: "ID",
                        fields: {
                            "ID": { "type": "number" },
                            "FullName": { "type": "string" },
                            "Username": { "type": "string" },
                            "DisplayName": { "type": "string" },
                            "Email": { "type": "string" },
                            "Active": { "type": "boolean" },
                            "RoleName": { "type": "string" }
                        }
                    }
            }
        });
        dataSource.bind("error", dataSource_error);
        gridConfigInit(dataSource);
    });
});

function rowCheckClick() {
    $('tr .row-checkbox').click(function (e) {
        allCheckStatus();
        if (this.checked)
            $(this).parent().parent().addClass('active');
        else
            $(this).parent().parent().removeClass('active');
    });
}
function allCheckStatus() {
    var allcheck = true;
    count = 0;
    for (var i = 0; i < $('tr .row-checkbox').length; i++) {
        if ($('tr .row-checkbox').get(i).checked == false) {
            allcheck = false;
        }
        else
            count++;
    }
    if (allcheck == true) {
        $('#allchecked').prop('checked', true);
        $('.delete_big').animate({ opacity: 1 }, 200, function () { $('.delete_big').removeAttr("style"); });
    }
    else {
        $('#allchecked').prop('checked', false);
        if (count == 0)
            $('.delete_big').animate({ opacity: 0 }, 200, function () {
                $('.delete_big').css("visibility", "hidden");
            });
        else
            $('.delete_big').animate({ opacity: 1 }, 200, function () {
                $('.delete_big').removeAttr("style");
            });
    }
}

function gridInit() {
    var id = $('#id').text();
    var dataSource = new kendo.data.DataSource({
        transport: {
            prefix: "",
            read: {
                url: "/admin/user/list/" + id,
                dataType: "json",
                type: "POST"
            },
            update: { url: "/admin/user/edit" },
            destroy: { url: "/admin/user/DeleteConfirmed" }
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
                    id: "ID",
                    fields: {
                        "ID": { "type": "number" },
                        "Username": { "type": "string" },
                        "DisplayName": { "type": "string" },
                        "FullName": { "type": "string" },
                        "Email": { "type": "string" },
                        "Active": { "type": "boolean" },
                        "RoleName": { "type": "string" }
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
function confirmDelete(idDelete) {
    //$('.show_massage').hide();
    //var siteUrl = "/admin/user/delete";

    //var _pageSize = $("#grid").data("kendoGrid").dataSource._pageSize;
    //var _pageNumber = 1;
    //var dialog = new CRMDialog("modal-mask");
    //var kendoWindow = dialog.showDialog($("#confirmDialogTitle").val(), $("#delete-confirmation").html());
    //kendoWindow
    //    .find(".delete-confirm,.delete-cancel")
    //        .click(function () {
    //            if ($(this).hasClass("delete-confirm")) {
    //                $.ajax({
    //                    url: siteUrl,
    //                    type: "POST",
    //                    data: { id: idDelete },
    //                    success: function (result) {
    //                        if (result.Status != null && result.Status == 0) {
    //                            window.close()
    //                            $("#grid").data("kendoGrid").dataSource.read();
    //                        }
    //                        if (result.Message != null) {
    //                            alert(result.Message);
    //                            return false;
    //                        }
    //                    }
    //                });
    //            }
    //            kendoWindow.data("kendoWindow").close();
    //        })
    //        .end();

    ConfirmMessageBox(null, null, function () {
        $.ajax({
            url: "/admin/user/delete",
            type: "POST",
            data: { id: idDelete },
            success: function (result) {
                if (result.Status != null && result.Status == 0) {
                    window.close()
                    $("#grid").data("kendoGrid").dataSource.read();
                }
                if (result.Message != null) {
                    MessageBox(result.Message, false);
                }
            }
        });
    }, true)

}


function onDataBound(e) {
    $(".k-grid-Delete").addClass("delete_fr");
    $(".k-grid-Edit").addClass("edit_fr");
    $(".k-grid-Refresh").addClass("icon_menu-square_alt2");
    if (this.dataSource.data().length < 1) {
        this.pager.element.hide();
    }
    else this.pager.element.show();
    OnPageChanged();
    EditEventListener(e);
    selectAllClick();
}
function OnPageChanged() {
    if ($('#allchecked').is(':checked')) {
        $('.delete_big').animate({ opacity: 0 }, 200, function () { });
        $('#allchecked').prop('checked', false);
    }
    else {
        $('.delete_big').animate({ opacity: 0 }, 200, function () { });
    }
    setTimeout(rowCheckClick, 500);
}
function selectAllClick() {
    $("#allchecked").click(function () {
        $(".row-checkbox").prop("checked", $(this).is(":checked"));
        var checkCount = $("input:checked.row-checkbox").length;
        if (checkCount > 0) {
            $('.delete_big').animate({ opacity: 1 }, 200, function () { $('.delete_big').removeAttr("style"); });
            $("#grid tr[role=row]").addClass("active");

        } else {
            $('.delete_big').animate({ opacity: 0 }, 200, function () { $('.delete_big').css("visibility", "hidden"); });
            $("#grid tr[role=row]").removeClass("active");
        }
    });

}



function gridConfigInit(dataSource) {
    var grid = $("#grid").data("kendoGrid");
    var tempSudo = "<div class=\"hidden-sm hidden-xs btn-group\">" +
                "<button class=\"btn_table\" onClick=\"detailUser(#= ID #)\" ><i class=\"multi-icon fa icon_menu-square_alt2 bigger-120\"></i></button>" +
                "<button class=\"btn_table\" #= !IsShowButton ? \"style='display:none'\" : '' #  onClick=\"editUser(#= ID #)\" ><i class=\"multi-icon fa icon_pencil bigger-120\"></i></button>" +
                "<button class=\"btn_table\" #= !IsShowButton ? \"style='display:none'\" : '' #  onClick=\"confirmDelete(#= ID #)\" ><i class=\"js-btn-delete-selected multi-icon fa icon_trash_alt red bigger-120\"></i></button>";
    if ($("#showBtn").text().toLowerCase() == "true") {
        tempSudo += "<button class=\"btn_table showSudo\"  onClick=\"showSudoPopup(#= ID #,'#= Username #')\" ><i class=\"js-btn-delete-selected multi-icon fa icon_group bigger-120\"></i></button>";
    }
    tempSudo += "</div>" +

    "<div class=\"hidden-md hidden-lg\"><div class=\"inline position-relative\">" +
    "<button data-position=\"auto\" data-toggle=\"dropdown\" class=\"btn_table dropdown-toggle\"><i class=\"multi-icon fa icon_cogs bigger-150\"></i></button>" +
    "<ul class=\"dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close\">" +
    "<li><a title data-rel=\"tooltip\" class=\"tooltip-info\" onClick=\"detailUser(#= ID #)\" data-original-title=\"View\">" +
    "<i class=\"multi-icon fa icon_menu-square_alt2 bigger-120\"></i></a> </li>" +
    "<li #= !IsShowButton ? \"style='display:none'\" : '' #><a title data-rel=\"tooltip\" class=\"tooltip-success\" onClick=\"editUser(#= ID #)\"  data-original-title=\"Edit\">" +
    "<i class=\"multi-icon fa icon_pencil bigger-120\"></i></a> </li>" +
    "<li #= !IsShowButton ? \"style='display:none'\" : '' #><a title data-rel=\"tooltip\" class=\"tooltip-error\" onClick=\"confirmDelete(#= ID #)\"  data-original-title=\"Delete\">" +
    "<i class=\"multi-icon fa icon_trash_alt red bigger-120\"></i></a> </li>";
    if ($("#showBtn").text().toLowerCase() == "true") {
        tempSudo += "<li class=\"showSudo\"><a title data-rel=\"tooltip\" class=\"tooltip-error\" onClick=\"showSudoPopup(#= ID #,'#= Username #')\"  data-original-title=\"Delete\">" +
        "<i class=\"multi-icon fa icon_group bigger-120\"></i></a> </li>";
    }
    tempSudo += "</ul></div></div>";

    //grid.destroy();
    jQuery("#grid").kendoGrid({
        "dataBound": onDataBound,
        "columns": [
        //{
        //    "width": "20px",
        //    "template": "\u003cinput id=\u0027checkbox#: ID #\u0027 data-id=\u0027#: ID #\u0027 class=\u0027row-checkbox css-checkbox\u0027 type=\u0027checkbox\u0027 /\u003e\u003clabel for=\u0027checkbox#: ID #\u0027 class=\u0027css-labelcheck text_hide\u0027\u003e\u003c/label\u003e", "field": null, "sortable": false, "filterable": false, "encoded": true, "editor": null
        //},
         {
             "title": "FullName", "attributes": { "id": "FullName", "name": "FullName" },
             "field": "FullName", "filterable": {}, "encoded": true, "editor": null,

         },
         {
             "title": "Username", "attributes": { "id": "Username", "name": "Username" },
             //"template": "<span class='grid-row-edit' data-id='#:ID#'>#:Username#</span>",
             "field": "Username", "filterable": {}, "encoded": true, "editor": null,
             sortable: true,
         },
        {
            "title": "DisplayName", "attributes": { "id": "DisplayName", "name": "DisplayName", "class": "hidden-1090" },
            "field": "DisplayName", "filterable": {}, "encoded": true, "editor": null,
        },
        {
            "title": "Email", "attributes": { "id": "Email", "name": "Email", "class": "hidden-610" },
            "field": "Email", "filterable": {}, "encoded": true, "editor": null,
        },
        {
            "title": "Active", "attributes": { "id": "Active", "name": "Active", "class": "hidden-410" },
            "template": "<input type=\"checkbox\" id=\"Selected_active\"  #= Active ? checked='checked' : '' #  disabled=\"disabled\" />",
            "field": "Active", "filterable": {}, "encoded": true, "editor": null,
            sortable: false,
        },
        {
            "title": "RoleName", "attributes": { "id": "RoleName", "name": "RoleName", "class": "hidden-480" },
            "field": "RoleName", "filterable": {}, "encoded": true, "editor": null,
            sortable: false,
        },
         {
             "template": tempSudo,

             "field": null,
             "sortable": false,
             "filterable": false,
             "encoded": true,
             "editor": null
         }
//{
//    "width": "130px", "command": [
//        { "id": "Refresh", "name": "Refresh", "attr": " href=\"javascript:void(0)\"", "text": "Refresh", "click": Edituser, },
//        { "name": "Edit", "attr": " class=\"edit_fr\" href=\"javascript:void(0)\"", "buttonType": "ImageAndText", "text": "Edit", "click": Edituser },
//        { "name": "Delete", "attr": " class=\"delete_fr\" href=\"javascript:void(0)\"", "buttonType": "ImageAndText", "text": "Delete", "click": confirmDelete }
//    ]
//}
        ],
        "pageable": { "pageSizes": [10, 20, 30, 50, 100], "buttonCount": 10 },
        "scrollable": false,
        sortable: true,
        "editable": {
            "confirmation": "Are you sure you want to delete this record?",
            "mode": "popup",
            "template": "\u003cdiv class=\"editor-label\"\u003e\u003clabel for=\"Id\"\u003eId\u003c/label\u003e\u003c/div\u003e\u003cdiv class=\"editor-field\"\u003e\u003cinput class=\"text-box single-line\" data-val=\"true\" data-val-number=\"The field Id must be a number.\" data-val-required=\"The Id field is required.\" id=\"Id\" name=\"Id\" type=\"number\" value=\"0\" /\u003e \u003cspan class=\"field-validation-valid\" data-valmsg-for=\"Id\" data-valmsg-replace=\"true\"\u003e\u003c/span\u003e\u003c/div\u003e\u003cdiv class=\"editor-label\"\u003e\u003clabel for=\"Username\"\u003eUsername\u003c/label\u003e\u003c/div\u003e\u003cdiv class=\"editor-field\"\u003e\u003cinput class=\"text-box single-line\" data-val=\"true\" data-val-length=\"The Username length must be between 3 to 50 characters.\" data-val-length-max=\"50\" data-val-length-min=\"3\" data-val-regex=\"Username is invalid.\" data-val-regex-pattern=\"^[a-z0-9_-]{3,50}$\" data-val-required=\"The Username field is required.\" id=\"Username\" name=\"Username\" type=\"text\" value=\"\" /\u003e \u003cspan class=\"field-validation-valid\" data-valmsg-for=\"Username\" data-valmsg-replace=\"true\"\u003e\u003c/span\u003e\u003c/div\u003e\u003cdiv class=\"editor-label\"\u003e\u003clabel for=\"FullName\"\u003eFull Name\u003c/label\u003e\u003c/div\u003e\u003cdiv class=\"editor-field\"\u003e\u003cinput class=\"text-box single-line\" data-val=\"true\" data-val-required=\"The Full Name field is required.\" id=\"FullName\" name=\"FullName\" type=\"text\" value=\"\" /\u003e \u003cspan class=\"field-validation-valid\" data-valmsg-for=\"FullName\" data-valmsg-replace=\"true\"\u003e\u003c/span\u003e\u003c/div\u003e\u003cdiv class=\"editor-label\"\u003e\u003clabel for=\"Email\"\u003eEmail\u003c/label\u003e\u003c/div\u003e\u003cdiv class=\"editor-field\"\u003e\u003cinput class=\"text-box single-line\" data-val=\"true\" data-val-email=\"The Email field is not a valid e-mail address.\" data-val-required=\"The Email field is required.\" id=\"Email\" name=\"Email\" type=\"email\" value=\"\" /\u003e \u003cspan class=\"field-validation-valid\" data-valmsg-for=\"Email\" data-valmsg-replace=\"true\"\u003e\u003c/span\u003e\u003c/div\u003e\u003cdiv class=\"editor-label\"\u003e\u003clabel for=\"CreatedDate\"\u003eUpdated Date\u003c/label\u003e\u003c/div\u003e\u003cdiv class=\"editor-field\"\u003e\u003cinput class=\"text-box single-line\" data-val=\"true\" data-val-date=\"The field Updated Date must be a date.\" data-val-required=\"The Updated Date field is required.\" id=\"CreatedDate\" name=\"CreatedDate\" type=\"datetime\" value=\"01.01.0001 00:00:00\" /\u003e \u003cspan class=\"field-validation-valid\" data-valmsg-for=\"CreatedDate\" data-valmsg-replace=\"true\"\u003e\u003c/span\u003e\u003c/div\u003e\u003cdiv class=\"editor-label\"\u003e\u003clabel for=\"SiteId\"\u003eSiteId\u003c/label\u003e\u003c/div\u003e\u003cdiv class=\"editor-field\"\u003e\u003cinput class=\"text-box single-line\" data-val=\"true\" data-val-number=\"The field SiteId must be a number.\" data-val-required=\"The SiteId field is required.\" id=\"SiteId\" name=\"SiteId\" type=\"number\" value=\"0\" /\u003e \u003cspan class=\"field-validation-valid\" data-valmsg-for=\"SiteId\" data-valmsg-replace=\"true\"\u003e\u003c/span\u003e\u003c/div\u003e\u003cdiv class=\"editor-label\"\u003e\u003clabel for=\"DisplayName\"\u003eDisplay name\u003c/label\u003e\u003c/div\u003e\u003cdiv class=\"editor-field\"\u003e\u003cinput class=\"text-box single-line\" data-val=\"true\" data-val-required=\"The Display name field is required.\" id=\"DisplayName\" name=\"DisplayName\" type=\"text\" value=\"\" /\u003e \u003cspan class=\"field-validation-valid\" data-valmsg-for=\"DisplayName\" data-valmsg-replace=\"true\"\u003e\u003c/span\u003e\u003c/div\u003e\u003cdiv class=\"editor-label\"\u003e\u003clabel for=\"Password\"\u003ePassword\u003c/label\u003e\u003c/div\u003e\u003cdiv class=\"editor-field\"\u003e\u003cinput class=\"text-box single-line password\" data-val=\"true\" data-val-length=\"The Password length must be between 3 to 40 characters.\" data-val-length-max=\"40\" data-val-length-min=\"3\" id=\"Password\" name=\"Password\" type=\"password\" value=\"\" /\u003e \u003cspan class=\"field-validation-valid\" data-valmsg-for=\"Password\" data-valmsg-replace=\"true\"\u003e\u003c/span\u003e\u003c/div\u003e\u003cdiv class=\"editor-label\"\u003e\u003clabel for=\"ConfirmPassword\"\u003eConfirm Password\u003c/label\u003e\u003c/div\u003e\u003cdiv class=\"editor-field\"\u003e\u003cinput class=\"text-box single-line password\" data-val=\"true\" data-val-equalto=\"Confirm Password must match!\" data-val-equalto-other=\"*.Password\" id=\"ConfirmPassword\" name=\"ConfirmPassword\" type=\"password\" value=\"\" /\u003e \u003cspan class=\"field-validation-valid\" data-valmsg-for=\"ConfirmPassword\" data-valmsg-replace=\"true\"\u003e\u003c/span\u003e\u003c/div\u003e\u003cdiv class=\"editor-label\"\u003e\u003clabel for=\"UpdatedDate\"\u003eUpdated Date\u003c/label\u003e\u003c/div\u003e\u003cdiv class=\"editor-field\"\u003e\u003cinput class=\"text-box single-line\" data-val=\"true\" data-val-date=\"The field Updated Date must be a date.\" id=\"UpdatedDate\" name=\"UpdatedDate\" type=\"datetime\" value=\"\" /\u003e \u003cspan class=\"field-validation-valid\" data-valmsg-for=\"UpdatedDate\" data-valmsg-replace=\"true\"\u003e\u003c/span\u003e\u003c/div\u003e\u003cdiv class=\"editor-label\"\u003e\u003clabel for=\"Active\"\u003eActive\u003c/label\u003e\u003c/div\u003e\u003cdiv class=\"editor-field\"\u003e\u003cinput class=\"check-box\" data-val=\"true\" data-val-required=\"The Active field is required.\" id=\"Active\" name=\"Active\" type=\"checkbox\" value=\"true\" /\u003e\u003cinput name=\"Active\" type=\"hidden\" value=\"false\" /\u003e \u003cspan class=\"field-validation-valid\" data-valmsg-for=\"Active\" data-valmsg-replace=\"true\"\u003e\u003c/span\u003e\u003c/div\u003e\u003cdiv class=\"editor-label\"\u003e\u003clabel for=\"AllRole\"\u003eAllRole\u003c/label\u003e\u003c/div\u003e\u003cdiv class=\"editor-field\"\u003e\u003cinput class=\"text-box single-line\" id=\"AllRole\" name=\"AllRole\" type=\"text\" value=\"\" /\u003e \u003cspan class=\"field-validation-valid\" data-valmsg-for=\"AllRole\" data-valmsg-replace=\"true\"\u003e\u003c/span\u003e\u003c/div\u003e",
            "window": {
                "title": "Edit", "modal": true,
                "draggable": true, "resizable": false
            },
            "create": true, "update": true, "destroy": true
        },
        "dataSource": dataSource
    });
}

function detailUser(id) {

    var siteUrl = "/admin/user/details/";
    $(location).attr('href', siteUrl + id);
}

function editUser(id) {
    var siteUrl = "/admin/user/edit/";
    $(location).attr('href', siteUrl + id);
}

//validate text
function validateSudo() {
    $("#msgPassword").find('span').remove();

    if ($("#txtPassword").val() == '') {
        $("#msgPassword").append('<span>* Required</span>');
        $("#txtPassword").focus();
        return false;
    }
    return true;
}

function showSudoPopup(id, userName) {
    var siteUrl = "/admin/user/SudoLogin";
    var dialog = new CRMDialog("modal-mask");

    var kendoWindow = dialog.showDialog("Sudo this user?", $("#Sudo-confirmation").html(), 400, 250);
    $('#txtUserName').val(userName);
    kendoWindow
        .find(".sudo-confirm,.sudo-cancel,.sudo-login-cancel")
            .click(function () {
                if ($(this).hasClass("sudo-confirm")) {
                    if (!validateSudo()) return false;
                    $.ajax({
                        url: siteUrl,
                        type: "POST",
                        //contentType: "application/json; charset=utf-8",
                        data: { id: id, userName: userName, password: $('#txtPassword').val() },
                        success: function (result) {
                            if (result.Status != null && result.Status == 0) {
                                window.close()
                                //kendoWindow.data("kendoWindow").close();
                                if (result.Message == 'user')
                                    window.location.href = "/admin/Dashboard/Index";
                                else
                                    location.reload();
                            }
                            if (result.Message != null && result.Status != 0) {
                                $(".sudo_show_massage .wr_btn_pp span").remove();
                                $(".sudo_show_massage .wr_btn_pp").prepend("<span>" + result.Message + "</span>");
                                $(".sudo_show_massage").show();
                                $(".sudo-dialogsShow").hide();

                                return false;
                            }
                        }
                    });
                }
                else if ($(this).hasClass("sudo-cancel")) {
                    kendoWindow.data("kendoWindow").close();
                }
                else if ($(this).hasClass("sudo-login-cancel")) {
                    $(".sudo_show_massage").hide();
                    $(".sudo-dialogsShow").show();
                }
            }).end();
}


function DeleteFieldChoose() {
    $(".js-btn-delete-selected").unbind("click").click(function () {
        var siteUrl = "/admin/user/DeleteRecords";
        var dialog = new CRMDialog("modal-mask");
        var kendoWindow = dialog.showDialog($("#confirmDialogTitle").val(), $("#delete-confirmation").html());
        kendoWindow
            .find(".delete-confirm,.delete-cancel")
                .click(function () {
                    if ($(this).hasClass("delete-confirm")) {
                        var rowDelete = "";
                        var _pageSize = $("#grid").data("kendoGrid").dataSource._pageSize;
                        var _pageNumber = 1;// $("#grid").data("kendoGrid").dataSource._page;
                        var ids = new Array();
                        var grid = $("#grid").data("kendoGrid");
                        var rows = grid.tbody.find("input:checked").closest("tr");
                        rows.each(function () {
                            if ($(this).val() != null && $(this).val != "") {
                                var dataItem = grid.dataItem($(this));
                                ids.push(dataItem.ID);
                            }
                        });

                        $.ajax({
                            url: siteUrl,
                            type: "POST",
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify(ids),
                            beforeSend: function () {
                                //admincommon.hideMessage();
                                //admincommon.showMask();
                                //should show a mask
                            },
                            success: function (result) {
                                if (result.Status != null && result.Status == 0) {
                                    // admincommon.hideMask();
                                    $("#grid").data("kendoGrid").dataSource.read();
                                }
                                if (result.Message != null) {
                                    //admincommon.showMessageDefault(result.Message, result.Status);
                                }
                            },
                            error: function (errorResult) {
                                loadError();
                            },
                            complete: function () {
                                admincommon.hideMask();
                            }
                        });
                    }
                    kendoWindow.data("kendoWindow").close();
                }).end();
    });
}

function AddEventListener(e) {
    $('.js-add-category').click(function () {
        var siteUrl = $('#currentSitePath').val();
        if (siteUrl != null) {
            $(location).attr('href', siteUrl + '/user/add/');
        } else {
            $(location).attr('href', '/user/add/');
        }
    });
}


function EditEventListener(e) {
    $('.grid-row-edit').click(function () {
        var siteUrl = '/admin/user/edit/';
        var id = $(this).attr('data-id');
        $(location).attr('href', siteUrl + id);
    });
}