package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Emission;

public interface EmissionService {

	List<Emission> selectEmission(String dong);

}
