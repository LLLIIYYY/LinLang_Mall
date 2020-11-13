using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common.Utils;
using DAL;
using Model.Entity;

namespace BLL
{
    public class EmployeeService
    {
        public bool Create(EmployeeEntity employee)
        {
            employee.LoginPWD = MD5Generator.GenerateMD5(employee.LoginPWD);

            EmployeeDataHelper helper = new EmployeeDataHelper();
            bool success = helper.Create(employee);

            return success;
        }
        public List<EmployeeEntity> GetAll()
        {
            return new EmployeeDataHelper().getAll();
        }

        public Dictionary<String, Object> GetAllByPage(int pageIndex, int pageSIze, string Name, int Gender)
        {
            return new EmployeeDataHelper().GetAllByPage(pageIndex, pageSIze, Name, Gender);
        }

        public bool Update(EmployeeEntity employee)
        {
            return new EmployeeDataHelper().Update(employee);
        }
        public bool Delete(int id)
        {
            return new EmployeeDataHelper().Delete(id);
        }
    }
}
