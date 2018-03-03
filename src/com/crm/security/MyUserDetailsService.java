package com.crm.security;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Hibernate;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.crm.gym.model.Contact;
import com.crm.gym.model.Userrole;
import com.crm.gym.service.GymCrmService;




@Service("userDetailsService")
public class MyUserDetailsService implements UserDetailsService  {
	
	
	//static ApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
	//private ContactService contactService = (ContactService)ctx.getBean("contactService");
	@Autowired
	private GymCrmService gymCrmService ;
	  //private BeanFactory beanFactory;
	//get user from the database, via Hibernate
	//@Autowired
	//private ContactService contactService;//(ContactService)beanFactory.getBean("contactService");;

//	public ContactService getContactService() {
//		return contactService;
//	}
//	//@Autowired
//	public void setContactService(ContactService contactService) {
//		this.contactService = contactService;
//	}

	@Transactional(readOnly=true)
	@Override
	public UserDetails loadUserByUsername(final String username)
		throws UsernameNotFoundException {
				
		Contact contact = gymCrmService.findByUserName(username);
		//Contact contact = new Contact();
		Hibernate.initialize(contact.getUserroles());
		List<GrantedAuthority> authorities =
                                      buildUserAuthority(contact.getRole());

		return buildUserForAuthentication(contact, authorities);

	}

	// Converts com.mkyong.users.model.User user to
	// org.springframework.security.core.userdetails.User
	private User buildUserForAuthentication(Contact contact,
		List<GrantedAuthority> authorities) {
		return new User(contact.getUsername(), contact.getPassword(),
			true, true, true, true, authorities);
	}

	private List<GrantedAuthority> buildUserAuthority(String role) {

		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();
		//setAuths.add(new SimpleGrantedAuthority(userRoles.getRole()));
		// Build user's authorities
		
	/*	for (Userrole userRole : userRoles) {
			setAuths.add(new SimpleGrantedAuthority(userRole.getRole()));
		}*/

		setAuths.add(new SimpleGrantedAuthority(role));
		List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);

		return Result;
	}



}