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
    public class FeedbackController : ApiController
    {
        private Feedbacks feedbackLogic = new Feedbacks();
        [HttpGet]
        [Route("feedbacks")]
        public HttpResponseMessage getAllFeedbacks()
        {
            try
            {
                List<FeedbackModel> feedbacks = feedbackLogic.GetAllFeedbacks();
                return Request.CreateResponse(HttpStatusCode.OK, feedbacks);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpPost]
        [Route("feedbacks")]
        public HttpResponseMessage addFeedback(FeedbackModel feedbackModel)
        {
            try
            {
                FeedbackModel backFeedback = feedbackLogic.addFeedback(feedbackModel);

                return Request.CreateResponse(HttpStatusCode.OK, backFeedback);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }
    }
}
