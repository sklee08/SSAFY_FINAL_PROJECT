package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.HousePageBean;

public interface HouseInfoDao {

	/** HouseInfo DB에 위도 경도 입력하기 위해서 등록된 모든 집의 동과 지번을 추출한다. */
	public List<HouseInfo> searchAllHouseInfo(HousePageBean bean);

	public HouseInfo search(HouseInfo info);

	public int insert(HouseInfo info);

	public int update(HouseInfo info);

	public int delete(int no);
}
