package com.crm.gym.dao;





import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;
@Repository("generalDao")
//@Cacheable(value = "entities", cacheManager = "springCM")
public class GeneralDaoImpl extends AbstractDao implements GeneralDao{
	

}
