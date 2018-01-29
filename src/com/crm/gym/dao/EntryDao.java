package com.crm.gym.dao;

import java.util.List;

import com.crm.gym.model.Entry;

public interface EntryDao{
  
	public Entry findById(int id);

	public List<Entry> findAll();




}
