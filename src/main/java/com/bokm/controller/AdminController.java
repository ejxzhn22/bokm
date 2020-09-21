package com.bokm.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bokm.service.MemberService;
import com.bokm.vo.Member;

@Controller
public class AdminController {
	@Inject
	private MemberService memberService;

//admin페이지

	
	@RequestMapping(value = "/admin/adminMemberList", method = RequestMethod.GET)
	public String adminMemberList(Model model) {
		
		List<Member> list = memberService.list();
		model.addAttribute("list", list);
		
		return "/admin/adminMemberList";
	}
	
	@RequestMapping(value = "/admin/adminMemberUpdate", method = RequestMethod.GET)
	public String adminMemberUpdate(Model model,@RequestParam("mb_id") int mb_id) {
		
		Member member = memberService.searchbyid(mb_id);
		model.addAttribute("member",member);

		
		
		return "/admin/adminMemberUpdate";
	}
	
	@RequestMapping(value = "/admin/adminMemberUpdate", method = RequestMethod.POST)
	public String adminMemberUpdate(@RequestParam("mb_id") int mb_id,Member member) {
	
	 memberService.updatemember(member);
		
		return "redirect:/admin/adminMemberList";
	}
	
	@RequestMapping(value = "/admin/adminDeleteMemberList", method = RequestMethod.GET)
	public String adminDeleteMemberList(Model model) {
		
		List<Member> list = memberService.deletelist();
		model.addAttribute("list", list);
		
		return "/admin/adminDeleteMemberList";
	}
	
	
	
	

}
