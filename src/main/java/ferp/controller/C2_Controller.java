package ferp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ferp.service.C2_Service;
import vo.Product;

@Controller
public class C2_Controller {
	
	@Autowired
	C2_Service service;
	
	// 매장 재고 조회
	// http://localhost:6080/ferp/sproductSch.do
	@RequestMapping("sproductSch.do")
	public String r8101ProductSch(Product product,Model model){
		return "WEB-INF\\store\\pg8101_productSch.jsp";
	}
	
	// 본사 재고 조회
	// http://localhost:6080/ferp/hproductList.do
	@RequestMapping("/hproductList.do")
	public String r8201ProductList(@ModelAttribute("sch") Product sch, Model d) {
		d.addAttribute("plist", service.r8201ProductList(sch));
		return "WEB-INF\\headquarter\\pg8201_productList.jsp";
	}
	// 본사 재고 상세 조회
	@GetMapping("/hproductInfo.do")
	public String r8201ProductInfo(@RequestParam("productNum") String productNum, Model d){
		d.addAttribute("product",service.r8201ProductInfo(productNum));
		return "WEB-INF\\headquarter\\pg8201_productInfo.jsp";
	}
	// 본사 재고 등록
	@RequestMapping("/hproductInsFrm.do")
	public String r8202ProductInsFrm(){
		return "WEB-INF\\headquarter\\pg8202_productIns.jsp";
	}
	@PostMapping("/hproductIns.do")
	public String r8202ProductIns(Product ins, Model d){
		service.r8202ProductIns(ins);
		d.addAttribute("msg","등록성공");
		return "WEB-INF\\headquarter\\pg8202_productIns.jsp";
	}
	// 본사 재고 수정
	
}
