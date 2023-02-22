package ferp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class B1_Controller {

	// http://localhost:6080/ferp/salesInfo.do
	@RequestMapping("salesInfo.do")
	public String r7501SalesInfo(){

		return "WEB-INF\\headquarter\\pg7501_salesInfo.jsp";
	}
}