package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.Rank;

@Repository
public class RankDAOImpl implements RankDAO{
	
	private static String ns = "com.ssafy.happyhouse.Rank.";
	
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public List<Rank> selectAll() {

		return template.selectList(ns + "selectAll");
	}

	@Override
	public Rank select(String keyword) {
		
		return template.selectOne(ns + "select", keyword);
	}

	@Override
	public int insert(Rank r) {

		return template.insert(ns + "insert", r);
	}

	@Override
	public int delete(String keyword) {

		return template.delete(ns + "delete", keyword);
	}

	@Override
	public int update(Rank r) {
		
		return template.update(ns + "update", r);
	}
	
	
}
