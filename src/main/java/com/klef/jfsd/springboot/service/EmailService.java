package com.klef.jfsd.springboot.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.mail.SimpleMailMessage; 
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async; 
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor; 


@Service 
@RequiredArgsConstructor 
public class EmailService 
{ 
	@Autowired 
	private JavaMailSender javaMailSender; 
	 
	@Async 
	public void sendEmail(String toEmail,String subject,String msg) 
	{ 
	 SimpleMailMessage mailMessage = new SimpleMailMessage(); 
	 mailMessage.setTo(toEmail); 
	 mailMessage.setText(msg); 
	 mailMessage.setSubject(subject); 
	 mailMessage.setFrom("weathervue004@gmail.com"); //from mail id
	 javaMailSender.send(mailMessage); 
	} 
	

}
