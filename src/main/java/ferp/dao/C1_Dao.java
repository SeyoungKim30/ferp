package ferp.dao;

import java.util.List;

import vo.ACStatement;
import vo.Account;

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
}
