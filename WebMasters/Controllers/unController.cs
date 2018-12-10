using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebMasters.Controllers
{
    public class unController : ApiController
    {
        // GET: api/un
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/un/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/un
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/un/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/un/5
        public void Delete(int id)
        {
        }
    }
}
