package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.EmissionDAO;
import com.ssafy.happyhouse.model.dao.FSelectBoxDAO;
import com.ssafy.happyhouse.model.dao.GreenZoneDAO;
import com.ssafy.happyhouse.model.dto.Emission;
import com.ssafy.happyhouse.model.dto.GreenZone;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.SidoCodeDTO;

@Service
public class EmissionServiceImpl implements EmissionService {

	@Autowired
	private EmissionDAO dao;

	@Override
	public List<Emission> selectEmission(String dong) {
		return dao.selectEmission(dong);
	}

}
