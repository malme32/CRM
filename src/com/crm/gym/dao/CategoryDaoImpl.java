package com.crm.gym.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.crm.gym.model.Category;



@Repository("categoryDao")

//@Cacheable(value = "entities", cacheManager = "springCM")
public class CategoryDaoImpl extends AbstractDao implements CategoryDao{
	
/*    @Autowired
    private SessionFactory sessionFactory;*/
    
	@Override
	public Category findById(int id) {
		// TODO Auto-generated method stub
		return (Category)getSession().get(Category.class, id);
	}
	
	@Override
	public List<Category> findAll() {
		   @SuppressWarnings("unchecked")
		   List<Category> list = getSession().createQuery("FROM Category C order by C.title").list(); 

		return list;
	}


	

}
