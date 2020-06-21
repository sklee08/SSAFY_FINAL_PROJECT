package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.HouseInfoDao;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.HousePageBean;

@Service
public class HouseInfoServiceImpl implements HouseinfoService {

	@Autowired
	HouseInfoDao houseInfoDao;
	
	@Override
	public List<HouseInfo> searchAll(HousePageBean bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HouseInfo search(HouseInfo info) {
		return houseInfoDao.search(info);
	}

	@Override
	public int insert(HouseInfo info) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(HouseInfo info) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

}
