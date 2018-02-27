using System;
using System.Net.Mail;
using System.Net;
using System.Threading.Tasks;

/// <summary>
/// Summary description for SendMail
/// </summary>
namespace CRM.Core
{
    public static class SendMail
    {

        public static bool SendMailWithCCAndBcc(string mailfrom, string mailpass, string host, int port, string subj, string message, bool enablessl, string toemail="", string cc="", string bcc="")
        {
            try
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress(mailfrom);
                mailMessage.Subject = subj;
                mailMessage.Body = message;
                mailMessage.IsBodyHtml = true;
                string[] ToMultiEmail = toemail.Split(',');
                foreach (string ToEMailId in ToMultiEmail)
                {
                    mailMessage.To.Add(new MailAddress(ToEMailId));
                }

                string[] CCId = cc.Split(',');
                foreach (string CCEmail in CCId)
                {
                    mailMessage.CC.Add(new MailAddress(CCEmail));
                }
                string[] BCCId = bcc.Split(',');
                foreach (string BCCEmailId in BCCId)
                {
                    mailMessage.Bcc.Add(new MailAddress(BCCEmailId));
                }
                SmtpClient smtp = new SmtpClient();
                smtp.Host = host;
                smtp.EnableSsl = enablessl;
                NetworkCredential NetworkCred = new NetworkCredential();
                NetworkCred.UserName = mailMessage.From.Address;
                NetworkCred.Password = mailpass;
                smtp.Credentials = NetworkCred;
                smtp.Port = port;
                smtp.Send(mailMessage);
                return true;
            }
            catch (Exception)
            {

                return false;
            }

        }

    }
}