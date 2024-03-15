package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Form;
import com.klef.jfsd.springboot.model.User;

public interface AdminService 
{

	public List<User> viewallusers();
	public User viewuserbyid(int eid);
	public String deleteuser(int eid);
	public Admin checkadminlogin(String uname, String pwd);
	public String addbyadmin(User user);
	public long customercount();
	 public int updatestatus(int eid,boolean status);
	 public List<Form> viewallmsgs();
	 public Form viewmsgbyid(int fid);
	 
}
