$(document).ready(function () {
    LoadDataGrid();

    $(document).on('click', '.viewUsergroup', function (e) {
        document.location = "/Admin/Usergroup/ViewDetail/" + $(this).attr('value');
    });

    $(document).on('click', '.editUsergroup', function (e) {
        document.location = "/Admin/Usergroup/AddEdit/" + $(this).attr('value');
    });

    $(document).on('click', '.deleteUsergroup', function (e) {
        var curObj=$(this);
        //var r = confirm("Do you want to delete this user group!");
        //if (r == true) {
        ConfirmMessageBox(null, "Do you want to delete this record?", function () {
                        $.ajax({
                            url: "/Admin/UserGroup/Delete/" + curObj.attr('value'),
                            type: "POST",
                            dataType: "json",
                            cache: false,
                            async: false,
                            success: function (data) {
                                //$('.msgInfo').text(data.Message);
                                //$('#myModal').modal('show');
                                MessageBox(data.Message,parseInt(data.IsSuccess)==1?true:false);
                                //refresh grid
                                if (parseInt(data.IsSuccess) > 0) {
                                    $('#myGrid').data('kendoGrid').dataSource.read();
                                }
                            },
                            complete: function () { }
                        });
                    },true
                );
        //}
    });

    $(document).on('click', '.add_big', function (e) {
        document.location = "/Admin/Usergroup/AddEdit";
        return false;
    });
})

function LoadDataGrid() {
    $.ajax({
        url: "/Admin/UserGroup/RenderGridUserGroup",
        type: "POST",
        dataType: "json",
        cache: false,
        async: false,
        success: function (dataJS) {
            dataJS.column.push({
                field: "ID", title: " ", template: "<div style='width:100%;text-align:center' class=\"hidden-sm hidden-xs btn-group\">"
                     + "<button class=\"viewUsergroup btn_table\" value=\"#= ID #\" ><i class=\"multi-icon fa icon_menu-square_alt2 bigger-120\"></i></button>"
                     + "<button class=\"editUsergroup btn_table\" value=\"#= ID #\" ><i class=\"multi-icon fa icon_pencil bigger-120\"></i></button>"
                     + "<button class=\"deleteUsergroup btn_table \" value=\"#= ID #\" ><i class=\"multi-icon fa icon_trash_alt red bigger-120\"></i></button>"
                     + "</div><div class=\"hidden-md hidden-lg\">"
                     + "<div class=\"inline position-relative\">"
                     + "<button data-position=\"auto\" data-toggle=\"dropdown\" class=\"btn_table dropdown-toggle\"><i class=\"multi-icon fa icon_cogs bigger-150\"></i></button>"
                     + "<ul class=\"dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close\">"
                     + "<li><a title data-rel=\"tooltip\" class=\"viewUsergroup tooltip-info\" value=\"#= ID #\" data-original-title=\"View\"><i class=\"multi-icon fa icon_menu-square_alt2 bigger-120\" value='#= ID #'></i></a> </li>"
                     + "<li><a title data-rel=\"tooltip\" class=\"editUsergroup tooltip-success\" value=\"#= ID #\"  data-original-title=\"Edit\"><i class=\"multi-icon fa icon_pencil bigger-120\"></i></a> </li>"
                     + "<li><a title data-rel=\"tooltip\" class=\"deleteUsergroup tooltip-error\" value=\"#= ID #\"  data-original-title=\"Delete\"><i class=\"multi-icon fa icon_trash_alt red bigger-120\"></i></a> </li>"
                     + "</ul></div></div>"
            });
            $('#totalRow').text(dataJS.total);
            var grid = $("#myGrid").kendoGrid({
                dataSource: {
                    transport: {
                        read: {
                            url: "/Admin/UserGroup/GetDataPaging?totalRow=" + $('#totalRow').text(),
                            dataType:"json"
                        }
                    },
                    schema: {
                        data: "data",
                        total: "total"
                    },
                    group: [{ field: "TenantName" }],
                    pageSize: 10,
                    serverPaging: true
                },
                columns: dataJS.column,
                editable: false,
                sortable: true,
                selectable: "row",
                //filterable: true,
                pageable: {
                    pageSizes: [10,20,30,50,100],
                    //buttonCount: 5
                }
            }).data("kendoGrid");

        }
    })
}
