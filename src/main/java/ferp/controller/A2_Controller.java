package ferp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ferp.service.A2_Service;
import vo.SCPage;
import vo.StoreClerk;

@Controller
public class A2_Controller {
	
	@Autowired(required=false)
	private A2_Service service;
	
//	직원 정보 리스트 조회
	@GetMapping("/storeClerkList.do")
	public String pg3100(@ModelAttribute("SCsch") SCPage SCsch, Model d) {
		d.addAttribute("scList", service.storeClerkList(SCsch));
		return "/WEB-INF/storeclerk/A2_storeClerkList.jsp";
	}
//	직원 정보 등록
	@PostMapping("/insStoreclerk.do")
	public String pg3101(StoreClerk ins, Model d) {
		service.insStoreclerk(ins);
		d.addAttribute("msg", "등록완료");
		return "pageJsonReport";
	}
//	직원 정보 수정
	@PostMapping("/uptStoreClerk.do")
	public String pg3102(StoreClerk upt, Model d) {
		service.uptStoreClerk(upt);
		d.addAttribute("msg", "수정완료");
		return "pageJsonReport";
	}
//	직원 정보 삭제
	@PostMapping("/delStoreClerk.do")
	public String pg3103(@RequestParam("clerkNum") int clerkNum, Model d) {
		service.delStoreClerk(clerkNum);
		d.addAttribute("msg", "삭제완료");
		return "pageJsonReport";
	}
//	직원 급여액 조회
	@GetMapping("/clerkPayList.do")
	public String clerkPayList(@ModelAttribute("SCpsch") SCPage SCpsch, Model d) {
		d.addAttribute("scList", service.storeClerkPayList(SCpsch));
		return "/WEB-INF/storeclerk/A2_clerkPay.jsp";
	}
//	발주 신청서 리스트 조회
	@GetMapping("/requestProd.do")
	public String requestProd() {
		return "/WEB-INF/storeclerk/A2_orderRequest.jsp";
	}
}
