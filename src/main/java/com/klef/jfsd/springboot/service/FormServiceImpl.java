package com.klef.jfsd.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Form;
import com.klef.jfsd.springboot.repository.FormRepository;

@Service
public class FormServiceImpl implements FormService{

	@Autowired
	private FormRepository formRepository;

	@Override
	public String addform(Form f) {
		formRepository.save(f);
		return "Message Sent Successfully";
	}
	
}
