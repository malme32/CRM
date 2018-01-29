package com.crm.gym.dao;

import java.util.List;

import com.crm.gym.model.Exercise;

public interface ExerciseDao{
  
	public Exercise findById(int id);

	public List<Exercise> findAll();




}
