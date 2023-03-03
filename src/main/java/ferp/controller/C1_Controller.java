package ferp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ferp.service.C1_Service;
import vo.ACStatement;
import vo.Account;
import vo.ProdOrder;
import vo.Prod_order_stock_emp_store;

@Controller
public class C1_Controller {

	@Autowired
	C1_Service service;

	// http://localhost:6080/ferp/selectAccountJson.do
	@CrossOrigin(origins = "*",allowedHeaders = "*")
	@GetMapping("selectAccountJson.do")
	public String r7100SelectAccountJson(Account account, Model model) {
		account.setAcntUsing(true);
		model.addAttribute("accountList", service.r7100SelectAccount(account));
		account.setAcntUsing(false);
		model.addAttribute("accountListfalse", service.r7100SelectAccount(account));
		return "pageJsonReport";
	}
	
	// http://localhost:6080/ferp/selectAccount.do
	@RequestMapping("selectAccount.do")
	public String r7101SelectAccount(Account account, Model model) {
		account.setAcntUsing(false);
		model.addAttribute("accountListfalse", service.r7100SelectAccount(account));
		account.setAcntUsing(true);
		model.addAttribute("accountListtrue", service.r7100SelectAccount(account));
		return "WEB-INF\\headquarter\\pg7201_addAccount.jsp";
	}
	
	@RequestMapping("updateAccountUsing.do")
	@ResponseBody
	public String r7102updateAccountUsing(Account account){
		int done=service.r7102updateAccountUsing(account);
		return done+"";
	}

	@RequestMapping("insertAccount.do")
	public String r7101insertAccount(Account account) {
		service.r7101insertAccount(account);
		return "redirect:/selectAccount.do";
	}

	//전표 페이지
	// http://localhost:6080/ferp/ACstatement.do
	@GetMapping("ACstatement.do")
	public String r7210() {
		return "WEB-INF\\headquarter\\pg7210_ACstatement.jsp";
	}
	
	//전표 입력
	// http://localhost:6080/ferp/insertACstatement.do
	@PostMapping("insertACstatement.do")
	public String r7210insertStatement(ACStatement acstmt) {
		service.r7210insertStatement(acstmt.getStatementNum(), acstmt.getStmtDate(),acstmt.getFrRegiNum(), acstmt.getStmtlist());
		return "redirect:/selectACstatement.do?stmtDate="+acstmt.getStmtDate();	//날짜만 적용.
	}

	@RequestMapping("selectACstatement.do")
	public String r7211selectACStatement(ACStatement acstmt,Model model) {
		model.addAttribute("stmtList",service.r7211selectACStatement(acstmt));
		return "WEB-INF\\headquarter\\pg7210_ACstatement.jsp";
	}
	
	@RequestMapping("updateACstatement.do")
	public String r7212updateACStatement(ACStatement acstmt) {
		service.r7212updateACStatement(acstmt.getStatementNum(), acstmt.getStmtDate(),acstmt.getFrRegiNum(), acstmt.getStmtlist());
		return "redirect:/selectACstatement.do?stmtDate="+acstmt.getStmtDate()+"&statementNum="+acstmt.getStatementNum();	
	}
	
	@RequestMapping("deleteACstatement.do")
	public String r7213deleteACStatement(ACStatement acstmt) {
		
		return "WEB-INF\\headquarter\\pg7210_ACstatement.jsp";
	}
	
	@GetMapping("statementList.do")
	public String r7204(Model model) {
		model.addAttribute("accountList", service.r7100SelectAccount(new Account(true)));
		
		return "WEB-INF\\headquarter\\pg7204_statementList.jsp";	
	}
	
	//거래내역 조회, 건별 조회
	@PostMapping("statementList.do")
	public String r7204selectStatementList(@ModelAttribute("stmt") ACStatement aCStatement,@RequestParam(value="howtosearch",required = false) int howtosearch,Model model) {
		model.addAttribute("accountList", service.r7100SelectAccount(new Account(true)));
		model.addAttribute("stmtList",service.r7204selectStatementList(aCStatement,howtosearch));
		return "WEB-INF\\headquarter\\pg7204_statementList.jsp";	
	}

	// http://localhost:6080/ferp/productOrderList.do
	@GetMapping("productOrderList.do")
	public String r9201() {
		return "WEB-INF\\headquarter\\pg9201_prodOrderList.jsp";
	}
	
	// http://localhost:6080/ferp/productOrderListJson.do
	@GetMapping("productOrderListJson.do")
	public String r9201selectProdOrder(Model model,ProdOrder prodOrder) {
		model.addAttribute("list",service.r9201select(prodOrder));
		return "pageJsonReport";
	}

	@CrossOrigin(origins = "*",allowedHeaders = "*")
	@GetMapping("selectActiveStoreJson.do")
	public String selectActiveStore(Model model) {
		model.addAttribute("storeList",service.selectActiveStore());
		return "pageJsonReport";
	}

}