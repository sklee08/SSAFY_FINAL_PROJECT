package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HousePageBean; 

public interface HouseDao {

	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 아파트 거래 정보(HouseInfo)를  검색해서 반환.  
	 * @param bean  검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 */
	public List<HouseDeal> searchAll(HousePageBean bean);
	
	/**
	 * 아파트 식별 번호에 해당하는 아파트 거래 정보를 검색해서 반환. 
	 * @param no	검색할 아파트 식별 번호
	 * @return		아파트 식별 번호에 해당하는 아파트 거래 정보를 찾아서 리턴한다, 없으면 null이 리턴됨
	 */
	public HouseDeal searchByNo(int no);
	public List<HouseDeal> searchByDong (HousePageBean bean);
	public List<HouseDeal> searchByAptName (HousePageBean bean);
	public int getTotalCount();

	public int getTotalCountSearchByDong(String dong)  ;
	public int getTotalCountSearchByAptName(String aptName)  ;
	
	public int insert(HouseDeal deal);
	public int update(HouseDeal deal);
	public int delete(int no);
	
}
