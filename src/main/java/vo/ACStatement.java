package vo;

import java.util.List;

public class ACStatement {

	private String statementNum;
	private String frRegiNum;
	private String acntNum;
	private int debit ;
	private int credit ;
	private String stmtOpposite;
	private String stmtDate;
	private String remark;
	private boolean first;	//전표의 첫번째
	
	private List<ACStatement> stmtlist;
	
	
	public ACStatement() {	}
	
	public ACStatement(String acntNum) {
		this.acntNum=acntNum;
	}
	
	public ACStatement(String statementNum, String frRegiNum, String acntNum, int debit, int credit,
			String stmtOpposite, String stmtDate, String remark, boolean first) {
		super();
		this.statementNum = statementNum;
		this.frRegiNum = frRegiNum;
		this.acntNum = acntNum;
		this.debit = debit;
		this.credit = credit;
		this.stmtOpposite = stmtOpposite;
		this.stmtDate = stmtDate;
		this.remark = remark;
		this.first = first;
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

	public boolean isFirst() {
		return first;
	}

	public void setFirst(boolean first) {
		this.first = first;
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
