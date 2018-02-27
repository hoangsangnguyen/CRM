using System;

namespace CRM.Core
{
    public enum PermissionsEnum
    {
        View = 1,
        Add = 2,
        Update = 4,
        Delete = 8,
        
    }

    public enum UserGroupEnum
    {
        NormalUser = 16,
        Sales = 32,
        Marketing=64,
        Support = 128,
        Manager = 256,
        TenantAdmin = 512,
        Operator = 1024,
        SA = 2048
    }
}