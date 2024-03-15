package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.User;

public interface UserService {
	
	public String adduser(User emp);
	public String updateuser(User emp);
	public User viewuserbyid(int eid);
	public User checkuserlogin(String email,String pwd);
	public List<User> getAllUsers();


}
