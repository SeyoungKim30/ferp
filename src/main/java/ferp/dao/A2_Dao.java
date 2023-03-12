package ferp.dao;

import java.util.List;

import vo.ClerkFile;
import vo.DefectOrder;
import vo.Prod_ProdOrder;
import vo.Rq_Product;
import vo.SCPage;
import vo.StoreClerk;

public interface A2_Dao {
	public List<StoreClerk> storeClerkList(SCPage sch);
	public void insStoreclerk(StoreClerk ins);
	public int totNum(SCPage sch);
	public void uptStoreClerk(StoreClerk upt);
	public void delStoreClerk(String clerkNum);
	public List<StoreClerk> storeClerkPayList(SCPage sch);
	public List<Rq_Product> availProd(Rq_Product plist);
	public int clerkTot();
	public void prodOrderReq(Prod_ProdOrder ins);
	public List<Prod_ProdOrder> reqList(Prod_ProdOrder sch);
	public void uptReqList(Prod_ProdOrder upt);
	public void delReqList(Prod_ProdOrder del);
	public List<Rq_Product> cateCombo();
	public void clerkfileupl(ClerkFile upl);
	public List<ClerkFile> viewClerkFileInfo(ClerkFile sch);
	public void clerkFileUpt(ClerkFile upt);
	public void clerkFileDel(ClerkFile del);
	public List<DefectOrder> viewDefectorder(DefectOrder sch);
}