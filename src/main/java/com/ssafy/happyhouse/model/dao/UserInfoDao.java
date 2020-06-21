package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.UserInfo;

public interface UserInfoDao {
	
	public List<UserInfo> selectAll();
	
	public UserInfo select(String id);
	
	public int insert(UserInfo ui);
	
	public int delete(String id);
	
	public int update(UserInfo ui);
	
}
