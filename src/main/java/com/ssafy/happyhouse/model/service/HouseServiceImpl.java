package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.HouseDao;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean;

@Service
public class HouseServiceImpl implements HouseService {

	@Autowired
	HouseDao housedao;

	@Override
	public List<HouseDeal> searchAll(HousePageBean bean) {
		return housedao.searchAll(bean);
	}

	@Override
	public HouseDeal searchByNo(int no) {
		return housedao.searchByNo(no);
	}

	@Override
	public int getTotalCount() {
		return housedao.getTotalCount();
	}

	@Override
	public List<HouseDeal> searchByDong(HousePageBean bean) {
		return housedao.searchByDong(bean);
	}

	@Override
	public List<HouseDeal> searchByAptName(HousePageBean bean) {
		return housedao.searchByAptName(bean);
	}

	@Override
	public int insert(HouseDeal deal) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(HouseDeal deal) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getTotalCountByDong(String dong) {
		return housedao.getTotalCountSearchByDong(dong);
	}

	@Override
	public int getTotalCountByAptName(String aptName) {
		return housedao.getTotalCountSearchByAptName(aptName);
	}

}