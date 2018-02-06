package com.crm.security;



import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;


@Configuration
@ComponentScan(basePackages={"com.event","com.phonebook"})
@EnableGlobalMethodSecurity(securedEnabled = true)
@EnableWebSecurity
public class LoginSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	@Qualifier("userDetailsService")
	UserDetailsService userDetailsService;
	
	@Autowired 
	DataSource dataSource;
//	@Autowired
//	public void configureGlobal(AuthenticationManagerBuilder authenticationMgr) throws Exception {
//		authenticationMgr.inMemoryAuthentication()
//			.withUser("journaldev")
//			.password("jd@123")
//			.authorities("ROLE_USER");
//	}
//	
	
	
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}

	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.antMatchers("/admin").access("hasRole('ROLE_ADMIN')")
		 .antMatchers("/resources/**")
         .permitAll().
		 antMatchers("/files/**")
         .permitAll().
         	and().formLogin().loginPage("/loginPage")
		.defaultSuccessUrl("/admin")
		.failureUrl("/loginPage?error")
		.usernameParameter("username").passwordParameter("password")				
	.and()
		.logout().logoutSuccessUrl("/loginPage");
/*		.antMatchers("/main").access("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
*/		/*	.antMatchers("/contact").access("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
			.antMatchers("/event").access("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
			.antMatchers("/eventlist").access("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
			.antMatchers("/phonebook").access("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
		 .antMatchers("/contacts/*").access("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
			.antMatchers("/contacts").access("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
			.antMatchers("/contacts/salaries").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/positions/**").access("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
			.antMatchers("/events/**").access("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
//			.antMatchers("/contacts/*").access("hasRole('ROLE_USER')")
		
			//rossoneri
			.antMatchers("/admin**").access("hasRole('ROLE_ADMIN')")
			.antMatchers("/editteam**").access("hasRole('ROLE_TEAM')")*/
			
			
/*			
			.antMatchers("/resources/**", "/signup", "/about").permitAll()                  
			.antMatchers("/admin/**").hasRole("ADMIN")                                      
			.antMatchers("/db/**").access("hasRole('ADMIN') and hasRole('DBA')")      */   
		/* .antMatchers("/resources/**")
         .permitAll()
			
				.and().rememberMe().rememberMeParameter("remember-me").tokenRepository(persistentTokenRepository()).tokenValiditySeconds(1155222111);*/
		
		http.csrf().disable(); /// this should normally be removed  to allow post to have csrf tokens
		
	}
	
	
	@Bean PersistentTokenRepository persistentTokenRepository()
	{
		final JdbcTokenRepositoryImpl jdbcTokenRepository = new JdbcTokenRepositoryImpl();
		jdbcTokenRepository.setDataSource(dataSource);
		return jdbcTokenRepository;
	}
	@Bean
	public PasswordEncoder passwordEncoder(){
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}
	
}