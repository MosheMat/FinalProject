using Entites_Layer;
using Logic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace Web_API.Controllers
{
    [EnableCors("*", "*", "*")]
    [RoutePrefix("api")]
    public class ContactUsController : ApiController
    {
        private ContactUsLogic contactUsLogic = new ContactUsLogic();
        [HttpGet]
        [Route("contact-us")]
        public HttpResponseMessage getAllContactUsTickets()
        {
            try
            {
                List<ContactUsModel> contactUs = contactUsLogic.GetAllContactUsTickets();
                return Request.CreateResponse(HttpStatusCode.OK, contactUs);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpPost]
        [Route("contact-us")]
        public HttpResponseMessage addContactUsTicket(ContactUsModel contactUsModel)
        {
            try
            {
                ContactUsModel backContactUsTicket = contactUsLogic.addContactUsTicket(contactUsModel);

                return Request.CreateResponse(HttpStatusCode.OK, backContactUsTicket);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }
    }
}
