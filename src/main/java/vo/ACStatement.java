package vo;

import java.util.List;

public class ACStatement {

	private String statementNum;
	private String frRegiNum;
	private int lineNum;
	private String acntNum;
	private int debit ;
	private int credit ;
	private String stmtOpposite;
	private String stmtDate;
	private String stmtDate2;
	private String remark;
	
	private List<ACStatement> stmtlist;
	
	
	public ACStatement() {	}
	
	public ACStatement(String acntNum) {
		this.acntNum=acntNum;
	}

	public ACStatement(String statementNum, String frRegiNum, int lineNum, String acntNum, int debit, int credit,
			String stmtOpposite, String stmtDate, String remark,  List<ACStatement> stmtlist) {
		super();
		this.statementNum = statementNum;
		this.frRegiNum = frRegiNum;
		this.lineNum = lineNum;
		this.acntNum = acntNum;
		this.debit = debit;
		this.credit = credit;
		this.stmtOpposite = stmtOpposite;
		this.stmtDate = stmtDate;
		this.remark = remark;
		this.stmtlist = stmtlist;
	}

	
	public String getStmtDate2() {
		return stmtDate2;
	}

	public void setStmtDate2(String stmtDate2) {
		this.stmtDate2 = stmtDate2;
	}

	public int getLineNum() {
		return lineNum;
	}

	public void setLineNum(int lineNum) {
		this.lineNum = lineNum;
	}

	public List<ACStatement> getStmtlist() {
		return stmtlist;
	}

	public void setStmtlist(List<ACStatement> stmtlist) {
		this.stmtlist = stmtlist;
	}

	public int getDebit() {
		return debit;
	}

	public void setDebit(int debit) {
		this.debit = debit;
	}

	public String getStatementNum() {
		return statementNum;
	}
	public void setStatementNum(String statementNum) {
		this.statementNum = statementNum;
	}
	public String getFrRegiNum() {
		return frRegiNum;
	}
	public void setFrRegiNum(String frRegiNum) {
		this.frRegiNum = frRegiNum;
	}
	public String getAcntNum() {
		return acntNum;
	}
	public void setAcntNum(String acntNum) {
		this.acntNum = acntNum;
	}

	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public String getStmtOpposite() {
		return stmtOpposite;
	}
	public void setStmtOpposite(String stmtOpposite) {
		this.stmtOpposite = stmtOpposite;
	}
	public String getStmtDate() {
		return stmtDate;
	}
	public void setStmtDate(String stmtDate) {
		this.stmtDate = stmtDate;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	
	
}
