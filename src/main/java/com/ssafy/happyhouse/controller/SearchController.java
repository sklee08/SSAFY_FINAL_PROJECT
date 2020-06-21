package com.ssafy.happyhouse.controller;

import java.util.Collection;

import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.HouseInfo;
import com.ssafy.happyhouse.model.dto.HousePageBean;
import com.ssafy.happyhouse.model.dto.Rank;
import com.ssafy.happyhouse.model.service.HouseService;
import com.ssafy.happyhouse.model.service.HouseinfoService;
import com.ssafy.happyhouse.model.service.RankService;


@Controller
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Autowired
	HouseService houseService;
	
	@Autowired
	HouseinfoService houseinfoService;
	
	@Autowired
	RankService rService;

	@GetMapping("/search")
	public String search(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int index,
			@RequestParam(value = "act", required = false) String act,
			@RequestParam(value = "by", required = false) String by,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "dong", required = false) String dong,
			@RequestParam(value = "aptName", required = false) String aptName) {
		
		HousePageBean housePageBean = new HousePageBean();
		
		Collection<HouseDeal> results;
		
		if (act == null) {
			housePageBean.setPageNo(index);
			housePageBean.setTotalCount(houseService.getTotalCount());

			results = houseService.searchAll(housePageBean);
			model.addAttribute("houseDeals", results);
			model.addAttribute("paging", housePageBean);
			System.out.println("null 빈 초기값 " + housePageBean.toString());
			
		} else if (act.equals("search")) {
			model.addAttribute("act1", act);
			model.addAttribute("by1", by);
			model.addAttribute("keyword1", keyword);
			
			if (by.equals("dongName")) {
				housePageBean.setPageNo(index);
				housePageBean.setTotalCount(houseService.getTotalCountByDong(keyword));
				housePageBean.setDong(keyword);
				if(!keyword.equals("")) {
					Rank r = rService.select(keyword);
					if(r == null) {
						// 랭크 없음
						rService.insert(new Rank(keyword, by, 1));
					}else {
						// 랭크 존재
						rService.update(new Rank(keyword, by, r.getCnt()+1));
					}
				}				
				model.addAttribute("paging", housePageBean);
				results = houseService.searchByDong(housePageBean);
				model.addAttribute("houseDeals", results);
				
			} else if (by.equals("aptName")) {
				housePageBean.setPageNo(index);
				housePageBean.setTotalCount(houseService.getTotalCountByAptName(keyword));
				housePageBean.setAptname(keyword);
				if(!keyword.equals("")) {
					Rank r = rService.select(keyword);
					if(r == null) {
						// 랭크 없음
						rService.insert(new Rank(keyword, by, 1));
					}else {
						// 랭크 존재
						rService.update(new Rank(keyword, by, r.getCnt()+1));
					}
				}	
				model.addAttribute("paging", housePageBean);
				results = houseService.searchByAptName(housePageBean);
				model.addAttribute("houseDeals", results);
				
			}
			System.out.println("search 빈 초기값 " + housePageBean.toString());

		}else if (act.equals("detail")) {
			HouseInfo houseinfo = new HouseInfo();
			houseinfo.setAptName(aptName);
			houseinfo.setDong(dong.trim());
			
			houseinfo= houseinfoService.search(houseinfo); 
			model.addAttribute("house_detail", houseinfo);
			
			return "search_deal_detail";
		}

		return "search_deal";
	}
	
}
