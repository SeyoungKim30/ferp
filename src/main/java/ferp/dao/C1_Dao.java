package ferp.dao;

import java.util.List;

import vo.ACStatement;
import vo.Account;

public interface C1_Dao {
	
	public List<Account> r7100SelectAccount(Account ac);
	public int r7101insertAccount(Account ac);
	public int r7203insertStatement(ACStatement stmt);
	public List<ACStatement> r7211selectACStatement(ACStatement stmt);
	public int r7212updateACStatement(ACStatement acstmt);
	public int r7213deleteACStatement(ACStatement acstmt);
}
