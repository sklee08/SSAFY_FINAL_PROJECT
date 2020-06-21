package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Emission;

public interface EmissionDAO {
	
	List<Emission> selectEmission(String dong);

}
