package com.ssafy.happyhouse.model.service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.model.dao.QnADAO;
import com.ssafy.happyhouse.model.dto.QnA;


@Service
public class QnAServiceImpl implements QnAService{

	@Autowired
	private QnADAO qDao;
	
	@Override
	public List<QnA> selectQnA() {
		
		return qDao.selectQnA();
	}

	@Override
	public QnA selectQnAByNo(int qna_no) {
		
		return qDao.selectQnAByNo(qna_no);
	}

	@Override
	public boolean insertQnA(QnA q) {

		return qDao.insertQnA(q) == 1;
	}

	@Override
	@Transactional
	public boolean deleteQnA(int qna_no) {

		return qDao.deleteQnA(qna_no) == 1;
	}

	@Override
	@Transactional
	public boolean updateQnA(QnA q) {
		return qDao.updateQnA(q) == 1;
	}

}
