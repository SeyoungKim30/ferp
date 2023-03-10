package ferp.dao;

import java.util.List;

import vo.OpenTimeCalender;
import vo.Orders;
import vo.Store;

public interface B1_Dao {
	
	//매장정보조회
	public int lastmonthAllSales(); //본사:지난달전체매장매출총액
	public List<Orders> salesByStoreList(Orders sbsl);	//본사:전매장매출-전체조회
	
	public Orders storeDetailInfo(String frRegiNum); //본사:매장정보상세조회
	public List<Orders> detailSalesList(Orders dinfo); //본사:매장정보상세조회-매매액
	public List<Orders> detailMenuList(Orders dinfo); //본사:매장정보상세조회-메뉴
	
	//매장오픈점검
	public List<Store> storeOpenList(Store otl); //본사:전매장오픈시간-전체조회
	
	public OpenTimeCalender storeDetailOpenTime(String writer); //본사:매장오픈상세조회
	public List<OpenTimeCalender> openTimeDetailCalendar(OpenTimeCalender otcd); //본사:매장오픈상세조회-캘린더
}
