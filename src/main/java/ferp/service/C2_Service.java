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
	
	public List<Product> r8201ProductSch(Product sch){
		if(sch.getProductNum()==null) sch.setProductNum("");
		if(sch.getCategory()==null) sch.setCategory("");
		if(sch.getProductName()==null) sch.setProductName("");
		if(sch.getOpposite()==null) sch.setOpposite("");
		if(sch.getRemark()==null) sch.setRemark("");
		return dao.r8201ProductSch(sch);
	}
}