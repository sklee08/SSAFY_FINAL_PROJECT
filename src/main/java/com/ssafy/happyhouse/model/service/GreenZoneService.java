package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.GreenZone;

public interface GreenZoneService {

	List<GreenZone> selectGrnzn(String dong);

}
