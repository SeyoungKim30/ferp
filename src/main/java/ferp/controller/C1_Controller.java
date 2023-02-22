package ferp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ferp.service.C1_Service;
import vo.Account;

@Controller
public class C1_Controller {

	@Autowired
	C1_Service service;
	
	@RequestMapping("addAccount.do")
	public String r7201AddAccount(Account account,Model model){
		model.addAttribute("accountList",service.r7200SelectAccount(account));
		return "WEB-INF\\headquarter\\pg7201_addAccount.jsp";
	}
}