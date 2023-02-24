package ferp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ferp.service.C1_Service;
import vo.ACStatement;
import vo.Account;

@Controller
public class C1_Controller {

	@Autowired
	C1_Service service;

	// http://localhost:6080/ferp/selectAccountJson.do
	@RequestMapping("selectAccountJson.do")
	public String r7100SelectAccountJson(Account account, Model model) {
		model.addAttribute("accountList", service.r7100SelectAccount(account));
		return "pageJsonReport";
	}
	
	// http://localhost:6080/ferp/selectAccount.do
	@RequestMapping("selectAccount.do")
	public String r7101SelectAccount(Account account, Model model) {
		model.addAttribute("accountList", service.r7100SelectAccount(account));
		return "WEB-INF\\headquarter\\pg7201_addAccount.jsp";
	}

	@RequestMapping("insertAccount.do")
	public String r7101insertAccount(Account account) {
		service.r7101insertAccount(account);
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
		service.r7203insertStatement(acstmt.getStatementNum(), acstmt.getStmtDate(),acstmt.getFrRegiNum(), acstmt.getStmtlist());
		return "redirect:/selectACstatement.do?statementNum="+acstmt.getStatementNum();
	}
	
	@RequestMapping("selectACstatement.do")
	public String r7211selectACStatement(ACStatement acstmt,Model model) {
		model.addAttribute("stmtList",service.r7211selectACStatement(acstmt));
		return "WEB-INF\\headquarter\\pg7203_ACstatement.jsp";
	}
	
	@RequestMapping("updateACstatement.do")
	public String r7212updateACStatement(ACStatement acstmt) {
		
		return "WEB-INF\\headquarter\\pg7203_ACstatement.jsp";
	}
	
	@RequestMapping("deleteACstatement.do")
	public String r7213deleteACStatement(ACStatement acstmt) {
		
		return "WEB-INF\\headquarter\\pg7203_ACstatement.jsp";
	}
	
	@RequestMapping("statementList.do")
	public String r7204selectStatementList() {
		return "WEB-INF\\headquarter\\pg7204_statementList.jsp";	
	}
}