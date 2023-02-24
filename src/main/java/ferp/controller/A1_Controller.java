package ferp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ferp.service.A1_Service;
import vo.Store;
import vo.StoreClerk;


@Controller
public class A1_Controller {
	
	@Autowired(required = false)
	private A1_Service service;
	
	@ModelAttribute("myClerk")
		public List<StoreClerk> getStoreClerk(HttpSession session){
			Store st = (Store)session.getAttribute("login");
			return service.getStoreClerk(st.getFrRegiNum());
		}
	
	
	@RequestMapping("/addCommute.do")
	public String pg3200addCommute(){
		return "WEB-INF\\store\\pg3200_commute.jsp";
	}
	
	// 가맹점 로그인
	// http://localhost:6080/ferp/storeLogin.do
	@RequestMapping("/storeLogin.do")
	public String pg1000storeLogin(Store st, Model d, HttpSession session){
		if(st.getFrRegiNum()==null) {
			d.addAttribute("loginState", "로그인페이지");
			return "WEB-INF\\store\\pg1000_storeLogin.jsp";
		}else if(service.storeLogin(st)==null){
			d.addAttribute("loginState", "틀림");
			return "WEB-INF\\store\\pg1000_storeLogin.jsp";
		}else {
			session.setAttribute("login", service.storeLogin(st));
			return "/addCommute.do";
		}
	}
}