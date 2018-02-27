if (typeof Common == 'undefined')
	Common = {};
Common.Core =
{
	Uers:
		{
			LoginRemember:function()
			{
				$(document).ready(function () {
					var remember = parseInt(Common.Core.Utils.GetCookie("Remember"), 10);
					if (remember === 1) {
						var info = JSON.parse(Common.Core.Utils.GetCookie("Info"));
						$('input[id="Global.Login.txtUserName"]').val(info.US);
						$('input[id="Global.Login.txtPassword"]').val(info.PW);
					}
					else {
					    $('input[id="Global.Login.txtUserName"]').val('');
					    $('input[id="Global.Login.txtPassword"]').val('');
						Common.Core.Utils.SetCookie("Info", "", -1);
						Common.Core.Utils.SetCookie("Remember", "", -1);
					}
				});
			},
			ForgetPassword:function()
			{
				var UserName = $('#txtUserNameFG').val();
				var Email = $('#txtEmailFG').val();
				var Captcha = $('#txtCaptchaForget').val();
				var showcaptcha = Common.Core.Utils.GetCookie("EnableCaptcha");
				var sData = JSON.stringify({ UserName: UserName, Email: Email, Captcha: Captcha });
				
			    if (UserName == '' || Email == '')
			    {
			        $('#errorTotal').html(GetPhraseValue('Global.Contact.lblForget_UserNameAndPassword_required'));
			        $('#errorTotal').show();
			        return;
				}
			    if (!Common.Core.Utils.IsEmail(Email))
			    {
			        $('#errorEmail').html(GetPhraseValue('Global.Login.lblEmailError'));
			        $('#errorTotal').hide();
			        $('#errorEmail').show();
				    return;

			    }
			    else
			    {
			        $('#errorEmail').hide();
			    }
			    
			    if(Captcha == '' && showcaptcha == 1)
			    {
			        
			        $('#errorTotal').html(GetPhraseValue('Global.Login.lblSecurityCode_required'));
			        return;
			    }
				$.ajax({
					type: 'POST',
					url: 'ContactLogin/Email',
					dataType: "json",
					data: { Email: Email, UserName: UserName, Captcha: Captcha },
					async: true,
					success: function (msg) {
					    $('#errorTotal').show();
					    
					    if (msg.Result == -1) {
					        $('#errorTotal').html(GetPhraseValue('Global.Login.lblSecurityCodeError'));
					        $('#errorTotal').show();
					        $('#txtCaptchaForget').val('');
					        return;
					    }
					    if (msg.Result == 0) {
					        

					        $('#errorTotal').html(GetPhraseValue('Global.Login.lblSendEmailError'));
					        $('#errorTotal').show();
					        $('#txtCaptchaForget').val('');
					    }
					    else {
					        $('#errorTotal').html(GetPhraseValue('Global.Login.lblSendEmailSuccessfull'));
					        $('#errorTotal').show();
					        $('#txtUserNameFG').val('');
					        $('#txtEmailFG').val('');
					        $('#txtCaptchaForget').val('');
					        
					    }
					    
					},
				    error:function()
				    {
				        
				        $('#errorTotal').html(GetPhraseValue('Global.Login.lblSendEmailError'));
				        $('#errorTotal').show();
				    }

				});
				
				Common.Core.Uers.FreshCaptchaForget();
			},
			ContactUs: function ()
			{
			    var UserName = $('#txtUserNameContact').val();
			    var Title = $('#txtTileContact').val();
			    var Content = $('#txtContentContact').val();
			    if (UserName == '' || Title == '')
			    {
			        $('#errorContactTotal').html(GetPhraseValue('Global.Login.lblContent_UserNameAndTitle_required'));
			        $('#errorContactTotal').show();
			        return;
			    }
			    if (Content == '') {
			        $('#errorContent').html(GetPhraseValue('Global.Login.lblContent_required'));
			        
			        return;
			    }
			    $.ajax({
			        type: 'POST',
			        url: 'ContactLogin/ContactUs',
			        dataType: "json",
			        data: { UserName: UserName, Title: Title, Content: Content},
			        async: true,
			        success: function (msg) {
			            $('#errorContactTotal').html(GetPhraseValue('Global.Login.lblSendContactSuccessfull'));
			            $('#errorContactTotal').show();
			            $('#txtUserNameContact').val('');
			            $('#txtTileContact').val('');
			            $('#txtContentContact').val('');
			        },
			        error: function () {
			            $('#errorContactTotal').html(GetPhraseValue('Global.Login.lblSendContactError'));
			        }

			    });
			},
			FreshCaptchaLogin:function()
			{
			    $('#CaptchaImageLogin').attr('src','/Login/GenerateCaptcha?rnd=' + Math.random());
			    
			},
			FreshCaptchaForget: function () {
			    $('#CaptchaImageForget').attr('src', '/Login/GenerateCaptcha?rnd=' + Math.random());
			},
			ShowHideCaptcha:function()
			{
			    var showcaptcha = Common.Core.Utils.GetCookie("EnableCaptcha");
			    if (showcaptcha == 0) {
			        $('#wr_capcha').css('display', 'none');
			        $('#wr_capchafoget').css('display', 'none');
			        
			    }
			    else {
			        
			        $('#wr_capcha').css('display', 'block');
			        $('#wr_capchafoget').css('display', 'block');
			   }
			}
		},
	Utils:
		{
			SetCookie: function (cName, value, exdays)
			{
				var exdate = new Date();
				exdate.setDate(exdate.getDate() + exdays);
				var cValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toUTCString()) + ";path=/";
				document.cookie = cName + "=" + cValue;
			},
			GetCookie: function (cName)
			{
				var i, x, y, arrcookies = document.cookie.split(";");
				for (i = 0; i < arrcookies.length; i++) {
					x = arrcookies[i].substr(0, arrcookies[i].indexOf("="));
					y = arrcookies[i].substr(arrcookies[i].indexOf("=") + 1);
					x = x.replace(/^\s+|\s+$/g, "");
					if (x == cName) {
						return unescape(y);
					}
				}
				return undefined;
			},
			IsEmail: function (email)
			{
                    var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                    return regex.test(email);
			},
			CallServer: function (pUrl, pData, pFuncNameSuccess, pType, pAsync, pdataType, pcontenType) {
			    pType = pType;
			    pAsync = pAsync;

			    $.ajax({
			        url: pUrl,
			        async: pAsync,
			        cache: false,
			        type: pType,
			        data: pData,
			        contentType: pcontenType,
			        dataType: pdataType,
			        success: pFuncNameSuccess,
			        error: function (XMLHttpRequest, textStatus, errorThrown) {
			            
			            clearTimeout(timeoutLoadVehicleMK);
			            return;
			        }
			    });
			}
		}
}
Common.Core.Uers.LoginRemember();
$('#Captcha').val('');
$('#btn_SendEmailFG').click(function () { Common.Core.Uers.ForgetPassword(); });
$('#btn_SendContact').click(function () { Common.Core.Uers.ContactUs(); });
$('#FreshCaptchaLogin').click(function () { Common.Core.Uers.FreshCaptchaLogin(); })
$('#FreshCaptchaForget').click(function () { Common.Core.Uers.FreshCaptchaForget(); })
$('#tabLogin').click(function () { Common.Core.Uers.FreshCaptchaLogin(); })
$('#tabForget').click(function () { Common.Core.Uers.FreshCaptchaForget(); })
Common.Core.Uers.ShowHideCaptcha();
