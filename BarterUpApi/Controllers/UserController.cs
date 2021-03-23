using BarterUpApi.Models;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace BarterUpApi.Controllers
{
    public class UserController : ApiController
    {
        private MySqlConnection conn = WebApiConfig.Conn();

        public string Get()
        {
            MySqlCommand query = conn.CreateCommand();
            query.CommandText = "select username from user";

            try
            {
                conn.Open();
            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                return "Cannot open Database Connection: " + ex;
            }

            MySqlDataReader fetch_query = query.ExecuteReader();
            while (fetch_query.Read())
            {
                return fetch_query["username"].ToString();
            }

            return "done";
        }

        public string Post(User _user)
        {
            MySqlCommand query = conn.CreateCommand();
            query.CommandText = "insert into user(username, password) values (" + _user.username + "," + _user.password + ")";

            try
            {
                conn.Open();
                MySqlDataReader fetch_query = query.ExecuteReader();
                while (fetch_query.Read())
                {
                    return fetch_query.ToString();
                }
                return "Query Inserted!";
            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                return "Query Insertions Failed! " + ex;
            }


        }
    }
}
