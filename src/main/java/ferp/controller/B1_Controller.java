package ferp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import ferp.service.B1_Service;


@Controller
public class B1_Controller {

	@Autowired(required=false)
	private B1_Service service;
	
	// http://localhost:6080/ferp/salesInfo.do
	
	// 본사:지난달전체매장매출총액
	// 본사:매장별매출 전체조회
	@GetMapping("salesInfo.do")
	public String r7501SalesInfo(){
		
		return "WEB-INF\\headquarter\\pg7501_salesInfo.jsp";
	}
	

}