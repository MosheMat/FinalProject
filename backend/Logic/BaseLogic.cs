using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logic
{
    public class BaseLogic : IDisposable
    {
        protected MemoryGameEntities DB = new MemoryGameEntities();

        public void Dispose()
        {
            DB.Dispose();
        }
    }
}
