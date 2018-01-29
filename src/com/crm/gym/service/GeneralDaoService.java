package com.crm.gym.service;

import java.util.List;


public interface GeneralDaoService {
	
	public void persist(Object entity);
	 
    public void delete(Object entity);
    public void update(Object entity);
    
}
