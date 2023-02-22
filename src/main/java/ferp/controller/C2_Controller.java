package ferp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class C2_Controller {
	// http://localhost:6080/ferp/productSch.do
	@RequestMapping("productSch.do")
	public String r8101ProductSch(){
		return "WEB-INF\\store\\pg8101_productSch.jsp";
	}
}
