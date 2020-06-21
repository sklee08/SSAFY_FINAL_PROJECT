package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.SidoCodeDTO;
import com.ssafy.happyhouse.model.service.FSelectBoxService;

@RestController
@RequestMapping("/FSelectBoxController")
public class FSelectBoxController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Autowired
	private FSelectBoxService service;

	@GetMapping
	protected ResponseEntity<List<SidoCodeDTO>> fselector(Model model,
			@RequestParam(value = "command", required = false) String command,
			@RequestParam(value = "sido", required = false) String sido) {

		if(command.equals("sido")) {
			try {
				return new ResponseEntity<List<SidoCodeDTO>>(service.selectSido(), HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//sido
		else if(command.equals("gugun")) {
			try {
				return new ResponseEntity<List<SidoCodeDTO>>(service.selectGugun(sido), HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//gugun
		return null;
	}//process
	
	@GetMapping("{command}")
	protected ResponseEntity<List<HouseInfo>> fselectorHouse(Model model,
			@PathVariable String command,
			@RequestParam(value = "gugun", required = false) String gugun,
			@RequestParam(value = "dong", required = false) String dong) {

		if(command.equals("dong")) {
			try {
				return new ResponseEntity<List<HouseInfo>>(service.selectDong(gugun), HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//dong
		else if(command.equals("apt")) {
			try {
				return new ResponseEntity<List<HouseInfo>>(service.selectApt(dong), HttpStatus.OK);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}//apt
		return null;
	}//process

}
