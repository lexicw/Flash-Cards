using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Flash_Cards
{
    public abstract class DataProvider
    {
        List<string> allUsers = new List<string>();
        List<string> allCardSets = new List<string>();
        List<string> allCards = new List<string>();

        public DataProvider()
        {



        }

        //public class User(int userId, String userName, String password)
        //{
        //    this.userId = userId;
        //    this.userName = userName;
        //    this.password = password;
        //}
    }



}
