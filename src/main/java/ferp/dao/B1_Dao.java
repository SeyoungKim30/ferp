package ferp.dao;

import java.util.List;

import vo.Orders;
import vo.Store;

public interface B1_Dao {
	
	public int lastmonthAllSales(); //본사:지난달전체매장매출총액
	public List<Orders> SalesByStoreList(Orders sbsl);	//본사:전매장매출 전체조회
	
	public Orders StoreDetailInfo(String frRegiNum); //본사:매장정보상세조회
	public List<Orders> DetailSalesList(Orders dinfo); //본사:매장정보상세조회-매매액
	public List<Orders> DetailMenuList(Orders dinfo); //본사:매장정보상세조회-메뉴
	
	public List<Store> StoreOpenList(); //본사:전매장오픈시간조회
}
