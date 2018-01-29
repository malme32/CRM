package com.crm.gym.service;



import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gym.dao.GeneralDao;

@Service("generalDaoService")
@Transactional
//@Cacheable(value = "entities", cacheManager = "springCM")
public class GeneralDaoServiceImpl implements GeneralDaoService{

	@Autowired
	GeneralDao generalDao;
	
	
	@Override
	public void persist(Object entity) {
		generalDao.persist(entity);
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Object entity) {
		// TODO Auto-generated method stub
		generalDao.delete(entity);
	}

	@Override
	public void update(Object entity) {
		// TODO Auto-generated method stub
		generalDao.update(entity);
	}



	
}
