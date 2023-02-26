package ferp.dao;

import java.util.List;

import vo.Product;

public interface C2_Dao {
	public List<Product> r8101ProductSch(Product sch);
	public List<Product> r8201ProductList(Product sch);
	public Product r8201ProductInfo(String productNum);	
	public void r8202ProductIns(Product ins);
}
