package com.ssafy.happyhouse.model.service;

import java.util.List;


import com.ssafy.happyhouse.model.dto.UserInfo;

public interface UserInfoService { 
	
	public UserInfo select(String id);
	
	public List<UserInfo> selectAll();
	
	public int insert(UserInfo ui);
	
	public int delete(String id);
	
	public int update(UserInfo ui);

}
