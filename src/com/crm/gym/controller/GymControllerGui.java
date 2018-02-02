package com.crm.gym.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

@Controller
public class GymControllerGui {
/*
@Autowired
private GymCrmService gymCrmService;*/

	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public ModelAndView admin(){
		return new ModelAndView("admin","","");
	}
	@RequestMapping(value="/admincategories", method=RequestMethod.GET)
	public ModelAndView adminCategories(){
		return new ModelAndView("admincategories","","");
	}
	
	@RequestMapping(value="/adminexercises", method=RequestMethod.GET)
	public ModelAndView adminExercises(){
		return new ModelAndView("adminexercises","","");
	}

	@RequestMapping(value="/adminprograms", method=RequestMethod.GET)
	public ModelAndView adminPrograms(){
		return new ModelAndView("adminprograms","","");
	}
	

	@RequestMapping(value="/adminusers", method=RequestMethod.GET)
	public ModelAndView adminUsers(){
		return new ModelAndView("adminusers","","");
	}
}
