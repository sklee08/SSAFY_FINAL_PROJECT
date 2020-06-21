package com.ssafy.happyhouse.model.service;

import java.util.List;


import com.ssafy.happyhouse.model.dto.QnA;


public interface QnAService {
	public List<QnA> selectQnA();
	public QnA selectQnAByNo(int qna_no);
	public boolean insertQnA(QnA q);
	public boolean deleteQnA(int qna_no);
	public boolean updateQnA(QnA q);
}
