package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.dto.Emission;
import com.ssafy.happyhouse.model.dto.GreenZone;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.service.EmissionService;
import com.ssafy.happyhouse.model.service.GreenZoneService;

@Controller
public class NatureController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Autowired
	private GreenZoneService gservice;
	
	@Autowired
	private EmissionService eservice;

	@GetMapping("/GreenZone")
	protected ResponseEntity<List<GreenZone>> greenZone(Model model,
			@RequestParam(value = "dong", required = false) String dong) {

		return new ResponseEntity<List<GreenZone>>(gservice.selectGrnzn(dong), HttpStatus.OK);
	}
	
	@GetMapping("/Emission")
	protected ResponseEntity<List<Emission>> emission(Model model,
			@RequestParam(value = "dong", required = false) String dong) {

		return new ResponseEntity<List<Emission>>(eservice.selectEmission(dong), HttpStatus.OK);
	}
	
}
