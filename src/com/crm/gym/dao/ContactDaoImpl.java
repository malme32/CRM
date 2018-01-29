package com.crm.gym.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.crm.gym.model.Contact;



@Repository("contactDao")

//@Cacheable(value = "entities", cacheManager = "springCM")
public class ContactDaoImpl extends AbstractDao implements ContactDao{
	
/*    @Autowired
    private SessionFactory sessionFactory;*/
    
	@Override
	public Contact findById(int id) {
		// TODO Auto-generated method stub
		return (Contact)getSession().get(Contact.class, id);
	}
	
	@Override
	public List<Contact> findAll() {
		   @SuppressWarnings("unchecked")
		   List<Contact> list = getSession().createQuery("FROM Contact").list(); 

		return list;
	}


	

}
