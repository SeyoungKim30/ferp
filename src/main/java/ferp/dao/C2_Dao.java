package ferp.dao;

import java.util.List;

import vo.Product;
import vo.ProductProdOrder;
import vo.ScheduleCalender;

public interface C2_Dao {
	
	// 매장 재고 조회
	public List<ProductProdOrder> r8101ProductList(ProductProdOrder sch);
	// 매장 재고 상세 페이지
	public Product r8101ProductInfo(String productNum);
	
	// 본사 재고 조회
	public List<ProductProdOrder> r8201ProductList(ProductProdOrder sch);
	// 본사 재고 상세 페이지
	public Product r8201ProductInfo(String productNum);	
	// 본사 재고 등록
	public void r8202ProductIns(Product ins);
	// 본사 재고 수정
	public void r8203ProductUpt(Product upt);
	
	// 발주 상태 콤보
	public List<String> orderStateCom();
	
	// 캘린더
	public List<ScheduleCalender> sclerkschd(String writer);
}
