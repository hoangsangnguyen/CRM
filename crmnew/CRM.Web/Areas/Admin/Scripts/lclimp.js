var isSuccess = "0";
$(document).ready(function () {
    var CountryList = [
        "America",
        "Australia",
        "China",
        "India",
        "Pakistan"
    ];

    //$("#searchCountry").kendoAutoComplete({
    //    dataSource: CountryList,
    //    filter: "startswith",
    //    placeholder: "Select Country",
    //    seperator: ","
    //});  
    //$("#searchCountry").kendoComboBox({
    //    "dataSource": CountryList,
    //        "serverFiltering": true,
    //        "filter": [],
    //        "schema": {
    //            "errors": "Errors"
    //        }
    //    },
    //    "dataTextField": "ProductName",
    //    "dataValueField": "ProductID",
    //    "filter": "contains"
    //});​
    $("#searchCountry").kendoComboBox({
        //dataTextField: "CountryName",
        //dataValueField: "CountryName",

        //dataSource {
        //    "transport": {
        //        "read": {
        //            "url": "/Country/GetAllCountries",
        //            "data": function () {
        //                return kendo.ui.ComboBox.requestData("#searchCountry");
        //            }
        //        }
        //    }
        //},
        dataSource: CountryList,
        filter: "contains",
        suggest: true,
        index: 3
    });


    $('.save_big').click(function () {
        if ($.trim($('#JobNo').val()) == "") {
            ConfirmMessageBox(null, 'Please input required fields!', function () {
                $('#JobNo').focus();
            }, false);
            return false;
        }

        $.ajax({
            url: "/Admin/LclImp/AddEditAction",
            type: "POST",
            //data: JSON.stringify($('#usergroupData').serialize()),
            data: $('#frmLcLImp').serialize(),
            //contentType: 'application/json, charset=utf-8',
            dataType: 'json',
            cache: false,
            async: false,
            success: function (data) {
                //$('.msgInfo').text(data.Message);
                //$('#myModal').modal('show');

                isSuccess = data.IsSuccess;
                alert(data.Message);
                if (issuccess == "1") {

                    document.location = "/admin/lclimp";
                }

                //ConfirmMessageBox(null, data.Message, function () {
                //    if (isSuccess == "1") {
                //        document.location = "/Admin/LclImp";
                //       // complete: function () { }
                //    }
                //}, false);
            },
        });
    });

    $('.cancel_big').click(function () {
        document.location = "/Admin/LclImp";
        return false;
    });

    //$('#searchCountry').autocomplete({
    //    source: "LcLImp/GetSearchCountries", minLength: 2
    //});


})


