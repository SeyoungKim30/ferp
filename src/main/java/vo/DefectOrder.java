package vo;

import org.springframework.web.multipart.MultipartFile;

public class DefectOrder { 
	private String defNum;
	private String orderNum;
	private String productNum;
	private String orderDate;
	private String applyDate;
	private String img;
	private String state;
	private String methods;
	private String frRegiNum;
	private String type;
	private String completeDate;
	private String productName;
	private String orderDateMonth;
	private String orderDateYear;
	private String category;
	private MultipartFile file;
	public String getDefNum() {
		return defNum;
	}
	public void setDefNum(String defNum) {
		this.defNum = defNum;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getProductNum() {
		return productNum;
	}
	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getMethods() {
		return methods;
	}
	public void setMethods(String methods) {
		this.methods = methods;
	}
	public String getFrRegiNum() {
		return frRegiNum;
	}
	public void setFrRegiNum(String frRegiNum) {
		this.frRegiNum = frRegiNum;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCompleteDate() {
		return completeDate;
	}
	public void setCompleteDate(String completeDate) {
		this.completeDate = completeDate;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getOrderDateMonth() {
		return orderDateMonth;
	}
	public void setOrderDateMonth(String orderDateMonth) {
		this.orderDateMonth = orderDateMonth;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getOrderDateYear() {
		return orderDateYear;
	}
	public void setOrderDateYear(String orderDateYear) {
		this.orderDateYear = orderDateYear;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
}
