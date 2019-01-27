using Entites_Layer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logic
{
   public class Images:BaseLogic
    {
        public List<ImageModel> GetAllImages()
        {
            var query = from i in DB.Images
                        select new ImageModel
                        {
                            imgId = i.img_id,
                            filePath = i.file_path,
                        };

            return query.ToList();
        }
    }
}
