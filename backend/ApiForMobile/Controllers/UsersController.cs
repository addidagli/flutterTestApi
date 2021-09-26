using ApiForMobile.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ApiForMobile.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        [HttpPost("Register")]
        public IActionResult RegisterUser(User user)
        {
            using (DatabaseContext context = new DatabaseContext())
            {
                
                    var addedEntity = context.Entry(user);
                    addedEntity.State = EntityState.Added;
                    context.SaveChanges();
                    return Ok(new
                    {
                        StatusCode = 200,
                        Success = true,
                        Message = "User couln't add",
                        Data = user
                    });
                
            }
        }
        [HttpPost("Login")]
        public IActionResult Login(LoginModel model)
        {
            using (DatabaseContext context = new DatabaseContext())
            {
                var user = context.Users.FirstOrDefault(u => u.email == model.email);
                if (user != null)
                {
                    if (user.password.Equals(model.password))
                        return Ok(new
                        {
                            StatusCode = 200,
                            Success = true,
                            Message = "Login Success",
                            Data = user
                        });
                    else
                        return StatusCode(403);
                }
                else
                {
                    return StatusCode(404);
                }
            }
        }
        [HttpGet("GetUserById")]
        public IActionResult GetUserById(int id)
        {
            using (DatabaseContext context = new DatabaseContext())
            {
                //var user = context.Users.Find(id);
                var user = context.Users.FirstOrDefault(u => u.Id == id);
                if (user != null)
                {
                    return Ok(new
                    {
                        StatusCode = 200,
                        Success = true,
                        Message = "Data Found",
                        Data = user
                    });
                }
                else
                {
                    return NotFound();
                }
            }
        }
        [HttpGet("GetUsers")]
        public IActionResult GetUsers()
        {
            using (DatabaseContext context = new DatabaseContext())
            {
                //var user = context.Users.Find(id);
                var user = context.Users.ToList();
                if (user != null)
                {
                    return Ok(new
                    {
                        StatusCode = 200,
                        Success = true,
                        Message = "Data Found",
                        Data = user
                    });
                }
                else
                {
                    return NotFound();
                }
            }
        }
    }
}
