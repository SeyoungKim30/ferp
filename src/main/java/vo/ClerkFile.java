package vo;

import org.springframework.web.multipart.MultipartFile;

public class ClerkFile {
	private String fname;
	private String regDate;
	private String uptDate;
	private String clerkNum;
	private String frRegiNum;
	private MultipartFile file;
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getUptDate() {
		return uptDate;
	}
	public void setUptDate(String uptDate) {
		this.uptDate = uptDate;
	}
	public String getClerkNum() {
		return clerkNum;
	}
	public void setClerkNum(String clerkNum) {
		this.clerkNum = clerkNum;
	}
	public String getFrRegiNum() {
		return frRegiNum;
	}
	public void setFrRegiNum(String frRegiNum) {
		this.frRegiNum = frRegiNum;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
}
