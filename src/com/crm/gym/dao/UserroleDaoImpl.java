package com.crm.gym.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.crm.gym.model.Userrole;



@Repository("userroleDao")

//@Cacheable(value = "entities", cacheManager = "springCM")
public class UserroleDaoImpl extends AbstractDao implements UserroleDao{
	
/*    @Autowired
    private SessionFactory sessionFactory;*/
    
	@Override
	public Userrole findById(int id) {
		// TODO Auto-generated method stub
		return (Userrole)getSession().get(Userrole.class, id);
	}
	
	@Override
	public List<Userrole> findAll() {
		   @SuppressWarnings("unchecked")
		   List<Userrole> list = getSession().createQuery("FROM Userrole").list(); 

		return list;
	}


	

}
