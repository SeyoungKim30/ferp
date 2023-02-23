package ferp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ferp.dao.C2_Dao;
import vo.Product;

@Service
public class C2_Service {
	
	@Autowired(required=false)
	C2_Dao dao;
	
	public List<Product> r8101ProductSch(Product sch){
		
		return dao.r8101ProductSch(sch);
	}
}
