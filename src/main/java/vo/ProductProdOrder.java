package vo;

public class ProductProdOrder {
	private String productNum;
	private String category;
	private String productName;
	private String opposite;
	private int price;
	private String img;
	private String remark;
	private String orderNum;
	private String demander;	//본사가 사올때는 본사코드, 팔때는 가맹점번호
	private String supplier;	//본사가 팔때는 본사코드, 본사가 밖에서 사올때는 다른곳 사업자번호나 그런거
	private String orderDate;
	private int amount;
	private String paymentState;
	private String orderState;
	private String stockDate;
	public ProductProdOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductProdOrder(String productNum, String category, String productName, String opposite, int price,
			String img, String remark, String orderNum, String demander, String supplier, String orderDate, int amount,
			String paymentState, String orderState) {
		super();
		this.productNum = productNum;
		this.category = category;
		this.productName = productName;
		this.opposite = opposite;
		this.price = price;
		this.img = img;
		this.remark = remark;
		this.orderNum = orderNum;
		this.demander = demander;
		this.supplier = supplier;
		this.orderDate = orderDate;
		this.amount = amount;
		this.paymentState = paymentState;
		this.orderState = orderState;
	}
	public String getProductNum() {
		return productNum;
	}
	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getOpposite() {
		return opposite;
	}
	public void setOpposite(String opposite) {
		this.opposite = opposite;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getDemander() {
		return demander;
	}
	public void setDemander(String demander) {
		this.demander = demander;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getPaymentState() {
		return paymentState;
	}
	public void setPaymentState(String paymentState) {
		this.paymentState = paymentState;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	public String getStockDate() {
		return stockDate;
	}
	public void setStockDate(String stockDate) {
		this.stockDate = stockDate;
	}
	
	
}
