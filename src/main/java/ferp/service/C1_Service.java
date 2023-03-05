package ferp.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ferp.dao.C1_Dao;
import vo.ACStatement;
import vo.Account;
import vo.ProdOrder;
import vo.Prod_order_stock_emp_store;
import vo.Store;

@Service
public class C1_Service {

	@Autowired
	C1_Dao dao;

	public List<Account> r7100SelectAccount(Account ac) {
		if(ac.getAcntNum()==null) {ac.setAcntNum("");}
		if(ac.getAcntTitle()==null) {ac.setAcntTitle("");}
		return dao.r7100SelectAccount(ac);
	}

	public int r7101insertAccount(Account ac) {
		return dao.r7101insertAccount(ac);
	}

	public int r7210insertStatement(String statementNum,String stmtDate,String frRegiNum,List<ACStatement> stmtlist) {
		int stmtcount=0;
		for (ACStatement stmt : stmtlist) {
			stmt.setStatementNum(statementNum);
			stmt.setStmtDate(stmtDate);
			stmt.setFrRegiNum(frRegiNum);
			stmtcount=+ dao.r7210insertStatement(stmt);
		}
		return stmtcount;
	}
	
	public int r7102updateAccountUsing(Account ac) {
		return dao.r7102updateAccountUsing(ac);
	}
	
	
	public List<ACStatement> r7211selectACStatement(ACStatement stmt) {
		if(stmt.getRronum()==null||stmt.getRronum().equals("")) {
			return dao.r7211selectACStatement(stmt);
		}else {
			return dao.r7211selectPrevNext(stmt);
		}
	}
	
	public int r7212updateACStatement(String statementNum,String stmtDate,String frRegiNum,List<ACStatement> stmtlist) {
		int stmtcount=0;
		for (ACStatement stmt : stmtlist) {
			stmt.setStatementNum(statementNum);
			stmt.setStmtDate(stmtDate);
			stmt.setFrRegiNum(frRegiNum);
			stmtcount=+ dao.r7212updateACStatement(stmt);
		}
		return stmtcount;
	}
	
	public List<ACStatement> r7204selectStatementList(ACStatement stmt,int howtosearch) {
		if(stmt.getStmtDate()==null||stmt.getStmtDate().equals("") ) {
			LocalDate now = LocalDate.now();
			stmt.setStmtDate(now+"");
		}
		if(stmt.getStmtDate2()==null||stmt.getStmtDate2().equals("")) {
			stmt.setStmtDate2(stmt.getStmtDate());
		}
		if(howtosearch==1) {
			return dao.r7204selectStatementList(stmt);
		}else {
			return dao.r7204selectStatementListByDate(stmt);
		}
	}
	
	public int r7213deleteACStatement(ACStatement acstmt) {
		return dao.r7213deleteACStatement(acstmt);
	}

	public List<Prod_order_stock_emp_store>r9201select(ProdOrder prodOrder){
		return dao.r9201select(prodOrder);
	}
	
	public int r9203updateOrderState(ProdOrder prodOrder) {
		return dao.r9203updateOrderState(prodOrder);
	}
	
	
	
	public List<Store> selectActiveStore(){
		return dao.selectActiveStore();
	}

	
	
}
