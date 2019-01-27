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
    public class ImageController : ApiController
    {
        private Images imagesLogic = new Images();
        [HttpGet]
        [Route("images")]
        public HttpResponseMessage getAllImages()
        {
            try
            {
                List<ImageModel> images = imagesLogic.GetAllImages();
                return Request.CreateResponse(HttpStatusCode.OK, images);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }
    }
}
