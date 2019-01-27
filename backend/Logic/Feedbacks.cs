using DAL;
using Entites_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logic
{
    public class Feedbacks : BaseLogic
    {

        public FeedbackModel addFeedback(FeedbackModel feedbackModel)
        {
            Feedback feedback = new Feedback
            {
                user_id = feedbackModel.userId,
                create_time = DateTime.Now,
                feedback_text = feedbackModel.feedbackText
            };

            DB.Feedbacks.Add(feedback);
            DB.SaveChanges();

            feedbackModel.id = feedback.feedback_id;
            return feedbackModel;
        }

        public List<FeedbackModel> GetAllFeedbacks()
        {
            var query = from feedback in DB.Feedbacks
                        join user in DB.Users on feedback.user_id equals user.user_id
                        select new FeedbackModel
                        {
                            id = feedback.feedback_id,
                            userId = feedback.user_id,
                            userName = user.user_name,
                            createTime = feedback.create_time,
                            feedbackText = feedback.feedback_text
                        };

            return query.ToList();
        }
    }
}
