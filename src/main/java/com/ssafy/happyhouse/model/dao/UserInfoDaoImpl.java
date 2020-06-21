package com.ssafy.happyhouse.model.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.UserInfo;

@Repository
public class UserInfoDaoImpl implements UserInfoDao{

	private static String ns = "com.ssafy.happyhouse.userInfo.";
	
	@Autowired
	SqlSessionTemplate template;
	
	@Override
	public List<UserInfo> selectAll() {
		return template.selectList(ns + "selectAll");
		
	}

	@Override
	public UserInfo select(String id) {
		return template.selectOne(ns + "select", id);
		
	}

	@Override
	public int insert(UserInfo ui) {
		
		return template.insert(ns + "insert", ui);
	}

	@Override
	public int delete(String id) {
		
		return template.delete(ns + "delete", id);
	}

	@Override
	public int update(UserInfo ui) {
		return template.update(ns + "update", ui);		
	}
	
}
