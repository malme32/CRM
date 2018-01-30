package com.crm.gym.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gym.dao.CategoryDao;
import com.crm.gym.dao.ExerciseDao;
import com.crm.gym.model.Category;
import com.crm.gym.model.Exercise;

@Service("gymCrmService")
@Transactional
public class GynCrmServiceImpl implements GymCrmService {

	@Autowired 
	CategoryDao categoryDao;
	
	@Autowired 
	ExerciseDao exerciseDao;
	
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

}
