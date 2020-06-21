package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.HousePageBean;

@Repository
public class HouseinfoDaoImpl implements HouseInfoDao {

	private static String ns = "com.ssafy.happyhouse.mapper.HouseInfo.";
	
	@Autowired
	SqlSessionTemplate template;
	
	@Override
	public List<HouseInfo> searchAllHouseInfo(HousePageBean bean) {
		return null;
	}

	@Override
	public HouseInfo search(HouseInfo info) {
		return template.selectOne(ns + "search", info);
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
