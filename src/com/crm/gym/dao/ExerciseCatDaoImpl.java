package com.crm.gym.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.crm.gym.model.ExerciseCat;



@Repository("exerciseCatDao")

//@Cacheable(value = "entities", cacheManager = "springCM")
public class ExerciseCatDaoImpl extends AbstractDao implements ExerciseCatDao{
	
/*    @Autowired
    private SessionFactory sessionFactory;*/
    
	@Override
	public ExerciseCat findById(int id) {
		// TODO Auto-generated method stub
		return (ExerciseCat)getSession().get(ExerciseCat.class, id);
	}
	
	@Override
	public List<ExerciseCat> findAll() {
		   @SuppressWarnings("unchecked")
		   List<ExerciseCat> list = getSession().createQuery("FROM ExerciseCat").list(); 

		return list;
	}


	

}
