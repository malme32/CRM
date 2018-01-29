package com.crm.gym.service;

import java.util.List;

import com.crm.gym.model.Category;

public interface GymCrmService {

	List<Category> getAllExerciseCategories();

	Category findCategoryById(int id);


	
}
