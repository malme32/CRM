package com.crm.gym.dao;

import java.util.List;

import com.crm.gym.model.Program;

public interface ProgramDao{
  
	public Program findById(int id);

	public List<Program> findAll();

	public List<Program> getAllExpiringPrograms();




}
