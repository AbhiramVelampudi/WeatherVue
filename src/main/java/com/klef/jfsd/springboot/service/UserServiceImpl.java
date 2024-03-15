package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService
{
	 @Autowired
	  private UserRepository userRepository;

	@Override
	public String adduser(User user) {
		 userRepository.save(user);
		 return "user Added Successfully";
	}

	@Override
	public String updateuser(User user) 
	{
		 User e=userRepository.findById(user.getId()).get();
	        
	        e.setName(user.getName());
	        e.setEmail(user.getEmail());
	        e.setPassword(user.getPassword());
	        e.setLocation(user.getLocation());
	        e.setContact(user.getContact());
	        
	        userRepository.save(e);
	        
	        return"user Updated Successfully";
	}


	@Override
	public User viewuserbyid(int eid) {
		Optional<User> obj =  userRepository.findById(eid);
	       
	       if(obj.isPresent())
	       {
	         User user = obj.get();
	         
	         return user;
	       }
	       else
	       {
	         return null;
	       }
	}

	@Override
	public User checkuserlogin(String email, String pwd) {
		
		return userRepository.checkuserlogin(email, pwd);
	}

	@Override
	public List<User> getAllUsers() {
        return userRepository.findAll();
    }



}
