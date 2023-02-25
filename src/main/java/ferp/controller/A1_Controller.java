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
import vo.ClerkSchedule;
import vo.Store;
import vo.StoreClerk;


@Controller
public class A1_Controller {
	
	@Autowired(required = false)
	private A1_Service service;
	
	// 가맹점 로그인
	// http://localhost:6080/ferp/storeLogin.do
	// http://localhost:6080/ferp/storeClerkList.do
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
			return "/storeMainMenu.do";
		}
	}
	
	@RequestMapping("/storeMainMenu.do")
	public String pg1001storeMainMenu() {
		return "WEB-INF\\store\\pg1001_storeMainMenu.jsp";
	}
	
	@RequestMapping("/addCommute.do")
	public String pg3200addCommute(Model d,HttpSession session){
		Store st = (Store)session.getAttribute("login");
		d.addAttribute("myClerk", service.getStoreClerk(st.getFrRegiNum()));
		return "WEB-INF\\store\\pg3200_commute.jsp";
	}
	
	@RequestMapping("/addOnDay.do")
		public String addOnDay(ClerkSchedule inscs, Model d, HttpSession session) {
		Store st = (Store)session.getAttribute("login");
		inscs.setFrRegiNum(st.getFrRegiNum());
		service.addOnDay(inscs);
		d.addAttribute("msg","출근 등록이 완료되었습니다.");
		return "pageJsonReport";
	}
	
	@RequestMapping("/addOffTime.do")
	public String addOffTime(ClerkSchedule uptcs, Model d, HttpSession session) {
		Store st = (Store)session.getAttribute("login");
		uptcs.setFrRegiNum(st.getFrRegiNum());
		service.addOffTime(uptcs);
		d.addAttribute("msg","퇴근 등록이 완료되었습니다.");
		return "pageJsonReport";
	}
	
}