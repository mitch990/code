package com.workPlatform.core.service;

import org.springframework.stereotype.Service;

import com.workPlatform.entity.User;

@Service
public interface UserService {
	public User queryUserByUserName(String userName);
}
