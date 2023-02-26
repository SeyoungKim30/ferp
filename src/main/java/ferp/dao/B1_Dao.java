package ferp.dao;

import java.util.List;

import vo.Orders;

public interface B1_Dao {
	public int lastmonthAllSales(); //본사:지난달전체매장매출총액
	public List<Orders> SalesByStoreList(Orders sbsl);	//본사:매장별매출 전체조회
}
