package ferp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class A1_Controller {

	// http://localhost:6080/ferp/addCommute.do
	@RequestMapping("addCommute.do")
	public String pg3200addCommute(){

		return "WEB-INF\\store\\pg3200_commute.jsp";
	}
}