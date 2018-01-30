package com.crm.gym.service;

import java.util.List;

import com.crm.gym.model.Category;
import com.crm.gym.model.Exercise;

public interface GymCrmService {

	List<Category> getAllExerciseCategories();

	Category findCategoryById(int id);
	
	Exercise findExerciseById(int exerciseid);

	List<Exercise> getExercises(Integer categoryid);

	void addExercise(Exercise exercise, Integer categoryid);

	void editExercise(Exercise exercise);



	
}
