package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.SidoCodeDTO;

public interface FSelectBoxDAO {

	List<SidoCodeDTO> selectSido() throws Exception;

	List<SidoCodeDTO> selectGugun(String sido) throws Exception;

	List<HouseInfo> selectDong(String gugun) throws Exception;

	List<HouseInfo> selectApt(String dong) throws Exception;

}
