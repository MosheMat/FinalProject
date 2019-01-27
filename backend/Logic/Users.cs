using DAL;
using Entites_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logic
{
    public class Users : BaseLogic
    {
        public UserModel addUser(UserModel userModel)
        {
            User user = new User
            {
                full_name = userModel.fullName,
                user_name = userModel.userName,
                password = userModel.password,
                email = userModel.email,
                birth_date = userModel.birthDate
            };
            User existUser = this.getOneUser(userModel);
            if (existUser == null)
            {

                DB.Users.Add(user);
                DB.SaveChanges();

                userModel.id = user.user_id;
                return userModel;
            }
            return null;
        }
        public UserModel userLogin(UserModel userModel)
        {
            User user = getOneUser(userModel);
            if (user != null && user.password == userModel.password)
            {
                userModel.userName = user.user_name;
                userModel.password = user.password;
                userModel.id = user.user_id;
                userModel.email = user.email;
                userModel.birthDate = user.birth_date;
                userModel.fullName = user.full_name;
                return userModel;

            }
            return null;
        }

        public User getOneUser(UserModel userModel)
        {

            var query = from u in DB.Users
                        where u.user_name == userModel.userName
                        select u;

            User user = query.SingleOrDefault();
            return user;

        }
    }
}

