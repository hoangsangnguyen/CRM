
$(document).ready(function () {
    $('.save_big').click(function () {
        if ($.trim($('#CustomerName').val()) === "" || $.trim($('#Email').val()) === "Email") {
            ConfirmMessageBox(null, 'Please input required fields!', function () {
                $('#Name').focus();
            }, false);
            return false;
        }

        $.ajax({
            url: "/Admin/Customer/AddEditAction",
            type: "POST",
            //data: JSON.stringify($('#usergroupData').serialize()),
            data: $('#frmCustomer').serialize(),
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
                        document.location = "/Admin/Customer";
                }, false);
            },
            complete: function () { }
        });
    });

    $('.cancel_big').click(function () {
        document.location = "/Admin/Customer";
        return false;
    });

})


