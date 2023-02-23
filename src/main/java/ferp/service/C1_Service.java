package ferp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ferp.dao.C1_Dao;
import vo.ACStatement;
import vo.Account;

@Service
public class C1_Service {

	@Autowired
	C1_Dao dao;

	public List<Account> r7200SelectAccount(Account ac) {
		if(ac.getAcntNum()==null) {ac.setAcntNum("");}
		if(ac.getAcntTitle()==null) {ac.setAcntTitle("");}
		return dao.r7200SelectAccount(ac);
	}

	public int r7201insertAccount(Account ac) {
		return dao.r7201insertAccount(ac);
	}

	public int r7203insertStatement(String statementNum,String stmtDate,String frRegiNum,List<ACStatement> stmtlist) {
		System.out.println("서비스~~~~~~~~~~~~~~~~~~~~~"+statementNum);
		int stmtcount=0;
		for (ACStatement stmt : stmtlist) {
			if(stmtcount==0) {
				stmt.setFirst(true);
			}else {
				stmt.setFirst(false);
			}
			stmt.setStatementNum(statementNum);
			stmt.setStmtDate(stmtDate);
			stmt.setFrRegiNum(frRegiNum);
			stmtcount=+ dao.r7203insertStatement(stmt);
		}
		return stmtcount;
	}
}
