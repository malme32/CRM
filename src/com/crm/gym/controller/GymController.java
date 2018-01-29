package com.crm.gym.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.gym.model.Category;
import com.crm.gym.service.GeneralDaoService;
import com.crm.gym.service.GymCrmService;

@Controller
public class GymController {

@Autowired private GymCrmService gymCrmService;

@Autowired private GeneralDaoService generalDaoService;

/////////////////////////////////////////////////////////////////
/////////////////////////GET/////////////////////////////////
/////////////////////////////////////////////////////////////

	@RequestMapping(value="/categories", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Category> getCategories()
	{
		return gymCrmService.getAllExerciseCategories();
	}
	
/////////////////////////////////////////////////////////////////
/////////////////////////POST/////////////////////////////////
/////////////////////////////////////////////////////////////
	
	@RequestMapping(value="/categories", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addCategory(@ModelAttribute Category category)
	{
		generalDaoService.persist(category);
		return;
	}
	
	
/////////////////////////////////////////////////////////////////
/////////////////////////PUT/////////////////////////////////
/////////////////////////////////////////////////////////////
	
	
	@RequestMapping(value="/categories", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editCategory(@RequestBody Category category)
	{
		generalDaoService.update(category);
		return;
	}
	
/////////////////////////////////////////////////////////////////
/////////////////////////DELETE/////////////////////////////////
/////////////////////////////////////////////////////////////
	
	@RequestMapping(value="/categories/{id}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteCategory(@PathVariable int id)
	{
		generalDaoService.delete(gymCrmService.findCategoryById(id));
		return;
	}
	
	
}
