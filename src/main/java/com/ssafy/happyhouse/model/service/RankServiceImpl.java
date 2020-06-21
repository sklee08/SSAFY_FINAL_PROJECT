package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.RankDAO;
import com.ssafy.happyhouse.model.dto.Rank;

@Service
public class RankServiceImpl implements RankService{

	@Autowired
	private RankDAO rDao;
	
	@Override
	public List<Rank> selectAll() {

		return rDao.selectAll();
	}

	@Override
	public Rank select(String keyword) {
		
		return rDao.select(keyword);
	}

	@Override
	public int insert(Rank r) {
		
		return rDao.insert(r);
	}

	@Override
	public int delete(String keyword) {
		
		return rDao.delete(keyword);
	}

	@Override
	public int update(Rank r) {
		
		return rDao.update(r);
	}
	
}
