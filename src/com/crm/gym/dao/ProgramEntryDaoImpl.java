package com.crm.gym.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.crm.gym.model.ProgramEntry;



@Repository("programEntryDao")

//@Cacheable(value = "entities", cacheManager = "springCM")
public class ProgramEntryDaoImpl extends AbstractDao implements ProgramEntryDao{
	
/*    @Autowired
    private SessionFactory sessionFactory;*/
    
	@Override
	public ProgramEntry findById(int id) {
		// TODO Auto-generated method stub
		return (ProgramEntry)getSession().get(ProgramEntry.class, id);
	}
	
	@Override
	public List<ProgramEntry> findAll() {
		   @SuppressWarnings("unchecked")
		   List<ProgramEntry> list = getSession().createQuery("FROM ProgramEntry").list(); 

		return list;
	}


	

}
