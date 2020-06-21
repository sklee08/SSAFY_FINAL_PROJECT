package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.Rank;

public interface RankDAO {
	
	public List<Rank> selectAll();
	
	public Rank select(String keyword);
	
	public int insert(Rank r);
	
	public int delete(String keyword);
	
	public int update(Rank r);
}
