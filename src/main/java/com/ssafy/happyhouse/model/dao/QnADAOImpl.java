package com.ssafy.happyhouse.model.dao;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.QnA;

@Repository
public class QnADAOImpl implements QnADAO{

	private static String ns = "com.ssafy.happyhouse.QnA.";
	
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public List<QnA> selectQnA() {
		return template.selectList(ns + "selectQnA");
	}

	@Override
	public QnA selectQnAByNo(int qna_no) {
		return template.selectOne(ns + "selectQnAByNo", qna_no);
	}

	@Override
	public int insertQnA(QnA q) {
		return template.insert(ns + "insertQnA", q);
	}

	@Override
	public int deleteQnA(int qna_no) {
		return template.delete(ns + "deleteQnA", qna_no);
	}

	@Override
	public int updateQnA(QnA q) {
		return template.update(ns + "updateQnA", q);
	}

}
