package com.crm.gym.controller;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

@Controller
public class GymControllerGui {
/*
@Autowired
private GymCrmService gymCrmService;*/


	@RequestMapping(value="/loginPage", method=RequestMethod.GET)
	public ModelAndView loginPage(){
		return new ModelAndView("loginPage","","");
	}

	@Secured({"ROLE_ADMIN", "ROLE_TRAINER"})
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public ModelAndView admin(){
		return new ModelAndView("admin","","");
	}
/*	@Secured({"ROLE_ADMIN", "ROLE_TRAINER"})
	@RequestMapping(value="/admincategories", method=RequestMethod.GET)
	public ModelAndView adminCategories(){
		return new ModelAndView("admincategories","","");
	}*/

	@Secured({"ROLE_ADMIN"})
	@RequestMapping(value="/adminexercises", method=RequestMethod.GET)
	public ModelAndView adminExercises(){
		return new ModelAndView("adminexercises","","");
	}

	@Secured({"ROLE_ADMIN", "ROLE_TRAINER"})
	@RequestMapping(value="/adminprograms", method=RequestMethod.GET)
	public ModelAndView adminPrograms(){
		return new ModelAndView("adminprograms","","");
	}
	

	@Secured({"ROLE_ADMIN", "ROLE_TRAINER"})
	@RequestMapping(value="/adminusers", method=RequestMethod.GET)
	public ModelAndView adminUsers(){
		return new ModelAndView("adminusers","","");
	}
}
