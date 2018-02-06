package com.crm.gym.dao;

import java.util.List;

import com.crm.gym.model.Contact;

public interface ContactDao{
  
	public Contact findById(int id);

	public List<Contact> findAll();

	public Contact findByUsername(String username);




}
