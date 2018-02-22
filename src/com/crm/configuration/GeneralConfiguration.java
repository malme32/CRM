package com.crm.configuration;


import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.transaction.annotation.EnableTransactionManagement;
/*@PropertySource(value = { "classpath:application.properties" })*/

@Configuration
@EnableTransactionManagement
@ComponentScan({ "com.crm"})
@ImportResource({"classpath*:spring.xml"})
//@EnableCaching
public class GeneralConfiguration {

/*	@Bean 
	public JavaMailSender mailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl(); 

		mailSender.setUsername("andreas.skapetis@gmail.com");
		mailSender.setPassword("Rand_pass@13");
		
		//TLS
		Properties javaMailProperties = new Properties();
		javaMailProperties.put("mail.smtp.auth", "true");
		javaMailProperties.put("mail.smtp.starttls.enable", "true");
		javaMailProperties.put("mail.smtp.host", "smtp.gmail.com");
		javaMailProperties.put("mail.smtp.port", "587");
		

		mailSender.setJavaMailProperties(javaMailProperties); 
		return mailSender;

	}
	*/
}