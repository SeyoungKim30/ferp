package ferp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ferp.service.A2_Service;
import vo.ProdOrder;
import vo.Rq_Product;
import vo.SCPage;
import vo.StoreClerk;
import vo.Store;

@Controller
public class A2_Controller {
	
	@Autowired(required=false)
	private A2_Service service;
	
//	직원 정보 리스트 조회
	@RequestMapping("/storeClerkList.do")
	public String pg3100(@ModelAttribute("SCsch") SCPage SCsch, Model d, HttpSession session) {
		Store s=(Store)session.getAttribute("login");
		SCsch.setFrRegiNum(s.getFrRegiNum());
		d.addAttribute("scList", service.storeClerkList(SCsch));
		d.addAttribute("clerkTot", service.clerkTot());
		return "/WEB-INF/storeclerk/A2_storeClerkListCon.jsp";
	}
	
	@PostMapping("/storeClerkListSch.do")
	public String pg3100_1(@ModelAttribute("SCsch") SCPage SCsch, Model d) {
		d.addAttribute("scList", service.storeClerkList(SCsch));
		return "pageJsonReport";
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
	public String pg3103(@RequestParam("clerkNum") String clerkNum, Model d) {
		service.delStoreClerk(clerkNum);
		d.addAttribute("msg", "삭제완료");
		return "pageJsonReport";
	}
//	직원 급여액 조회
	@GetMapping("/clerkPayList.do")
	public String pg3300(@ModelAttribute("SCpsch") SCPage SCpsch, Model d, HttpSession session) {
		Store s=(Store)session.getAttribute("login");
		SCpsch.setFrRegiNum(s.getFrRegiNum());
		d.addAttribute("scList", service.storeClerkPayList(SCpsch));
		return "/WEB-INF/storeclerk/A2_clerkPayCon.jsp";
	}
//	발주 신청서 리스트 조회
	@GetMapping("/requestProd.do")
	public String pg9101() {
		return "/WEB-INF/storeclerk/A2_orderRequestCon.jsp";
	}
//	자재 리스트 조회
	@ModelAttribute("plist")
	public List<Rq_Product> pg9101_1(Rq_Product pname){
		return service.availProd(pname);
	}
//	발주 신청서 등록
	@PostMapping("/requestFrm.do")
	public String pg9101_2(ProdOrder ins, Model d) {
		service.prodOrderReq(ins);
		d.addAttribute("msg", "등록완료");
		return "pageJsonReport";
	}
//	발주 신청서 조회
	@ModelAttribute("reqlist")
	public List<ProdOrder> requestList(ProdOrder sch, HttpSession session){
		Store s = (Store)session.getAttribute("login");
		sch.setDemander(s.getFrRegiNum());
		return service.reqList(sch);
	}
//	발주 신청서 수정
	@PostMapping("/uptReqList.do")
	public String pg9103(ProdOrder upt, Model d) {
		service.uptReqList(upt);
		d.addAttribute("msg", "수정완료");
		return "pageJsonReport";
	}
//	발주 신청서 삭제
	@PostMapping("/delReqList.do")
	public String pg9102(ProdOrder del, Model d) {
		service.delReqList(del);
		d.addAttribute("msg", "삭제완료");
		return "pageJsonReport";
	}
}