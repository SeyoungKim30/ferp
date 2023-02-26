package ferp.dao;

import java.util.List;

import vo.Product;
import vo.ProductProdOrder;

public interface C2_Dao {
	public List<ProductProdOrder> r8101ProductList(ProductProdOrder sch);
	public List<ProductProdOrder> r8201ProductList(ProductProdOrder sch);
	public List<String> orderStateCom();
	public Product r8201ProductInfo(String productNum);	
	public void r8202ProductIns(Product ins);
}
