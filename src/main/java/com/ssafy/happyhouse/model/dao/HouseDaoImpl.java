package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean;

@Repository
public class HouseDaoImpl implements HouseDao {
	
	private static String ns = "com.ssafy.happyhouse.mapper.HouseDeal.";
	
	@Autowired
	SqlSessionTemplate template;

	@Override
	public List<HouseDeal> searchAll(HousePageBean bean){
		return template.selectList(ns + "searchAll", ((bean.getPageNo() - 1) * 10));
	}

	@Override
	public HouseDeal searchByNo(int no){
		return template.selectOne(ns + "searchByNo", no);
	}

	@Override
	public List<HouseDeal> searchByDong(HousePageBean bean) {
		bean.setPageNo((bean.getPageNo()-1)*10);
		return template.selectList(ns + "searchByDong", bean);
	}

	@Override
	public List<HouseDeal> searchByAptName(HousePageBean bean) {
		bean.setPageNo((bean.getPageNo()-1)*10);
		return template.selectList(ns + "searchByAptName", bean);
	}

	@Override
	public int getTotalCount() {
		return template.selectOne(ns + "getTotalCount");
	}

	@Override
	public int insert(HouseDeal deal) {
		return template.insert(ns + "insert", deal);
	}

	@Override
	public int update(HouseDeal deal) {
		return template.update(ns + "insert", deal);
	}

	@Override
	public int delete(int no) {
		return template.delete(ns + "delete");
	}

	@Override
	public int getTotalCountSearchByDong(String dong) {
		return template.selectOne(ns + "getTotalCountByDong", dong);
	}

	@Override
	public int getTotalCountSearchByAptName(String aptName) {
		return template.selectOne(ns + "getTotalCountByaptName", aptName);
	}

}