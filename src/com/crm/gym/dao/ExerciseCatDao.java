package com.crm.gym.dao;

import java.util.List;

import com.crm.gym.model.ExerciseCat;

public interface ExerciseCatDao{
  
	public ExerciseCat findById(int id);

	public List<ExerciseCat> findAll();




}
