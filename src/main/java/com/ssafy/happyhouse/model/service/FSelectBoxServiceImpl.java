package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.FSelectBoxDAO;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.SidoCodeDTO;

@Service
public class FSelectBoxServiceImpl implements FSelectBoxService {

	@Autowired
	private FSelectBoxDAO dao;

	@Override
	public List<SidoCodeDTO> selectSido() throws Exception {
		System.out.println(dao.selectSido());
		return dao.selectSido();
	}

	@Override
	public List<SidoCodeDTO> selectGugun(String sido) throws Exception {
		return dao.selectGugun(sido);
	}

	@Override
	public List<HouseInfo> selectDong(String gugun) throws Exception {
		return dao.selectDong(gugun);
	}

	@Override
	public List<HouseInfo> selectApt(String dong) throws Exception {
		return dao.selectApt(dong);
	}

}
