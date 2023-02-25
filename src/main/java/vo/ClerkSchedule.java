package vo;

import java.util.Date;

public class ClerkSchedule {
	private String FrRegiNum;
	private String clerkNum;
	private Date onDay;
	private Date offDay;
	
	public ClerkSchedule() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getFrRegiNum() {
		return FrRegiNum;
	}

	public void setFrRegiNum(String frRegiNum) {
		FrRegiNum = frRegiNum;
	}

	public String getClerkNum() {
		return clerkNum;
	}

	public void setClerkNum(String clerkNum) {
		this.clerkNum = clerkNum;
	}

	public Date getOnDay() {
		return onDay;
	}

	public void setOnDay(Date onDay) {
		this.onDay = onDay;
	}

	public Date getOffDay() {
		return offDay;
	}

	public void setOffDay(Date offDay) {
		this.offDay = offDay;
	}
	
	
	
}

