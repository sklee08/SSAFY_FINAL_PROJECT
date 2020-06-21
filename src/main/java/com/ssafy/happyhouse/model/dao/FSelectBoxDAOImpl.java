package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.SidoCodeDTO;

@Repository
public class FSelectBoxDAOImpl implements FSelectBoxDAO {

	private static String ns = "com.ssafy.happyhouse.mapper.Sido.";
	
	@Autowired
	SqlSessionTemplate template;

	@Override
	public List<SidoCodeDTO> selectSido() throws Exception {
		return template.selectList(ns + "selectSido");
	}

	@Override
	public List<SidoCodeDTO> selectGugun(String sido) throws Exception {
		return template.selectList(ns + "selectGugun", sido);
	}

	@Override
	public List<HouseInfo> selectDong(String gugun) throws Exception {
		return template.selectList(ns + "selectDong", gugun);
	}

	@Override
	public List<HouseInfo> selectApt(String dong) throws Exception {
		return template.selectList(ns + "selectApt", dong);
	}

}
