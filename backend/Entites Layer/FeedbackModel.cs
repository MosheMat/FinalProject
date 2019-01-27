using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entites_Layer
{
    public class FeedbackModel
    {
        public int id { get; set; }
        public int userId { get; set; }
        public string userName { get; set; }
        public DateTime createTime { get; set; }
        public string feedbackText { get; set; }
    }
}
