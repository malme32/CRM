package com.crm.gym.service;

 
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.MailParseException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
 
/**
 * @author Crunchify.com
 * 
 */
 
@Service("mailService")
public class MailService {
 
	@Autowired
	private JavaMailSender mailSender; // MailSender interface defines a strategy
										// for sending simple mails
  //  private SimpleMailMessage simpleMailMessage;

	public void sendMailExt(String toAddress, String fromAddress, String subject, String msgBody, String filePath) {

	       MimeMessage message = mailSender.createMimeMessage();

	       try{
	        MimeMessageHelper helper = new MimeMessageHelper(message, true);

	        helper.setFrom(fromAddress);
	        helper.setTo(toAddress);
	        helper.setSubject(subject);
	        helper.setText( msgBody);

	        FileSystemResource file = new FileSystemResource(filePath);
	        helper.addAttachment(file.getFilename(), file);

	         }catch (MessagingException e) {
	        throw new MailParseException(e);
	         }
	         mailSender.send(message);
	         }
	
	public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody) {
 
		SimpleMailMessage crunchifyMsg = new SimpleMailMessage();
		crunchifyMsg.setFrom(fromAddress);
		crunchifyMsg.setTo(toAddress);
		crunchifyMsg.setSubject(subject);
		crunchifyMsg.setText(msgBody);
		mailSender.send(crunchifyMsg);
	}
}