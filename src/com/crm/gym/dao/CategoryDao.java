package com.crm.gym.dao;

import java.util.List;

import com.crm.gym.model.Category;

public interface CategoryDao{
  
	public Category findById(int id);

	public List<Category> findAll();




}
