using DAL;
using Entites_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logic
{
    public class GameResults : BaseLogic
    {

        public GameResultModel addGameResult(GameResultModel gameResultModel)
        {
            GameResult gameResult = new GameResult
            {
                user_id = gameResultModel.userId,
                game_time = gameResultModel.gameTime,
                game_duration = gameResultModel.gameDuration,
                moves_num = gameResultModel.movesNum
            };

            DB.GameResults.Add(gameResult);
            DB.SaveChanges();

            gameResultModel.id = gameResult.game_id;
            return gameResultModel;
        }

        public List<GameResultModel> GetAllGameResults()
        {
            var query = from result in DB.GameResults
                        join user in DB.Users on result.user_id equals user.user_id
                        select new GameResultModel
                        {
                            id = result.game_id,
                            userId = result.user_id,
                            userName = user.user_name,
                            fullName = user.full_name,
                            gameTime = result.game_time,
                            gameDuration = result.game_duration,
                            movesNum = result.moves_num
                        };
            return query.ToList();
        }
    }
}
