package com.ssafy.happyhouse.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.QnA;
import com.ssafy.happyhouse.model.service.QnAService;


@RestController
@RequestMapping("/qna")
public class QnAController {

	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private QnAService qService;

	@GetMapping()
	public ResponseEntity<List<QnA>> retrieveBoard() throws Exception {
		logger.debug("retrieveBoard - 호출");	
		List<QnA> list = qService.selectQnA();
		return new ResponseEntity<List<QnA>>(list, HttpStatus.OK);
	}
    
	@GetMapping("{no}")
	public ResponseEntity<QnA> detailBoard(@PathVariable int no) {
		logger.debug("detailBoard - 호출");
		ResponseEntity<QnA> re = new ResponseEntity<QnA>(qService.selectQnAByNo(no), HttpStatus.OK);
		return new ResponseEntity<QnA>(qService.selectQnAByNo(no), HttpStatus.OK);
	}

	@PostMapping()
	public ResponseEntity<String> writeBoard(@RequestBody QnA q) {
		logger.debug("writeQnA - 호출");
		if (qService.insertQnA(q)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	@PutMapping()
	public ResponseEntity<String> updateBoard(@RequestBody QnA q) {
		logger.debug("updateQnA - 호출");
		logger.debug("" + q);
		
		boolean b = qService.updateQnA(q);
		System.out.println(q);
		if (b) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}

	@DeleteMapping("{no}")
	public ResponseEntity<String> deleteBoard(@PathVariable int no) {
		logger.debug("deleteBoard - 호출");
		if (qService.deleteQnA(no)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
}