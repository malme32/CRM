package com.crm.gym.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.crm.gym.model.Exercise;



@Repository("exerciseDao")

//@Cacheable(value = "entities", cacheManager = "springCM")
public class ExerciseDaoImpl extends AbstractDao implements ExerciseDao{
	
/*    @Autowired
    private SessionFactory sessionFactory;*/
    
	@Override
	public Exercise findById(int id) {
		// TODO Auto-generated method stub
		return (Exercise)getSession().get(Exercise.class, id);
	}
	
	@Override
	public List<Exercise> findAll() {
		   @SuppressWarnings("unchecked")
		   List<Exercise> list = getSession().createQuery("FROM Exercise").list(); 

		return list;
	}


	

}
