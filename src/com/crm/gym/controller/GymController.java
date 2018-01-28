package com.crm.gym.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class GymController {

	@RequestMapping(value="/testing", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody String getChampionList()
	{
		return "XAXA";
	}
	
}
