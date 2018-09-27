using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace DashboardFMP.Controllers
{
    public class EjemploController : ApiController
    {
        [JsonObject]
        [Serializable]
        public class IndicatorCountry
        {
            public int country_id { get; set; }
            public int indicator_id { get; set; }
            public int year_ind_country { get; set; }
        }

        // GET: api/Ejemplo
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Ejemplo/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Ejemplo JObject
        public void Post(List<IndicatorCountry> value)
        {

            var a = "prueba";

        }

        // PUT: api/Ejemplo/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Ejemplo/5
        public void Delete(int id)
        {
        }
    }
}
