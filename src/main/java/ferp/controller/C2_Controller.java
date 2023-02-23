package ferp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ferp.service.C2_Service;
import vo.Product;

@Controller
public class C2_Controller {
	
	@Autowired
	C2_Service service;
	
	// http://localhost:6080/ferp/productSch.do
	@RequestMapping("productSch.do")
	public String r8101ProductSch(Product product,Model model){
		return "WEB-INF\\store\\pg8101_productSch.jsp";
	}
}
