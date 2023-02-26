package ferp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ferp.dao.C2_Dao;
import vo.Product;
import vo.ProductProdOrder;

@Service
public class C2_Service {
	
	@Autowired(required=false)
	C2_Dao dao;
	
	public List<ProductProdOrder> r8101ProductList(ProductProdOrder sch){
		//if(sch.getStockDate()==null) sch.setStockDate(null);
		if(sch.getProductNum()==null) sch.setProductNum("");
		if(sch.getCategory()==null) sch.setCategory("");
		if(sch.getProductName()==null) sch.setProductName("");
		if(sch.getOpposite()==null) sch.setOpposite("");
		if(sch.getOrderState()==null) sch.setOrderState("");
		return dao.r8101ProductList(sch);
	}
	public List<ProductProdOrder> r8201ProductList(ProductProdOrder sch){
		if(sch.getProductNum()==null) sch.setProductNum("");
		if(sch.getCategory()==null) sch.setCategory("");
		if(sch.getProductName()==null) sch.setProductName("");
		if(sch.getOpposite()==null) sch.setOpposite("");
		if(sch.getOrderState()==null) sch.setOrderState("");
		return dao.r8201ProductList(sch);
	}
	public List<String> orderStateCom(){
		return dao.orderStateCom();
	}
	public Product r8201ProductInfo(String productNum) {
		return dao.r8201ProductInfo(productNum);
	}
	public void r8202ProductIns(Product ins) {
		dao.r8202ProductIns(ins);
	}
}
