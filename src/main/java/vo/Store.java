package vo;

public class Store {
	private String frRegiNum;
	private int empNum;
	private String frName;
	private String frOpen;
	private String frOperTime;
	private String frClosedDte;
	private String frRepName;
	private String frTel;
	private String frAddress;
	private String frPass;
	public Store() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Store(String frRegiNum, int empNum, String frName, String frOpen, String frOperTime, String frClosedDte,
			String frRepName, String frTel, String frAddress, String frPass) {
		super();
		this.frRegiNum = frRegiNum;
		this.empNum = empNum;
		this.frName = frName;
		this.frOpen = frOpen;
		this.frOperTime = frOperTime;
		this.frClosedDte = frClosedDte;
		this.frRepName = frRepName;
		this.frTel = frTel;
		this.frAddress = frAddress;
		this.frPass = frPass;
	}
	public String getFrRegiNum() {
		return frRegiNum;
	}
	public void setFrRegiNum(String frRegiNum) {
		this.frRegiNum = frRegiNum;
	}
	public int getEmpNum() {
		return empNum;
	}
	public void setEmpNum(int empNum) {
		this.empNum = empNum;
	}
	public String getFrName() {
		return frName;
	}
	public void setFrName(String frName) {
		this.frName = frName;
	}
	public String getFrOpen() {
		return frOpen;
	}
	public void setFrOpen(String frOpen) {
		this.frOpen = frOpen;
	}
	public String getFrOperTime() {
		return frOperTime;
	}
	public void setFrOperTime(String frOperTime) {
		this.frOperTime = frOperTime;
	}
	public String getFrClosedDte() {
		return frClosedDte;
	}
	public void setFrClosedDte(String frClosedDte) {
		this.frClosedDte = frClosedDte;
	}
	public String getFrRepName() {
		return frRepName;
	}
	public void setFrRepName(String frRepName) {
		this.frRepName = frRepName;
	}
	public String getFrTel() {
		return frTel;
	}
	public void setFrTel(String frTel) {
		this.frTel = frTel;
	}
	public String getFrAddress() {
		return frAddress;
	}
	public void setFrAddress(String frAddress) {
		this.frAddress = frAddress;
	}
	public String getFrPass() {
		return frPass;
	}
	public void setFrPass(String frPass) {
		this.frPass = frPass;
	}
	
}
