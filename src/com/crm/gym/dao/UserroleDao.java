package com.crm.gym.dao;

import java.util.List;

import com.crm.gym.model.Userrole;



public interface UserroleDao{
  
	public Userrole findById(int id);
	

	
	public List<Userrole> findAll();




	

}
