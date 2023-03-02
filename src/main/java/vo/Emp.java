package vo;

public class Emp {
	private String empnum;
	private String pass;
	private String ename;
	private String dname;
	static String frRegiNum="9999999999";
	
	public Emp() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public static String getFrRegiNum() {
		return frRegiNum;
	}

	public static void setFrRegiNum(String frRegiNum) {
		Emp.frRegiNum = frRegiNum;
	}

	public String getEmpnum() {
		return empnum;
	}

	public void setEmpnum(String empnum) {
		this.empnum = empnum;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}
	
	
	
}
