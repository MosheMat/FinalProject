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
    public class GameResultsController : ApiController
    {
        private GameResults gameResultsLogic = new GameResults();
        [HttpGet]
        [Route("gameresults")]
        public HttpResponseMessage getAllGameresults()
        {
            try
            {
                List<GameResultModel> gameResults = gameResultsLogic.GetAllGameResults();
                return Request.CreateResponse(HttpStatusCode.OK, gameResults);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }

        [HttpPost]
        [Route("gameresults")]
        public HttpResponseMessage addGameResults(GameResultModel gameResultModel)
        {
            try
            {
                GameResultModel backGameResult = gameResultsLogic.addGameResult(gameResultModel);

                return Request.CreateResponse(HttpStatusCode.OK, backGameResult);
            }
            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
            }
        }
    }
}
