package com.workPlatform.core.dao;

import org.springframework.stereotype.Repository;

import com.workPlatform.entity.User;

@Repository
public interface UserDao {
	public User queryUserByUserName(String userName) ;
}
