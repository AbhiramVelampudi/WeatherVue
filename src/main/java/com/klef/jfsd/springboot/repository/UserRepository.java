package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>
{
	@Query("select e from User e where e.email=?1 and e.password=?2")
	public User checkuserlogin(String email,String pwd);
	
	List<User> findByLocation(String location);
    
    @Query("SELECT DISTINCT u.location FROM User u")
    List<String> findDistinctLocations();
}
