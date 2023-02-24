package ferp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
	// http://localhost:6080/ferp/hproductSch.do
	@RequestMapping("/hproductSch.do")
	public String r8201ProductSch(@ModelAttribute("sch") Product sch, Model d) {
		d.addAttribute("plist", service.r8201ProductSch(sch));
		return "WEB-INF\\headquarter\\pg8201_productSch.jsp";
	}
}
