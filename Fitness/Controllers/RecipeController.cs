﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Fitness.Models;
using Fitness.Service;
using System.Data.Entity.Infrastructure;

namespace Fitness.Controllers
{
    public class RecipeController : Controller
    {

        public IRecipeService RecipeService { get; set; }

        public RecipeController()
        {
            RecipeService = new RecipeService();
        }

        // GET: /Recipe/5
        // Note: If you request /Recipe (with no ID), it will return an error.
        public ActionResult Index(int? recipeID)
        {
            if (recipeID == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            // If we get to this point, we have a Recipe ID that is an integer
            Recipe foundRecipe = RecipeService.FindRecipeByID(recipeID.GetValueOrDefault()); 

            // We did not find the Recipe by ID.  Return an error
            if (foundRecipe == null)
            {
                return HttpNotFound();
            }
            // We did find the Recipe.  Render it in the View.
            else
            {
                return View(foundRecipe);    
            }            
        }

        // GET: /Recipe/Details/5
//        public ActionResult Details(int? id)
//        {
//            if (id == null)
//            {
//                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
//            }
//            Recipe recipe = db.Recipes.Find(id);
//            if (recipe == null)
//            {
//               return HttpNotFound();
//            }
//            return View(recipe);
//        }

 

        // GET: /Recipe/Create
        public ActionResult Create()
        {
        
            return View();
        }

       
    }
}