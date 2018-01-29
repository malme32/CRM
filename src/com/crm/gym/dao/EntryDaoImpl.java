package com.crm.gym.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.crm.gym.model.Entry;



@Repository("entryDao")

//@Cacheable(value = "entities", cacheManager = "springCM")
public class EntryDaoImpl extends AbstractDao implements EntryDao{
	
/*    @Autowired
    private SessionFactory sessionFactory;*/
    
	@Override
	public Entry findById(int id) {
		// TODO Auto-generated method stub
		return (Entry)getSession().get(Entry.class, id);
	}
	
	@Override
	public List<Entry> findAll() {
		   @SuppressWarnings("unchecked")
		   List<Entry> list = getSession().createQuery("FROM Entry").list(); 

		return list;
	}


	

}
