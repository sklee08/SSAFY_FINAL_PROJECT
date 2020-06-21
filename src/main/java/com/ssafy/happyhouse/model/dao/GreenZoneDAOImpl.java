package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.GreenZone;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.SidoCodeDTO;

@Repository
public class GreenZoneDAOImpl implements GreenZoneDAO {

	private static String ns = "com.ssafy.happyhouse.mapper.Nature.";
	
	@Autowired
	SqlSessionTemplate template;

	@Override
	public List<GreenZone> selectGrnzn(String dong) {
		if(dong.endsWith("동")) dong = dong.substring(0, dong.length()-1);
		return template.selectList(ns + "selectGrnzn", dong.trim());
	}

}
