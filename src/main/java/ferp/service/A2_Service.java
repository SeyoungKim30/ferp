package ferp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ferp.dao.A2_Dao;
import vo.ClerkFile;
import vo.DefectOrder;
import vo.Prod_ProdOrder;
import vo.Rq_Product;
import vo.SCPage;
import vo.StoreClerk;

@Service
public class A2_Service {
	
	@Autowired(required=false)
	private A2_Dao dao;
	
	private void pagination(SCPage sch) {
		sch.setCount(dao.totNum(sch));
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		sch.setPageCount(
				(int)Math.ceil(
				sch.getCount()/(double)sch.getPageSize())
				);
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		sch.setBlockSize(5);
		int blocknum = (int)Math.ceil(sch.getCurPage()/
					(double)sch.getBlockSize());
		int endBlock = blocknum*sch.getBlockSize();
		if(endBlock>sch.getPageCount()) {
			endBlock = sch.getPageCount();
		}
		sch.setEndBlock(endBlock);
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
	}
	
	public List<StoreClerk> storeClerkList(SCPage sch){
		if(sch.getClerkName() == null) sch.setClerkName("");
		if(sch.getFrRegiNum() == null) sch.setFrRegiNum("");
		if(sch.getPageSize()==0) {
			sch.setPageSize(5);
		}
		pagination(sch);
		return dao.storeClerkList(sch);
	}
	
	public void insStoreclerk(StoreClerk ins) {
		dao.insStoreclerk(ins);
	}
	
	public void uptStoreClerk(StoreClerk upt) {
		dao.uptStoreClerk(upt);
	}
	
	public void delStoreClerk(String clerkNum) {
		dao.delStoreClerk(clerkNum);
	}
	
	public List<StoreClerk> storeClerkPayList(SCPage sch){
		if(sch.getFrRegiNum() == null) sch.setFrRegiNum("");
		if(sch.getClerkName() == null) sch.setClerkName("");
		if(sch.getOrderDateMonth() == null) sch.setOrderDateMonth("");
		sch.setCount(dao.totNum(sch));
		if(sch.getPageSize()==0) {
			sch.setPageSize(10);
		}
		pagination(sch);
		return dao.storeClerkPayList(sch);
	}
	
	public List<Rq_Product> availProd(Rq_Product plist){
		if(plist.getProductName() == null) plist.setProductName("");
		if(plist.getFrRegiNum() == null) plist.setFrRegiNum("9999999999");
		return dao.availProd(plist);
	}
	public int clerkTot() {
		return dao.clerkTot();
	}
	public void prodOrderReq(Prod_ProdOrder ins) {
		dao.prodOrderReq(ins);
	}
	public List<Prod_ProdOrder> reqList(Prod_ProdOrder sch){
		if(sch.getProductName() == null) sch.setProductName("");
		if(sch.getCategory() == null) sch.setCategory("");
		if(sch.getDemander() == null) sch.setDemander("");
		if(sch.getOrderDateMonth() == null) sch.setOrderDateMonth("");
		return dao.reqList(sch);
	}
	public void uptReqList(Prod_ProdOrder upt) {
		dao.uptReqList(upt);
	}
	public void delReqList(Prod_ProdOrder del) {
		dao.delReqList(del);
	}
	public List<Rq_Product> cateCombo() {
		return dao.cateCombo();
	}
	public void clerkfileupl(ClerkFile upl) {
		if(upl.getFname() == null) upl.setFname("");
		if(upl.getClerkNum() == null) upl.setClerkNum("");
		if(upl.getFrRegiNum() == null) upl.setFrRegiNum("");
		dao.clerkfileupl(upl);
	}
	public List<ClerkFile> viewClerkFileInfo(ClerkFile sch){
		if(sch.getClerkNum() == null) sch.setClerkNum("");
		if(sch.getFrRegiNum() == null) sch.setFrRegiNum("");
		return dao.viewClerkFileInfo(sch);
	}
	public void clerkFileUpt(ClerkFile upt) {
		if(upt.getFname() == null) upt.setFname("");
		if(upt.getClerkNum() == null) upt.setClerkNum("");
		if(upt.getFrRegiNum() == null) upt.setFrRegiNum("");
		dao.clerkFileUpt(upt);
	}
	public void clerkFileDel(ClerkFile del) {
		dao.clerkFileDel(del);
	}
	public List<DefectOrder> viewDefectorder(DefectOrder sch){
		if(sch.getOrderNum() == null) sch.setOrderNum("");
		if(sch.getFrRegiNum() == null) sch.setFrRegiNum("");
		return dao.viewDefectorder(sch);
	}
}