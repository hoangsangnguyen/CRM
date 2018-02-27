using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using Repository.Pattern.UnitOfWork;
using Repository.Pattern.Infrastructure;
using System.Net;
using System.Web;
using CRM.Service;
using Newtonsoft.Json;
using CRM.Entities.Models;
using CRM.Admin.Models;
using CRM.Core;
using CRM.Admin.Filters;
using CRM.Admin.Extensions;
using Microsoft.Practices.Unity;

namespace CRM.Admin.Controllers
{
    [AuthFilter]
    public class RolesController:Controller
    {
        #region Fields
        private readonly IRoleService _roleService;
        private readonly IUnitOfWork _unitOfWork;
        private readonly ILogService _logService;
        private readonly HelperExtensions _helper = new HelperExtensions();
        #endregion

        #region Constructors
        public RolesController(IRoleService roleServ, ILogService logService, [Dependency("CRMNAUnitOfWork")] IUnitOfWork unitOfWork)
        {
            _roleService = roleServ;
            _logService = logService;
            _unitOfWork = unitOfWork;
        }
        #endregion

        #region Ultilities
        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        _unitOfWork.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}
        #endregion

        #region Basic Methods
        /// <summary>
        /// List of usergroup and their access right
        /// </summary>
        /// <returns></returns>
        public ActionResult AccessRight()
        {
            return View();
        }

        /// <summary>
        /// Update role of users
        /// </summary>
        /// <param name="data">List of action that user has edited</param>
        /// <returns>string to alert action is successful or not</returns>
        [HttpPost]
        public string UpdateRole(List<RoleModel> data)
        {
            int number = 0;
            crm_Roles roleItem;
            int result = 0;
            ActionResultModel model = new ActionResultModel();
            try
            {
                if (data == null)
                {
                    model.IsSuccess = 1;
                    model.Message = "Update is successful!";
                    return JsonConvert.SerializeObject(model);
                }
                //Loop all record that user has check to edit role
                foreach (RoleModel role in data)
                {
                    //if user change view role
                    if (role.View.HasValue && role.NumberOfClickView % 2 != 0)
                    {
                        number += role.View.Value ? (int)PermissionsEnum.View : -(int)PermissionsEnum.View;
                    }

                    //if user change view role
                    if (role.Add.HasValue && role.NumberOfClickAdd % 2 != 0)
                    {
                        number += role.Add.Value ? (int)PermissionsEnum.Add : -(int)PermissionsEnum.Add;
                    }

                    //if user change view role
                    if (role.Edit.HasValue && role.NumberOfClickEdit % 2 != 0)
                    {
                        number += role.Edit.Value ? (int)PermissionsEnum.Update : -(int)PermissionsEnum.Update;
                    }

                    //if user change view role
                    if (role.Delete.HasValue && role.NumberOfClickDelete % 2 != 0)
                    {
                        number += role.Delete.Value ? (int)PermissionsEnum.Delete : -(int)PermissionsEnum.Delete;
                    }

                    //Get role to update bitmask
                    roleItem = _roleService.GetRoleByID(role.IDX);

                    if (roleItem != null)
                    {
                        //Update bit mask
                        roleItem.MaskPermission += number;
                        _roleService.Update(roleItem);
                    }

                    number = 0;
                }
                result = _unitOfWork.SaveChanges();
                if (result > 0)
                {
                    //write log
                    _helper.InsertLogActive(_logService, _unitOfWork, "Access right", "Update access right", 2, true);
                    model.IsSuccess = 1;
                    model.Message = "Update is successful!";
                }
                else
                {
                    //write log
                    _helper.InsertLogActive(_logService, _unitOfWork, "Access right", "Update access right", 2, false);
                    model.IsSuccess = 0;
                    model.Message = "Error when updating!";
                }
                return JsonConvert.SerializeObject(model);
            }
            catch
            {
                model.IsSuccess = 0;
                model.Message = "Error when updating!";
                return JsonConvert.SerializeObject(model);
            }

        }

        /// <summary>
        /// View of access deny
        /// </summary>
        /// <returns></returns>
        public ActionResult AccessDeny()
        {
            return View();
        }
        #endregion

