package ferp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ferp.dao.B1_Dao;
import vo.Orders;

@Service
public class B1_Service {

	@Autowired(required=false)
	B1_Dao dao;
	
	
	//본사:매장별매출 전체조회
	public List<Orders> SalesByStoreList(Orders sbsl){
		return dao.SalesByStoreList(sbsl);
	}
	
	
}