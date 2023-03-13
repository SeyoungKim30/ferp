package ferp.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ferp.dao.C2_Dao;
import vo.ClerkSchedule;
import vo.Prod_order_stock;
import vo.Product;
import vo.ProductProdOrder;
import vo.ScheduleCalender;
import vo.Stock;
import vo.StoreClerk;

@Service
public class C2_Service {
	
	@Autowired(required=false)
	private C2_Dao dao;
	
	// 업로드할 경로 지정
	@Value("${upload2}")
	private String upload;
	
	// 자재 이미지 업로드
	public String upload(MultipartFile multipartfile) {
		String img = multipartfile.getOriginalFilename();
		if( img!=null && !img.equals("")) {
			File imgObj = new File(upload+img);
			try {
				multipartfile.transferTo(imgObj);
			} catch (IllegalStateException e) {
				System.out.println("파일업로드 예외1:"+e.getMessage());
			} catch (IOException e) {
				System.out.println("파일업로드 예외2:"+e.getMessage());
			}
		}
		return img;
	}
	
	// 본사/매장 재고 조회
	public List<ProductProdOrder> r8101ProductList(ProductProdOrder sch){
		if(sch.getStockDate()==null) sch.setStockDate("");
		if(sch.getProductNum()==null) sch.setProductNum("");
		if(sch.getCategory()==null) sch.setCategory("");
		if(sch.getProductName()==null) sch.setProductName("");
		if(sch.getOpposite()==null) sch.setOpposite("");
		return dao.r8101ProductList(sch);
	}
	
	// 본사/매장 재고 상세 페이지 
	public Product r8101ProductInfo(String productNum) {
		return dao.r8101ProductInfo(productNum);
	}
	
	// 본사/매장 재고 관리 조회
	public List<ProductProdOrder> r8204InoutList(ProductProdOrder sch){
		return dao.r8204InoutList(sch);
	}
	
	// 매장 재고 관리 등록
	public void r8103InoutIns(Stock ins) {
		dao.r8103InoutIns(ins);
	}
	
	// 매장 재고 관리 수정
	public String r8104InoutUpt(Stock upt) {
		dao.r8104InoutUpt(upt);	
		return upt.getProductNum();
	}
	
	// 매장 재고 관리 삭제
	public void r8105InoutDel(Stock del) {
		dao.r8105InoutDel(del);
	}
	
	// 본사 재고 등록
	public String r8202ProductIns(Product ins) {
		if( ins.getMultipartfile() != null) {
			String img = upload(ins.getMultipartfile());
			ins.setImg(img);
		}
		if( ins.getMultipartfile() == null ) {
			ins.setImg("");
		}
		dao.r8202ProductIns(ins);
		return ins.getProductNum();
	}
	
	// 본사 재고 수정
	public String r8203ProductUpt(Product upt) {
		dao.r8203ProductUpt(upt);	
		return upt.getProductNum();
	}
	
	// 자재 코드 콤보
	public List<Prod_order_stock> productNumCom(){
		return dao.productNumCom();
	}
	
	// 직원 번호 콤보
	public List<StoreClerk> clerkNumCom(){
		return dao.clerkNumCom();
	}
	
	// 직원스케줄 캘린더 등록	
	public void sclerkschdIns(ClerkSchedule ins) {
		dao.sclerkschdIns(ins);
	}
	
	// 직원스케줄 캘린더
	public List<ScheduleCalender> sclerkschd(String writer){
		return dao.sclerkschd(writer);
	}
	
	
}