        #region Methods
        /// <summary>
        /// Action that render columns and rows of access right grid
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public string RenderGridRole()
        {
            #region Variables
            List<crm_Roles> listRole = new List<crm_Roles>();
            List<ColumnRoleModel> listColModel = new List<ColumnRoleModel>();
            BitMaskOfUser listBitMask = new BitMaskOfUser() { View = new List<bool>(), Add = new List<bool>(), Edit = new List<bool>(), Delete = new List<bool>(), NumberOfBitMask = new List<int>() };
            //Json string to define row data
            string strRowRecord = "\"row\":[";
            //Json string to define column data
            string strColRecord = "\"column\":";
            //Json string to combine 2 json above
            string strJSON = "{";
            string bitmask = "";
            string selected = "";
            //Set temp id
            int userLoginID = 3;
            List<RoleUserModel> LoggedInUserRole;
            int bitMaskUser = 0;
            bool disabledGrid = false;
            bool hideColumn = false;
            UserInfo userInfo;
            #endregion

            try
            {
                userInfo = System.Web.HttpContext.Current.Session["UserInfo"] as UserInfo;
                userLoginID = userInfo.ID;
                //Get max permission of current user 
                int maxPerm=userInfo.BitMask.Max();
                switch(maxPerm)
                {
                    case (int)UserGroupEnum.TenantAdmin: listRole = _roleService.GetAccessRight(true, maxPerm, userInfo.TenanID).ToList(); break;
                    default: listRole = _roleService.GetAccessRight(false, maxPerm, 0).ToList(); break;

                }
                //Check bitmask user to hide or disable edit permision
                LoggedInUserRole = _roleService.GetUserGroupRoles(userLoginID).ToList();
                foreach (RoleUserModel item in LoggedInUserRole)
                {
                    long maskPerm = item.MaskPermission.HasValue ? item.MaskPermission.Value : 0;
                    int temp = GlobalFunctions.GetBitMaskOfUser(maskPerm);
                    if (bitMaskUser < temp)
                        bitMaskUser = temp;

                }

                //Check authorization to view information
                /*if (userInfo.IsTenant && !userInfo.IsSA && !userInfo.IsOperator )
                    hideColumn = true;
                else */
                //if (bitMaskUser == (int)UserGroupEnum.Operator)
                //    disabledGrid = true;

                //if user group has data
                if (listRole.Count > 0)
                {
                    #region Column
                    //first column in data grid
                    ColumnRoleModel firstCol = new ColumnRoleModel() { field = string.Empty, title = "", template = "#= TypePermission #" };
                    listColModel.Add(firstCol);
                    //loop all role record in db to render data into column of grid
                    for (int j = 0; j < listRole.Count; j++)
                    {
                        //Get infor of CRUID perm of user
                        long maskPerm = listRole[j].MaskPermission.HasValue ? listRole[j].MaskPermission.Value : 0;
                        ParseBitMaskToObject(maskPerm, ref listBitMask);
                        //Render columns of grid
                        int bitMaskCurrentUser = GlobalFunctions.GetBitMaskOfUser(listRole[j].MaskPermission.HasValue ? listRole[j].MaskPermission.Value : 0);
                        //bool tempHidden = false;
                        //if ((bitMaskCurrentUser == (int)UserGroupEnum.SA || bitMaskCurrentUser == (int)UserGroupEnum.Operator) && hideColumn)
                        //    tempHidden = true;
                        listColModel.Add(new ColumnRoleModel() { title = listRole[j].RoleName, field = "Selected" + j, template = "<div style='text-align:center'><input type='checkbox' " + (disabledGrid ? "disabled='disabled'" : "") + " class='multi check_row' rowIDX='#=rowIndex#' id='Selected" + j + "' #= JSON.parse(Selected" + j + ") ? checked='checked' : '' # /><span class='lbl'></span><span style='display:none'>#=bitMaskUser" + j + "#</span><span style='display:none'>#=idx" + j + "#</span></div>"/*,hidden=tempHidden*/ });

                    }

                    strColRecord += JsonConvert.SerializeObject(listColModel);
                    #endregion

                    #region Row
                    //loop 4 row equal to view,add,edit,delete record of grid
                    for (int i = 0; i < 4; i++)
                    {
                        strRowRecord += "{";

                        //Render data of first column
                        switch (i)
                        {
                            case 0: strRowRecord += "\"TypePermission\": \"<i class='multi-icon fa icon_menu-square_alt2 bigger-120'></i> View\","; break;
                            case 1: strRowRecord += "\"TypePermission\": \"<i class='multi-icon fa icon_plus_alt bigger-120'></i> Add\","; break;
                            case 2: strRowRecord += "\"TypePermission\": \"<i class='multi-icon fa icon_pencil bigger-120'></i> Edit\","; break;
                            case 3: strRowRecord += "\"TypePermission\": \"<i class='multi-icon fa icon_trash bigger-120'></i> Delete\","; break;
                        }
                        //Render data of all users
                        for (int j = 0; j < listRole.Count; j++)
                        {
                            //--------------data for checkbox--------//
                            switch (i)
                            {
                                case 0: selected = listBitMask.View[j].ToString(); break;
                                case 1: selected = listBitMask.Add[j].ToString(); break;
                                case 2: selected = listBitMask.Edit[j].ToString(); break;
                                case 3: selected = listBitMask.Delete[j].ToString(); break;
                            }
                            strRowRecord += "\"Selected" + j + "\": \"" + selected.ToString().ToLower() + "\",";
                            //--------------data for checkbox--------//
                            //Bit mask to identity user
                            strRowRecord += "\"bitMaskUser" + j + "\": \"" + listBitMask.NumberOfBitMask[j] + "\",";
                            //Id of role
                            strRowRecord += "\"idx" + j + "\": \"" + listRole[j].ID + "\",";
                        }
                        strRowRecord += "\"rowIndex\":\"" + i + "\"";
                        strRowRecord += i == 3 ? "}" : "},";
                    }
                    strRowRecord += "]";
                    #endregion
                    strJSON += strColRecord + "," + strRowRecord;
                    strJSON += disabledGrid ? ",\"Editable\":\"false\"" : ",\"Editable\":\"true\"";

                }
                strJSON += "}";
                return strJSON;

            }
            catch
            {
                return JsonConvert.SerializeObject("");
            }

        }



        /// <summary>
        /// Parse number of bit mask into user information
        /// </summary>
        /// <param name="bitMask">bit mask number</param>
        /// <returns></returns>
        private void ParseBitMaskToObject(long bitMask, ref BitMaskOfUser bitMaskItem)
        {
            //variables
            string binaryString = GlobalFunctions.ParseNumberToBinary(bitMask);

            try
            {
                bitMaskItem.View.Add(binaryString[0] == '0' ? false : true);
                bitMaskItem.Add.Add(binaryString[1] == '0' ? false : true);
                bitMaskItem.Edit.Add(binaryString[2] == '0' ? false : true);
                bitMaskItem.Delete.Add(binaryString[3] == '0' ? false : true);
                //initialize value of bitmask
                for (int i = 4; i < binaryString.Length; i++)
                {
                    if (binaryString[i] == '1')
                        bitMaskItem.NumberOfBitMask.Add(Convert.ToInt32(Math.Pow(2, i)));
                }
            }
            catch
            {
            }

        }

        #endregion
        
    }

}
