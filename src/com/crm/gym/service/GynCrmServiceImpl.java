package com.crm.gym.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gym.dao.CategoryDao;
import com.crm.gym.dao.ContactDao;
import com.crm.gym.dao.EntryDao;
import com.crm.gym.dao.ExerciseDao;
import com.crm.gym.dao.ProgramDao;
import com.crm.gym.model.Category;
import com.crm.gym.model.Contact;
import com.crm.gym.model.Entry;
import com.crm.gym.model.Exercise;
import com.crm.gym.model.Program;

@Service("gymCrmService")
@Transactional
public class GynCrmServiceImpl implements GymCrmService {

	@Autowired 
	CategoryDao categoryDao;
	
	@Autowired 
	ExerciseDao exerciseDao;

	@Autowired 
	ProgramDao programDao;

	@Autowired 
	ContactDao contactDao;

	@Autowired 
	EntryDao entryDao;
	
	@Autowired private GeneralDaoService generalDaoService;
	
	@Override
	public List<Category> getAllExerciseCategories() {
		// TODO Auto-generated method stub
		return categoryDao.findAll();
	}
	@Override
	public Category findCategoryById(int id) {
		// TODO Auto-generated method stub
		return categoryDao.findById(id);
	}
	@Override
	public Exercise findExerciseById(int exerciseid) {
		
		return exerciseDao.findById(exerciseid);
	}
	@Override
	public List<Exercise> getExercises(Integer categoryid) {
		// TODO Auto-generated method stub
		Category category = categoryDao.findById(categoryid);
		Hibernate.initialize(category.getExercises());
		return category.getExercises();
	}
	@Override
	public void addExercise(Exercise exercise, Integer categoryid) {
		// TODO Auto-generated method stub
		exercise.setCategory(categoryDao.findById(categoryid));
		generalDaoService.persist(exercise);
		return;
	}
	@Override
	public void editExercise(Exercise exercise) {
		Exercise exercise1 = this.findExerciseById(exercise.getId());
		exercise1.setTitle(exercise.getTitle());
		generalDaoService.update(exercise1);
		
	}
	@Override
	public List<Program> getPrograms(Integer contactid) {
		// TODO Auto-generated method stub
		Contact contact = contactDao.findById(contactid);
		Hibernate.initialize(contact.getPrograms());
		return contact.getPrograms();
	}
	@Override
	public List<Contact> getContacts() {
		// TODO Auto-generated method stub
		return contactDao.findAll();
	}
	@Override
	public List<Entry> getEntries(Integer programid) {
		// TODO Auto-generated method stub
		Program program = programDao.findById(programid);

		Hibernate.initialize(program.getEntries());/*
		for(Entry entry:program.getEntries())
			Hibernate.initialize(entry.getExercise());*/
		return program.getEntries();
	}
	@Override
	public void addProgram(Program program, Integer contactid) {
		// TODO Auto-generated method stub

		Contact contact = contactDao.findById(contactid);
		program.setContact(contact);
		generalDaoService.persist(program);
	}
	@Override
	public void addEntry(Entry entry, Integer exerciseid, Integer programid) {
		// TODO Auto-generated method stub

		Program program = programDao.findById(programid);
		Exercise exercise = exerciseDao.findById(exerciseid);
		entry.setExercise(exercise);
		entry.setProgram(program);
		generalDaoService.persist(entry);
		
	}
	@Override
	public Program findProgramById(int programid) {
		// TODO Auto-generated method stub
		return programDao.findById(programid);
	}
	@Override
	public Contact findContactById(int contactid) {
		// TODO Auto-generated method stub
		
		return contactDao.findById(contactid);
	}
	@Override
	public Entry findEntryById(int entryid) {
		// TODO Auto-generated method stub
		return entryDao.findById(entryid);
	
	}
	@Override
	public void editProgram(Program program) {
		// TODO Auto-generated method stub

		Program program1 = programDao.findById(program.getId());
		program1.setComment(program.getComment());
		program1.setDatestart(program.getDatestart());
		program1.setDateend(program.getDateend());
		program1.setTitle(program.getTitle());
		generalDaoService.update(program1);
	}

}
