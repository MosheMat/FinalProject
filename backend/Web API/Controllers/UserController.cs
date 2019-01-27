using System;
using Logic;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using Entites_Layer;

namespace Web_API.Controllers
{
    [EnableCors("*", "*", "*")]
    [RoutePrefix("api")]
    public class UserController : ApiController

    {

     private Users userLogic = new Users();
        [HttpPost]
        [Route("register")]
        public HttpResponseMessage addUser(UserModel userModel)
        {
            try { 
            
               UserModel backUser =  userLogic.addUser(userModel);

                return Request.CreateResponse(HttpStatusCode.OK,backUser);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
         
        }
        [HttpPost]
        [Route("login")]
        public HttpResponseMessage userLogin(UserModel userModel)
        
{
            try
            {
                UserModel backUser = userLogic.userLogin(userModel);

                return Request.CreateResponse(HttpStatusCode.OK, backUser);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }

        }

    }
}
