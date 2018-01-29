package com.crm.gym.dao;

import java.util.List;

import com.crm.gym.model.ProgramEntry;

public interface ProgramEntryDao{
  
	public ProgramEntry findById(int id);

	public List<ProgramEntry> findAll();




}
