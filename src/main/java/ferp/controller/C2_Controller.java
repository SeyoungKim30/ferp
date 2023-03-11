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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ferp.service.C2_Service;
import vo.Emp;
import vo.Product;
import vo.ProductProdOrder;
import vo.Store;

@Controller
public class C2_Controller {
	
	@Autowired
	private C2_Service service;
	
	// 매장 재고 조회
	// http://localhost:6080/ferp/sproductList.do
	@RequestMapping("/sproductList.do")
	public String r8101ProductList(@ModelAttribute("sch") ProductProdOrder sch, Model d, HttpSession session){
		Store st = (Store)session.getAttribute("login");
		sch.setFrRegiNum(st.getFrRegiNum());
		d.addAttribute("plist", service.r8101ProductList(sch));
		return "WEB-INF\\store\\pg8101_productList.jsp";
	}
	
	// 매장 재고 상세 페이지
	@RequestMapping("/sproductInfo.do")
	public String r8101ProductInfo(@RequestParam String productNum, Model d){
		d.addAttribute("product",service.r8101ProductInfo(productNum));
		return "WEB-INF\\store\\pg8101_productInfo.jsp";
	}	
	
	// 매장 재고 관리 등록
	
	
	// 매장 재고 관리 조회
	// http://localhost:6080/ferp/sInoutList.do
	@RequestMapping("/sInoutList.do")
	public String r8102InoutList(@ModelAttribute("sch") ProductProdOrder sch){
		return "WEB-INF\\store\\pg8102_inoutList.jsp";
	}
	
	// 매장 재고 관리 수정
	
	
	// 매장 재고 관리 삭제
	
	
	// 본사 재고 조회
	// http://localhost:6080/ferp/hproductList.do
	@RequestMapping("/hproductList.do")
	public String r8201ProductList(@ModelAttribute("sch") ProductProdOrder sch, Model d, HttpSession session) {
		Emp st = (Emp)session.getAttribute("login");
		sch.setFrRegiNum(st.getFrRegiNum());
		d.addAttribute("plist", service.r8101ProductList(sch));
		return "WEB-INF\\headquarter\\pg8201_productList.jsp";
	}
	
	// 본사 재고 상세 페이지
	@RequestMapping("/hproductInfo.do")
	public String r8201ProductInfo(@RequestParam String productNum, Model d){
		d.addAttribute("product",service.r8101ProductInfo(productNum));
		return "WEB-INF\\headquarter\\pg8201_productInfo.jsp";
	}
	
	// 본사 재고 등록
	@RequestMapping("/hproductInsFrm.do")
	public String r8202ProductInsFrm(){
		return "WEB-INF\\headquarter\\pg8202_productIns.jsp";
	}
	@PostMapping("/hproductIns.do")
	public String r8202ProductIns(Product ins, RedirectAttributes redirect){
		if( service.r8202ProductIns(ins) != null ) {
			redirect.addFlashAttribute("msg", "등록 성공");
		}
		return "redirect:/hproductList.do";
	}
	
	// 본사 재고 수정
	@GetMapping("/hproductUpt.do")
	public String r8203ProductUpt(@RequestParam String productNum, Model d) {
		d.addAttribute("product", service.r8101ProductInfo(productNum));
		return "WEB-INF\\headquarter\\pg8203_productUpt.jsp";
	}
	@PostMapping("/hproductUpt.do")
	public String r8203ProductUpt(Product upt, RedirectAttributes redirect) {
		if( service.r8203ProductUpt(upt) != null) {
			redirect.addFlashAttribute("msg", "수정 성공");
		}
		return "redirect:/hproductList.do";
	}
	
	// 본사 재고 관리 조회
	// http://localhost:6080/ferp/hInoutList.do
	@RequestMapping("/hInoutList.do")
	public String r8204InoutList(ProductProdOrder sch, Model d){
		d.addAttribute("list", service.r8204InoutList(sch));
		return "WEB-INF\\headquarter\\pg8204_inoutList.jsp";
	}
	
	// 발주 상태 콤보
	@ModelAttribute("orderStateCom")
	public List<String> orderStateCom() {
		return service.orderStateCom();
	}
	
	// 직원스케줄 캘린더
	// http://localhost:6080/ferp/sclerkschd.do
	@GetMapping("/sclerkschd.do")
	public String sclerkschd() {
		return "WEB-INF\\store\\clerkschd.jsp";
	}
	@RequestMapping("schdajax.do")
	public String schdajax(Model d){
		d.addAttribute("list",service.sclerkschd("1234567891"));
		return "pageJsonReport";
	}
	
}
