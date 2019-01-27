using DAL;
using Entites_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logic
{
    public class ContactUsLogic:BaseLogic
    {

        public ContactUsModel addContactUsTicket(ContactUsModel contactUsModel)
        {
            Contact_us contactUs = new Contact_us
            {
                create_date = DateTime.Now,
                phone_num = contactUsModel.phoneNum,
                e_mail = contactUsModel.email,
                ticket_text = contactUsModel.ticketText
            };

            DB.Contact_us.Add(contactUs);
            DB.SaveChanges();

            contactUsModel.id = contactUs.ticket_id;
            return contactUsModel;
        }

        public List<ContactUsModel> GetAllContactUsTickets()
        {
            var query = from c in DB.Contact_us
                        select new ContactUsModel
                        {
                            id = c.ticket_id,
                            createDate = c.create_date,
                            phoneNum = c.phone_num,
                            email = c.e_mail,
                            ticketText = c.ticket_text
                        };

            return query.ToList();
        }
    }
}
