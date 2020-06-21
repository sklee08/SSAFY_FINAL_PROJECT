package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.Emission;
import com.ssafy.happyhouse.model.dto.GreenZone;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.SidoCodeDTO;

@Repository
public class EmissionDAOImpl implements EmissionDAO {

	private static String ns = "com.ssafy.happyhouse.mapper.Nature.";
	
	@Autowired
	SqlSessionTemplate template;

	@Override
	public List<Emission> selectEmission(String dong) {
		return template.selectList(ns + "selectEmission", dong.trim());
	}

}
