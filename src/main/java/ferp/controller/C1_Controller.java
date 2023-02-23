package ferp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ferp.service.C1_Service;
import vo.ACStatement;
import vo.Account;

@Controller
public class C1_Controller {

	@Autowired
	C1_Service service;

	@ModelAttribute("acstatement")
	public ACStatement getFoo() {
		return new ACStatement();
	}

	// http://localhost:6080/ferp/addAccount.do
	@RequestMapping("addAccount.do")
	public String r7201AddAccount(Account account, Model model) {
		model.addAttribute("accountList", service.r7200SelectAccount(account));
		return "WEB-INF\\headquarter\\pg7201_addAccount.jsp";
	}

	@RequestMapping("insertAccount.do")
	public String r7201insertAccount(Account account) {
		service.r7201insertAccount(account);
		return "redirect:/addAccount.do";
	}

	// http://localhost:6080/ferp/insertACstatement.do
	@GetMapping("insertACstatement.do")
	public String r7203() {
		return "WEB-INF\\headquarter\\pg7203_ACstatement.jsp";
	}
	
	
	// http://localhost:6080/ferp/insertACstatement.do
	@PostMapping("insertACstatement.do")
	public String r7203insertStatement(ACStatement acstmt) {
		System.out.println("~~~~~~~~~~0번: "+acstmt.getStmtlist().get(0).getAcntNum());
		System.out.println("~~~~~~~~~~1번: "+acstmt.getStmtlist().get(1).getAcntNum());
		System.out.println("~~~~~~~~~~~전표 번호 : "+acstmt.getStatementNum());
		System.out.println("~~~~~~~~~~0번 전표번호: "+acstmt.getStmtlist().get(0).getStatementNum());
		System.out.println("~~~~~~~~~~1번 전표번호: "+acstmt.getStmtlist().get(1).getStatementNum());
		service.r7203insertStatement(acstmt.getStatementNum(), acstmt.getStmtDate(), acstmt.getStmtlist());
		return "WEB-INF\\headquarter\\pg7203_ACstatement.jsp";
	}
	
	
	
}