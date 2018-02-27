var isSuccess = "0";
$(document).ready(function () {
    $('.save_big').click(function () {
        if ($.trim($('#Name').val()) == "")
        {
            ConfirmMessageBox(null, 'Please input required fields!', function () {
                $('#Name').focus();
            }, false);
            return;
        }
        $.ajax({
            url: "/Admin/UserGroup/AddEditAction",
            type: "POST",
            //data: JSON.stringify($('#usergroupData').serialize()),
            data: $('#usergroupData').serialize(),
            //contentType: 'application/json, charset=utf-8',
            dataType: 'json',
            cache: false,
            async: false,
            success: function (data) {
                //$('.msgInfo').text(data.Message);
                //$('#myModal').modal('show');
                isSuccess = data.isSuccess;
                ConfirmMessageBox(null, data.Message, function () {
                    if (isSuccess = "1")
                        document.location = "/Admin/Usergroup";
                }, false);
            },
            complete: function () { }
        });
    });
    
    $('.cancel_big').click(function () {
        document.location = "/Admin/Usergroup";
        return false;
    });

})


