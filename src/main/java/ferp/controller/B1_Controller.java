package ferp.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ferp.service.B1_Service;
import vo.Orders;


@Controller
public class B1_Controller {

	@Autowired(required=false)
	private B1_Service service;
	// http://localhost:6080/ferp/salesInfo.do
	
	// 본사:정보조회페이지 가는 컨트롤러 
	@CrossOrigin(origins = "*",allowedHeaders = "*")
	@RequestMapping("salesInfo.do")
	public String r7503SalesInfo(@ModelAttribute("sch") Orders ord, Model d){
		d.addAttribute("sbslist", service.SalesByStoreList(ord));
		return "WEB-INF\\headquarter\\pg7501_salesInfo.jsp";
	}
	// 본사:지난달전체매장매출총액
	@ModelAttribute("addAllsales")
	public int r7501SalesInfo() {
		return service.lastmonthAllSales();
	}
	// http://localhost:6080/ferp/salesInfoJson.do
	// 본사:전매장매출 전체조회
	@RequestMapping("salesInfoJson.do")
	public String r7503SalesInfoJson(Orders ord, Model d){
		d.addAttribute("sbslist", service.SalesByStoreList(ord));
		return "pageJsonReport";
	}
	
	
	
	// 본사:특정매장정보조회&페이지이동
	@CrossOrigin(origins = "*",allowedHeaders = "*")
	@RequestMapping("salesDetail.do")
	public String r7505storeDetail(@RequestParam("frRegiNum") String frRegiNum, Model d ){
		d.addAttribute("dinfo", service.StoreDetailInfo(frRegiNum));
		return "WEB-INF\\headquarter\\pg7505_salesDetailInfo.jsp";
	}
	
	// http://localhost:6080/ferp/detailInfoJson.do
	// 본사:특정매장정보JSON
	@RequestMapping("detailInfoJson.do")
	public String r7505detailSalesJson(Orders ord, Model d) {	
		d.addAttribute("dInfoList",service.multipleJson(ord) );	
		return "pageJsonReport";
	}
	
	
	// 본사:전매장 오픈시간조회
	@RequestMapping("storeOpen.do")
	public String r6202StoreOpen(@ModelAttribute("sch") Orders ord, Model d){
		//d.addAttribute("sbslist", service.SalesByStoreList(ord));
		return "WEB-INF\\headquarter\\pg6202_storeOpen.jsp";
	}

	

}