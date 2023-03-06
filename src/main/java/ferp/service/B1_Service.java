package ferp.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ferp.dao.B1_Dao;
import vo.Orders;
import vo.Store;

@Service
public class B1_Service {

	@Autowired(required=false)
	private B1_Dao dao;
	
	//본사:지난달전체매장매출총액
	public int lastmonthAllSales() {
		return dao.lastmonthAllSales();
	}
	//본사:매장별매출 전체조회
	public List<Orders> SalesByStoreList(Orders sbsl){
		
		if(sbsl.getFrSchOrderdt()==null) {
			// 서비스에서 if문써서 자바데이트로 넣기 
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM");
		    Calendar cal = Calendar.getInstance();
		    cal.add(Calendar.MONTH, -1);
		    sbsl.setFrSchOrderdt(formatter.format(cal.getTime()));
		    sbsl.setToSchOrderdt(formatter.format(cal.getTime()));
		}
		return dao.SalesByStoreList(sbsl);
	}
	
	
	//본사:특정매장정보
	public Orders StoreDetailInfo(String frRegiNum){
		return dao.StoreDetailInfo(frRegiNum);
	}
	//본사:특정매장정보조회JSON
	public Map<String, Object> multipleJson(Orders dlist){
		
		Map<String, Object> jsonMap = new HashMap<>();		
		//본사:특정매장매출조회JSON
		jsonMap.put("detailSales", dao.DetailSalesList(dlist));
		// 본사:특정매장메뉴매출조회JSON
		jsonMap.put("detailMenu", dao.DetailMenuList(dlist));
		
		return jsonMap;
	}
	
	
	//본사:전매장오픈시간조회
	public List<Store> StoreOpenList() {
		return dao.StoreOpenList();
	}
	
	
	
}
