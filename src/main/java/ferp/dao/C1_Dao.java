package ferp.dao;

import java.util.List;

import vo.ACStatement;
import vo.Account;
import vo.Prod_order_stock_emp_store;
import vo.Store;

public interface C1_Dao {
	
	public List<Account> r7100SelectAccount(Account ac);
	public int r7101insertAccount(Account ac);
	public int r7210insertStatement(ACStatement stmt);
	public List<ACStatement> r7211selectACStatement(ACStatement stmt);
	public int r7212updateACStatement(ACStatement acstmt);
	public int r7213deleteACStatement(ACStatement acstmt);
	
	//거래내역,계정별 목록 조회
	//건별(모든내용)
	public List<ACStatement> r7204selectStatementList(ACStatement stmt);
	public List<ACStatement> r7204selectStatementListByDate(ACStatement stmt);
	
	public List<Prod_order_stock_emp_store>r9201select(Prod_order_stock_emp_store poses);
	
	//모든 store 리스트
	public List<Store> selectActiveStore();
}
