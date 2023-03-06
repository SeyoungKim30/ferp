package ferp.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ferp.dao.C2_Dao;
import vo.Product;
import vo.ProductProdOrder;

@Service
public class C2_Service {
	
	@Autowired(required=false)
	private C2_Dao dao;
	
	// 업로드할 경로 지정
	@Value("${upload2}")
	private String upload;
	
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
	
	// 매장 재고 조회
	public List<ProductProdOrder> r8101ProductList(ProductProdOrder sch){
		if(sch.getStockDate()==null) sch.setStockDate("");
		if(sch.getProductNum()==null) sch.setProductNum("");
		if(sch.getCategory()==null) sch.setCategory("");
		if(sch.getProductName()==null) sch.setProductName("");
		if(sch.getOpposite()==null) sch.setOpposite("");
		return dao.r8101ProductList(sch);
	}
	// 매장 재고 상세 페이지 
	public Product r8101ProductInfo(String productNum) {
		return dao.r8101ProductInfo(productNum);
	}
		
	// 본사 재고 조회
	public List<ProductProdOrder> r8201ProductList(ProductProdOrder sch){
		if(sch.getProductNum()==null) sch.setProductNum("");
		if(sch.getCategory()==null) sch.setCategory("");
		if(sch.getProductName()==null) sch.setProductName("");
		if(sch.getOpposite()==null) sch.setOpposite("");
		if(sch.getOrderState()==null) sch.setOrderState("");
		return dao.r8201ProductList(sch);
	}
	// 본사 재고 상세 페이지 
	public Product r8201ProductInfo(String productNum) {
		return dao.r8201ProductInfo(productNum);
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
		if( upload(upt.getMultipartfile())!=null && !upload(upt.getMultipartfile()).equals("")){
			String img = upload(upt.getMultipartfile());
			upt.setImg(img);
		}
		if(upt.getImg()==null) upt.setImg(null);
		dao.r8203ProductUpt(upt);	
		return upt.getProductNum();
	}
	
	// 발주 상태 콤보
	public List<String> orderStateCom(){
		return dao.orderStateCom();
	}
}
