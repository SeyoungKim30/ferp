package ferp.dao;

import java.util.List;

import vo.ClerkSchedule;
import vo.Prod_order_stock;
import vo.Product;
import vo.ProductProdOrder;
import vo.ScheduleCalender;
import vo.Stock;
import vo.StoreClerk;

public interface C2_Dao {
	
	// 본사/매장 재고 조회
	public List<ProductProdOrder> r8101ProductList(ProductProdOrder sch);
	// 본사/매장 재고 상세 페이지
	public Product r8101ProductInfo(String productNum);
	// 본사/매장 재고 관리 조회
	public List<ProductProdOrder> r8204InoutList(ProductProdOrder sch);
	// 매장 재고 관리 등록
	public void r8103InoutIns(Stock ins);
	// 매장 재고 관리 수정
	public void r8104InoutUpt(Stock upt);
	// 매장 재고 관리 삭제
	public void r8105InoutDel(Stock del);
	// 본사 재고 등록
	public void r8202ProductIns(Product ins);
	// 본사 재고 수정
	public void r8203ProductUpt(Product upt);
	// 자재 코드 콤보
	public List<Prod_order_stock> productNumCom();
	// 직원 번호 콤보
	public List<StoreClerk> clerkNumCom();
	// 직원스케줄 캘린더 등록
	public void sclerkschdIns(ClerkSchedule ins);
	// 직원스케줄 캘린더
	public List<ScheduleCalender> sclerkschd(String writer);
	
}
