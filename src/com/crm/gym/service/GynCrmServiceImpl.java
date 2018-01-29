package com.crm.gym.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gym.dao.CategoryDao;
import com.crm.gym.model.Category;

@Service("gymCrmService")
@Transactional
public class GynCrmServiceImpl implements GymCrmService {

	@Autowired 
	CategoryDao categoryDao;
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

}
