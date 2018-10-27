package com.workPlatform.core.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workPlatform.core.dao.UserDao;
import com.workPlatform.entity.User;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;

	public User queryUserByUserName(String userName) {
		return userDao.queryUserByUserName(userName);
	}
	
}
