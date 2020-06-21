package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.Rank;
import com.ssafy.happyhouse.model.service.RankService;

@RestController
@RequestMapping("/rank")
public class RankController {
	
	@Autowired
	private RankService rService;
	
	@GetMapping()
	public ResponseEntity<List<Rank>> selectAll(){
		List<Rank> list = rService.selectAll();
				
		return new ResponseEntity<List<Rank>>(list, HttpStatus.OK);
	}
}
