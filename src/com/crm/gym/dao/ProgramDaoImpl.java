package com.crm.gym.dao;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.crm.gym.model.Program;



@Repository("programDao")

//@Cacheable(value = "entities", cacheManager = "springCM")
public class ProgramDaoImpl extends AbstractDao implements ProgramDao{
	
/*    @Autowired
    private SessionFactory sessionFactory;*/
    
	@Override
	public Program findById(int id) {
		// TODO Auto-generated method stub
		return (Program)getSession().get(Program.class, id);
	}
	
	@Override
	public List<Program> findAll() {
		   @SuppressWarnings("unchecked")
		   List<Program> list = getSession().createQuery("FROM Program P order by P.title").list(); 

		return list;
	}

	@Override
	public List<Program> getAllExpiringPrograms() {
		
		
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 20);
		
		System.out.println("ExpDate = "+ cal.getTime());
				
		Date expdate = cal.getTime();
		   @SuppressWarnings("unchecked")
		   List<Program> list = getSession().createQuery("FROM Program P where P.dateend<:expdate order by P.title").setParameter("expdate", expdate).list(); 
		 return list;
	}


	

}
