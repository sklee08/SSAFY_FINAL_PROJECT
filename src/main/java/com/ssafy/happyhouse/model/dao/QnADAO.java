package com.ssafy.happyhouse.model.dao;

import java.util.List;

import com.ssafy.happyhouse.model.dto.QnA;

public interface QnADAO {
	public List<QnA> selectQnA();
	public QnA selectQnAByNo(int qna_no);
	public int insertQnA(QnA q);
	public int deleteQnA(int qna_no);
	public int updateQnA(QnA q);
}
