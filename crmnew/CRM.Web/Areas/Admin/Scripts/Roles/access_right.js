var arrData = [];

$(document).ready(function () {

    LoadDataGrid();

    $('.save_big').click(function () {
        //alert(JSON.stringify(arrData));
        $.ajax({
            url: "/Admin/Roles/UpdateRole",
            type: "POST",
            data: JSON.stringify(arrData),
            contentType: 'application/json, charset=utf-8',
            dataType: 'json',
            cache: false,
            async: false,
            success: function (data) {
                //$('.msgInfo').text(data.Message);
                
                ConfirmMessageBox(null, data.Message, function () { }, false);
                //$('#myModal').modal('show');
                //If update fail must be refresh grid
                if(data.IsSuccess=="0")
                {
                    //Destroy grid and reload it
                    $('#myGrid').data().kendoGrid.destroy();
                    $('#myGrid').empty();
                    LoadDataGrid();
                }
                else//update successful
                {
                    arrData = [];
                }
            },
            complete: function () { }
        });
        return false;
    });

    $('.cancel_big').click(function () {
        try
        {
            //Destroy grid and reload it
            $('#myGrid').data().kendoGrid.destroy();
            $('#myGrid').empty();
            LoadDataGrid();
        }
        catch (e) { }
        return false;
    });

    //Adding click event on check box 
    $(document).on('click', '.check_row', function (e) {
        //Getting checkbox
        var $cb = $(this);
        //Getting checkbox value
        var checked = $cb.is(':checked');
        //var selector = $cb.attr('id');
        var index = $cb.attr('rowIDX');
        var bitmask=$cb.next().next().text();
        var idx = $cb.next().next().next().text();
        var obj = -1;
        var exist = false;
        for (i = 0; i < arrData.length; i++)
        {
            if(arrData[i].IDX==idx)
            {
                obj = i;
                exist = true;
                break;
            }
        }

        if(exist)
        {
            switch(index)
            {
                case "0": arrData[obj].View = checked; var count = arrData[obj].NumberOfClickView; count++; arrData[obj].NumberOfClickView = count; break;
                case "1": arrData[obj].Add = checked; var count = arrData[obj].NumberOfClickAdd; count++; arrData[obj].NumberOfClickAdd = count; break;
                case "2": arrData[obj].Edit = checked; var count = arrData[obj].NumberOfClickEdit; count++; arrData[obj].NumberOfClickEdit = count; break;
                case "3": arrData[obj].Delete = checked; var count = arrData[obj].NumberOfClickDelete; count++; arrData[obj].NumberOfClickDelete = count; break;
            }
        }
        else
        {
            switch (index) {
                case "0": var item = { IDX: idx, NumberOfBitMask: bitmask, View: checked,NumberOfClickView:1,NumberOfClickAdd:0,NumberOfClickEdit:0,NumberOfClickDelete:0 }; arrData.push(item); break;
                case "1": var item = { IDX: idx, NumberOfBitMask: bitmask, Add: checked, NumberOfClickView: 0, NumberOfClickAdd: 1, NumberOfClickEdit: 0, NumberOfClickDelete: 0 }; arrData.push(item); break;
                case "2": var item = { IDX: idx, NumberOfBitMask: bitmask, Edit: checked, NumberOfClickView: 0, NumberOfClickAdd: 0, NumberOfClickEdit: 1, NumberOfClickDelete: 0 }; arrData.push(item); break;
                case "3": var item = { IDX: idx, NumberOfBitMask: bitmask, Delete: checked, NumberOfClickView: 0, NumberOfClickAdd: 0, NumberOfClickEdit: 0, NumberOfClickDelete: 1 }; arrData.push(item); break;
            }
            
        }
        //Setting checkbox value to data Item
        //setValueToGridData(index,selector,checked);
    });

    function setValueToGridData(index,selector, val) {
        //Selecting Grid
        var grid = $("#myGrid").data("kendoGrid");
        //Getting selected Item(s)
        var row = grid.tbody.find("tr:eq("+index+")");
        var selectedItem = grid.dataItem(row);
        //Setting value to data item; so that we can read updated data
        selectedItem.set(selector, val);
    }

    function LoadDataGrid()
    {
        $.ajax({
            url: "/Admin/Roles/RenderGridRole",
            type: "POST",
            dataType: "json",
            cache: false,
            async: false,
            success: function (dataJS) {
                if (dataJS.row == null)
                {
                    return;
                }
                var grid = $("#myGrid").kendoGrid({
                    dataSource: {
                        data: dataJS.row,
                        pageSize: 10
                    },
                    columns: dataJS.column,
                    editable: false,
                    sortable: true,
                    scrollable: true,
                    selectable: "row",
                    pageable: false
                }).data("kendoGrid");

                if (dataJS.Editable == "false") {
                    $('.save_big').remove();
                    $('.wr_btn_action1').remove();
                    $('.wr_btn_action2').show();
                }
                else {
                    $('.save_big').show();
                    $('.wr_btn_action1').show();
                    $('.wr_btn_action2').show();
                    $('.cancel_big').show();
                }
            }
        })
    }

})