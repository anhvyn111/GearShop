using DataProvider.Framework;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataProvider.DAO
{
    public class MenuDAO
    {
        GearShopDbContext context = null;
        public MenuDAO()
        {
            context = new GearShopDbContext();
        }
        public List<Menu> LoadMenu()
        {
            return context.Menus.OrderBy(x=>x.MenuID).ToList();
        }

        public List<Tag> LoadTag(int? id)
        {
            return context.Tags.Where(p=>p.CategoryID == id).OrderBy(x => x.TagID).ToList();
        }
        public List<Menu> ListAll()
        {
            return context.Menus.OrderBy(x=>x.MenuID).ToList();
        }

        public Menu GetByMetaTitle(string metaTitle)
        {
            return context.Menus.Where(x => x.MetaTitle == metaTitle).FirstOrDefault(); 
        }
    }
}
