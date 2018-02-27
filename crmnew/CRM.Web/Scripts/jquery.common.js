/*
    Alert confirm Yes|No or OK
    titleMgs        : title of message box
    contentMsg      : content of alert
    fuctionAction   : action of function
    typeShow        : true: yes|No , false : ok

*/
function ConfirmMessageBox(titleMgs, contentMsg, fuctionAction, typeShow) {

    var dialog = new CRMDialog("modal-mask");
    var kendoWindow = dialog.showDialog(titleMgs == null ? $("#confirmDialogTitleDefault").val() : titleMgs, $("#confirmationPublic").html());
    if (typeShow)
        $('#modal .Msgconfirm').show();
    else
        $('#modal .MsgOk').show();

    $('#modal h4 span').append(contentMsg == null ? $("#confirmDialogContentDefault").val() : contentMsg);
    kendoWindow
        .find(".confirmMsg,.cancelMsg,.okMsg,.cancelError")
            .click(function () {
                if ($(this).hasClass("confirmMsg")) {
                    fuctionAction();
                }
                else if ($(this).hasClass("cancelMsg") || $(this).hasClass("okMsg") || $(this).hasClass("cancelError")) {
                    kendoWindow.data("kendoWindow").close();
                }
            })
        .end();
}
/* show message error*/
/*
    bool: true : delete success, false : false
*/
function MessageBox(msg, bool) {
    $('#modal h4 span').remove();
    if (bool)
        $('#modal h4').append("<span>" + msg + "</span>");
    else
        $('#modal h4').append("<span class=\"red\">" + msg + "</span>");

    $(".BoxShowError").show();
    $(".Msgconfirm").hide();
    return false;
}
//