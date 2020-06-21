package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.UserInfoDao;
import com.ssafy.happyhouse.model.dto.UserInfo;

@Service
public class UserInfoServiceImpl implements UserInfoService{

	@Autowired
	UserInfoDao uDao;
	
	@Override
	public UserInfo select(String id) {
	
		return uDao.select(id);
	}

	@Override
	public List<UserInfo> selectAll() {
		
		return uDao.selectAll();
	}

	@Override
	public int insert(UserInfo ui) {
		
		return uDao.insert(ui);
	}

	@Override
	public int delete(String id) {
		
		return uDao.delete(id);
	}

	@Override
	public int update(UserInfo ui) {
		
		return uDao.update(ui);
	}

		
}
