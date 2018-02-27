
var sValue = "";
function Result(data) {
    sValue = data.Value;
}
function Getvalue(phrase)
{
  var ss =   $.ajax({
    type: 'POST',
    url: '/Login/GetValue',
    dataType: "json",
    data: { phrasename: phrase },
    async: false,
    success: function (msg) {
        Result(msg);
        
    },
    error: function () {
       
    }
    });
}
function GetPhraseValue(phrasename)
{
    setTimeout(Getvalue(phrasename), 30000);
    return sValue;
}