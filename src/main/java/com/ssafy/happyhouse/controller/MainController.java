package com.ssafy.happyhouse.controller;



import java.text.DateFormat;

import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.happyhouse.model.dto.UserInfo;
import com.ssafy.happyhouse.model.service.UserInfoService;


@Controller
public class MainController{
	
	

	static Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private UserInfoService uService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "main";
	}
	
	
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	
	@GetMapping("/mvlist/{id}")
	public String mvlist(Model model, @PathVariable String id) {
		UserInfo ui = uService.select(id);
		model.addAttribute("userinfo", ui);
		
		return "showlist";
	}
	
	@GetMapping("/mvfindpw")
	public String mvfindpw(Model model) {
		
		return "findpw";
	}
	
	@RequestMapping(value = "/mvlogin", method = RequestMethod.GET)
	public String mvlogin(Model model) {
		
		return "login";
	}
	
	@GetMapping("findpw")
	public String findpw(Model model, @PathVariable String id) {
		UserInfo ui = uService.select(id);
		model.addAttribute("userinfo", ui);
		return "showlist";
	}
	
	@GetMapping("/mvreguser")
	public String mvreguser(Model model) {
		
		return "registerUser";
	}
	
	@GetMapping("/mvupdate/{id}")
	public String mvupdate(Model model, @PathVariable String id) {
		UserInfo ui = uService.select(id);
		model.addAttribute("userinfo", ui);
		
		return "userupdate";
	}
	
	@GetMapping("/logout")
	public String logout(Model model, HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/list")
	public String list(Model model, HttpSession session) {
		return "redirect:/";
	}
	
	@GetMapping("/vue")
	public String vue(Model model, HttpSession session) {
		return "vue";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute UserInfo info, Model model, HttpSession session) {
		
		try {			
			UserInfo selected = uService.select(info.getId());
			if(selected.getPw().equals(info.getPw())) {
				session.setAttribute("userinfo", selected);
				model.addAttribute("msg", null);
				return "redirect:/";	
			}			
		} catch (RuntimeException e) {
			model.addAttribute("msg", "없는 아이디입니다.");
			return "login"; 
		}
		model.addAttribute("msg", "비밀번호가 틀렸습니다.");
		return "login";
	}
	
	@GetMapping("/qnaCreate")
	public String qnaCreate(Model model, HttpSession session) {
		return "qna/qnaCreate";
	}
}
