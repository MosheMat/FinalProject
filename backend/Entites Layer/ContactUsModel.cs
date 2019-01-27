using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entites_Layer
{
   public class ContactUsModel
    {
        public int id { get; set; }
        public DateTime createDate { get; set; }
        public string phoneNum { get; set; }
        public string email { get; set; }
        public string ticketText { get; set; }
    }
}
