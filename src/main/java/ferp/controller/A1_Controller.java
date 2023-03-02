package ferp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ferp.service.A1_Service;
import vo.ClerkSchedule;
import vo.Emp;
import vo.Menu;
import vo.Store;


@Controller
public class A1_Controller {
	
	@Autowired(required = false)
	private A1_Service service;
	
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
			return "/storeMainMenu.do";
		}
	}
	// 본사 로그인
	// http://localhost:6080/ferp/empLogin.do
	@RequestMapping("/empLogin.do")
	public String pg4103empLogin(Emp emp, Model d, HttpSession session){
		if(emp.getEmpnum()==null) {
			d.addAttribute("loginState", "로그인페이지");
			return "WEB-INF\\headquarter\\pg4103_hqLogin.jsp";
		}else if(service.empLogin(emp)==null){
			d.addAttribute("loginState", "틀림");
			return "WEB-INF\\headquarter\\pg4103_hqLogin.jsp";
		}else {
			session.setAttribute("login", service.empLogin(emp));
			return "/goEmpMainPage.do";
		}
	}
	
	
	
	@RequestMapping("/storeMainMenu.do")
	public String pg1001storeMainMenu() {
		return "WEB-INF\\store\\pg1001_storeMainMenu.jsp";
	}
	
	@RequestMapping("/goEmpMainPage.do")
	public String goEmpMainPage() {
		return "\\WEB-INF\\headquarter\\hq_main_index.jsp";
	}
	
	
	// http://localhost:6080/ferp/kiosqueMainForCustomer.do

	@RequestMapping("/kiosqueMainForCustomer.do")
	public String pg2100kiosqueMain(Model d, HttpSession session) {
		Store st = (Store)session.getAttribute("login");
		d.addAttribute("Allmenu", service.getMenuList(st.getFrRegiNum()));
		d.addAttribute("coffeeMenu", service.getMenuListCoffee(st.getFrRegiNum()));
		d.addAttribute("smoMenu", service.getMenuListSmoothie(st.getFrRegiNum()));
		d.addAttribute("etcMenu", service.getMenuListEtc(st.getFrRegiNum()));
		d.addAttribute("sandMenu", service.getMenuListSandwich(st.getFrRegiNum()));
		d.addAttribute("cakeMenu", service.getMenuListCake(st.getFrRegiNum()));
		return "WEB-INF\\customer\\pg2100_KiosqueMain.jsp";
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