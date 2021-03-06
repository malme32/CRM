package com.crm.gym.service;

import java.util.List;

import com.crm.gym.model.Category;
import com.crm.gym.model.Contact;
import com.crm.gym.model.Entry;
import com.crm.gym.model.Exercise;
import com.crm.gym.model.Program;
import com.crm.gym.model.Userrole;

public interface GymCrmService {

	List<Category> getAllExerciseCategories();

	Category findCategoryById(int id);
	
	Exercise findExerciseById(int exerciseid);

	List<Exercise> getExercises(Integer categoryid);

	void addExercise(Exercise exercise, Integer categoryid);

	void editExercise(Exercise exercise);

	List<Program> getPrograms(Integer contactid);

	List<Contact> getContacts();

	List<Entry> getEntries(Integer programid);

	void addProgram(Program program, Integer contactid);

	void addEntry(Entry entry, Integer exerciseid, Integer programid);

	Program findProgramById(int programid);

	Contact findContactById(int contactid);

	Entry findEntryById(int entryid);

	void editProgram(Program program);

	void editEntry(Entry entry);

	String createProgram(Integer contactid, Integer programid, String realPath, boolean sendMail);

	void editContact(Contact contact);

	void copyProgram(Integer contactid,Integer programid);

	Contact findByUserName(String username);

	List<Program> getAllPrograms();

	List<Program> getAllExpiringPrograms();

	List<Userrole> getRoles(Integer contactid);

	
}
