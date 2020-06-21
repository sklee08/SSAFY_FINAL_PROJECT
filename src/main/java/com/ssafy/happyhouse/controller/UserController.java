package com.ssafy.happyhouse.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.UserInfo;
import com.ssafy.happyhouse.model.service.UserInfoService;


@RestController
public class UserController{
	@Autowired
	private UserInfoService uService;
	

	@RequestMapping(value = "/user/all", method = RequestMethod.GET)
	public ResponseEntity<List<UserInfo>> findAllEmployees() throws Exception {
		List<UserInfo> emps = uService.selectAll();
		if (emps.isEmpty()) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<UserInfo>>(emps, HttpStatus.OK);
	}
	
	
    @GetMapping("/user/{id}")
	public ResponseEntity<Map<String, Object>> select(@PathVariable String id) {
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			UserInfo info = uService.select(id);
			entity = handleSuccess(info);
		} catch (RuntimeException e) {
			entity = handleException(e);
		}
		return entity;
	}   

    
    @PostMapping("/user")
	public ResponseEntity<Map<String, Object>> regist(Model model, @RequestBody UserInfo u){
		ResponseEntity<Map<String, Object>> entity = null;
		try {			
			int result = uService.insert(u);
			entity = handleSuccess(u.getName() +" 가 추가되었습니다.");
		} catch (RuntimeException e) {
			entity = handleException(e);
		}
		return entity;
	}
    
    @PutMapping("/user")
	public ResponseEntity<Map<String, Object>> update(@RequestBody UserInfo p){
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			int result = uService.update(p);
			entity = handleSuccess(p.getName()+" 가 수정되었습니다.");
		} catch (RuntimeException e) {
			entity = handleException(e);
		}
		return entity;
	}
    
    @DeleteMapping("/user/{id}")
	public ResponseEntity<Map<String, Object>> delete(@PathVariable String id){
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			int result = uService.delete(id);
			entity = handleSuccess(id+" 가 탈퇴되었습니다.");
		} catch (RuntimeException e) {
			entity = handleException(e);
		}
		return entity;
	}
	
    private ResponseEntity<Map<String, Object>> handleSuccess(Object data) {
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("status", true);
		resultMap.put("data", data);
		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
	}

	private ResponseEntity<Map<String, Object>> handleException(Exception e) {
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("status", false);
		resultMap.put("data", e.getMessage());
		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
