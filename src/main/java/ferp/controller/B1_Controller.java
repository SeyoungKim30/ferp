package ferp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class B1_Controller {

	// http://localhost:6080/ferp/salesInfo.do
	
	// 본사:지난달전체매장매출총액
	// service단 int로 만들고 출력해보기...ㅠㅠ무서워 
	@RequestMapping("salesInfo.do")
	public String r7501SalesInfo(){
		
		return "WEB-INF\\headquarter\\pg7501_salesInfo.jsp";
	}
}