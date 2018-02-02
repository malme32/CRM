package com.crm.gym.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	@RequestMapping(value="/categories/{categoryid}/exercises", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Exercise> getExercises(@PathVariable Integer categoryid)
	{
		return gymCrmService.getExercises(categoryid);
	}

	@RequestMapping(value="/contacts/{contactid}/programs", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Program> getPrograms(@PathVariable Integer contactid)
	{
		return gymCrmService.getPrograms(contactid);
	}
	

	@RequestMapping(value="/contacts", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Contact> getContacts()
	{
		return gymCrmService.getContacts();
	}
	
	@RequestMapping(value="/programs/{programid}/entries", method=RequestMethod.GET, produces = "application/json")
	public @ResponseBody List<Entry> getEntries(@PathVariable Integer programid)
	{
		return gymCrmService.getEntries(programid);
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
	
	
	@RequestMapping(value="/categories/{categoryid}/exercises", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addExercise(@ModelAttribute Exercise exercise,@PathVariable Integer categoryid)
	{
		gymCrmService.addExercise(exercise, categoryid);
		return;
	}
	
	@RequestMapping(value="/contacts/{contactid}/programs", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addProgram(@ModelAttribute Program program,@PathVariable Integer contactid)
	{
		gymCrmService.addProgram(program, contactid);
		return;
	}
	
	@RequestMapping(value="/programs/{programid}/entries", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addEntry(@ModelAttribute Entry entry,@PathVariable Integer programid, @RequestParam Integer exerciseid)
	{
		gymCrmService.addEntry(entry,exerciseid, programid);
		return;
	}

	@RequestMapping(value="/contacts/{contactid}/actions", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void contactAction( @RequestParam String action,@PathVariable Integer contactid,@RequestParam(required=false) Integer programid)
	{
		if(action.equals("create_program"))
			gymCrmService.createProgram(contactid,programid);
		return;
	}
	
	@RequestMapping(value="/contacts", method=RequestMethod.POST, produces = "application/json")
	public @ResponseBody void addContact(@RequestBody Contact contact)
	{
		generalDaoService.persist(contact);
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
	
	@RequestMapping(value="/exercises", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editExercise(@RequestBody Exercise exercise)
	{
		
		gymCrmService.editExercise(exercise);
		return;
	}
	
	@RequestMapping(value="/programs", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editProgram(@RequestBody Program program)
	{
		
		gymCrmService.editProgram(program);
		return;
	}
	
	@RequestMapping(value="/entries", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editEntry(@RequestBody Entry entry)
	{
		
		gymCrmService.editEntry(entry);
		return;
	}
	
	@RequestMapping(value="/contacts", method=RequestMethod.PUT, produces = "application/json")
	public @ResponseBody void editContact(@RequestBody Contact contact)
	{
		
		gymCrmService.editContact(contact);
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
	
	@RequestMapping(value="/exercises/{exerciseid}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteExercise(@PathVariable int exerciseid)
	{
		//System.out.println("DELETINGTITLE: "+gymCrmService.findExerciseById(exerciseid).getTitle());
		generalDaoService.delete(gymCrmService.findExerciseById(exerciseid));
		return;
	}

	@RequestMapping(value="/programs/{programid}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteProgram(@PathVariable int programid)
	{
		//System.out.println("DELETINGTITLE: "+gymCrmService.findExerciseById(exerciseid).getTitle());
		generalDaoService.delete(gymCrmService.findProgramById(programid));
		return;
	}
	@RequestMapping(value="/contacts/{contactid}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteContact(@PathVariable int contactid)
	{
		//System.out.println("DELETINGTITLE: "+gymCrmService.findExerciseById(exerciseid).getTitle());
		generalDaoService.delete(gymCrmService.findContactById(contactid));
		return;
	}
	@RequestMapping(value="/entries/{entryid}", method=RequestMethod.DELETE, produces = "application/json")
	public @ResponseBody void deleteEntry(@PathVariable int entryid)
	{
		//System.out.println("DELETINGTITLE: "+gymCrmService.findExerciseById(exerciseid).getTitle());
		generalDaoService.delete(gymCrmService.findEntryById(entryid));
		return;
	}
}
