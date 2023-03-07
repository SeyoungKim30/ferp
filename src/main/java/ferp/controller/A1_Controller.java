package ferp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import ferp.service.A1_Service;
import vo.ClerkSchedule;
import vo.Emp;
import vo.Menu;
import vo.Onsale;
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
   // 로그아웃(emp)
   @RequestMapping("/logoutEmp.do")
   public String logoutEmp(HttpSession session, Model d) {
     session.removeAttribute("login");
     d.addAttribute("logout","로그아웃");
      return "forward:/empLogin.do";
   }
   
   // 로그아웃(store)
   @RequestMapping("/logoutStore.do")
   public String logoutStore(HttpSession session, Model d) {
      session.removeAttribute("login");
      d.addAttribute("logout","로그아웃");
      return "forward:/storeLogin.do";
      }
   
   @RequestMapping("/storeMainMenu.do")
   public String pg1001storeMainMenu() {
      return "WEB-INF\\store\\pg1001_storeMainMenu.jsp";
   }
   
   // http://localhost:6080/ferp/goIndex.do
   @RequestMapping("/goIndex.do")
   public String goIndex() {
      return "/pg0003.jsp";
   }
   
   
   @RequestMapping("/storeSet.do")
   public String storeSet() {
      return "/pg0002.jsp";
   }
   
   @RequestMapping("/goEmpMainPage.do")
   public String goEmpMainPage() {
      return "/index.jsp";
   }
   
   // http://localhost:6080/ferp/goOrderCheck.do
   @RequestMapping("/goOrderCheck.do")
   public String goOrderCheck() {
      return "WEB-INF\\store\\pg2200_orderCheck.jsp";
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
   
   
   // 전체 메뉴 조회 페이지
   @RequestMapping("/onsaleList.do")
   public String pg2002onsaleList(Model d, HttpSession session){
      Store st = (Store)session.getAttribute("login");
      d.addAttribute("showOnSale", service.getMenuList(st.getFrRegiNum()));
      return "WEB-INF\\store\\pg2002_onsaleList.jsp";
   }
   
   // 전체 메뉴 조회 페이지
   @RequestMapping("/showMenu.do")
   public String pg2001showMenu(@ModelAttribute("sch") Menu sch, Model d){
      d.addAttribute("showAllMenu", service.getAllMenu(sch));
      return "WEB-INF\\store\\pg2001_showAllMenu.jsp";
   }
   
   // 판매할 메뉴 등록
   @RequestMapping("/insOnsale.do")
   public String insOnsale(Onsale ins, Model d, HttpSession session) {
      Store st = (Store)session.getAttribute("login");
      ins.setFrRegiNum(st.getFrRegiNum());
      service.insOnsale(ins);
      d.addAttribute("msg","판매 메뉴가 추가되었습니다.");
      return "pageJsonReport";
   }
   
}