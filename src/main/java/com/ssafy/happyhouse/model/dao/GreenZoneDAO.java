package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.GreenZone;

public interface GreenZoneDAO {
	
	List<GreenZone> selectGrnzn(String dong);

}
