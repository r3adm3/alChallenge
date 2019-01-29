using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using helloworldWebApp.Models;

namespace helloworldWebApp.Controllers
{
    public class HomeController : Controller
    {
        string name = Environment.MachineName;

        public IActionResult Index()
        {
            ViewData["Message"] = "[" + name + "]";

            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page. [" + name + "]" ;

            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page. [" + name + "]";

            return View();
        }

        public IActionResult Chuck()
        {
            ViewData["Message"] = "The Chuck Norris Page. [" + name + "]";

            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
