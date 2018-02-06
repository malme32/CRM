package com.crm.gym.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.gym.model.Category;
import com.crm.gym.model.Contact;
import com.crm.gym.model.Entry;
import com.crm.gym.model.Exercise;
import com.crm.gym.model.Program;
import com.crm.gym.service.GeneralDaoService;
import com.crm.gym.service.GymCrmService;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Controller
public class GymController {

@Autowired private GymCrmService gymCrmService;

@Autowired private GeneralDaoService generalDaoService;

/////////////////////////////////////////////////////////////////
/////////////////////////GET/////////////////////////////////
/////////////////////////////////////////////////////////////

	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/categories", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Category> getCategories()
	{
		return gymCrmService.getAllExerciseCategories();
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/categories/{categoryid}/exercises", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Exercise> getExercises(@PathVariable Integer categoryid)
	{
		return gymCrmService.getExercises(categoryid);
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/contacts/{contactid}/programs", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Program> getPrograms(@PathVariable Integer contactid)
	{
		return gymCrmService.getPrograms(contactid);
	}
	

	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/contacts", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Contact> getContacts()
	{
		return gymCrmService.getContacts();
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/programs/{programid}/entries", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Entry> getEntries(@PathVariable Integer programid)
	{
		return gymCrmService.getEntries(programid);
	}
	
/////////////////////////////////////////////////////////////////
/////////////////////////POST/////////////////////////////////
/////////////////////////////////////////////////////////////

	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/categories", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addCategory(@ModelAttribute Category category)
	{
		generalDaoService.persist(category);
		return;
	}
	

	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/categories/{categoryid}/exercises", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addExercise(@ModelAttribute Exercise exercise,@PathVariable Integer categoryid)
	{
		gymCrmService.addExercise(exercise, categoryid);
		return;
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/contacts/{contactid}/programs", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addProgram(@ModelAttribute Program program,@PathVariable Integer contactid)
	{
		gymCrmService.addProgram(program, contactid);
		return;
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/programs/{programid}/entries", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addEntry(@ModelAttribute Entry entry,@PathVariable Integer programid, @RequestParam Integer exerciseid)
	{
		gymCrmService.addEntry(entry,exerciseid, programid);
		return;
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/contacts/{contactid}/actions", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void contactAction(HttpSession session, @RequestParam String action,@PathVariable Integer contactid,@RequestParam(required=false) Integer programid)
	{
		String ret = "";
		 String realPath=session.getServletContext().getRealPath("/");  
		if(action.equals("create_program"))
			ret = gymCrmService.createProgram(contactid,programid,realPath,false);
		if(action.equals("copy_program"))
			gymCrmService.copyProgram(contactid,programid);
		if(action.equals("send_program_email"))
			ret = gymCrmService.createProgram(contactid,programid,realPath,true);
		System.out.println("PDF LINK: "+ ret);
		return ;
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/contacts", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addContact(@RequestBody Contact contact)
	{
		generalDaoService.persist(contact);
		return;
	}
	
/////////////////////////////////////////////////////////////////
/////////////////////////PUT/////////////////////////////////
/////////////////////////////////////////////////////////////
	

	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/categories", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editCategory(@RequestBody Category category)
	{
		generalDaoService.update(category);
		return;
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/exercises", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editExercise(@RequestBody Exercise exercise)
	{
		
		gymCrmService.editExercise(exercise);
		return;
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/programs", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editProgram(@RequestBody Program program)
	{
		
		gymCrmService.editProgram(program);
		return;
	}


	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/entries", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editEntry(@ModelAttribute Entry entry)
	{
		
		gymCrmService.editEntry(entry);
		return;
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/contacts", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editContact(@RequestBody Contact contact)
	{
		
		gymCrmService.editContact(contact);
		return;
	}
	
	
/////////////////////////////////////////////////////////////////
/////////////////////////DELETE/////////////////////////////////
/////////////////////////////////////////////////////////////

	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/categories/{id}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteCategory(@PathVariable int id)
	{
		generalDaoService.delete(gymCrmService.findCategoryById(id));
		return;
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/exercises/{exerciseid}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteExercise(@PathVariable int exerciseid)
	{
		//System.out.println("DELETINGTITLE: "+gymCrmService.findExerciseById(exerciseid).getTitle());
		generalDaoService.delete(gymCrmService.findExerciseById(exerciseid));
		return;
	}

	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/programs/{programid}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteProgram(@PathVariable int programid)
	{
		//System.out.println("DELETINGTITLE: "+gymCrmService.findExerciseById(exerciseid).getTitle());
		generalDaoService.delete(gymCrmService.findProgramById(programid));
		return;
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/contacts/{contactid}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteContact(@PathVariable int contactid)
	{
		//System.out.println("DELETINGTITLE: "+gymCrmService.findExerciseById(exerciseid).getTitle());
		generalDaoService.delete(gymCrmService.findContactById(contactid));
		return;
	}
	
	@Secured("ROLE_ADMIN")
	@RequestMapping(value="/entries/{entryid}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteEntry(@PathVariable int entryid)
	{
		//System.out.println("DELETINGTITLE: "+gymCrmService.findExerciseById(exerciseid).getTitle());
		generalDaoService.delete(gymCrmService.findEntryById(entryid));
		return;
	}
}
