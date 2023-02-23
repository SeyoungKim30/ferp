package vo;

public class ProdOrder {
	private String orderNum;
	private String productNum;
	private String demander;	//본사가 사올때는 본사코드, 팔때는 가맹점번호
	private String supplier;	//본사가 팔때는 본사코드, 본사가 밖에서 사올때는 다른곳 사업자번호나 그런거
	private String orderDate;
	private int amount;
	private String paymentState;
	private String orderState;
}
