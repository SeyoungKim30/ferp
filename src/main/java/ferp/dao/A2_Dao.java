package ferp.dao;

import java.util.List;

import vo.ProdOrder;
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
	public void prodOrderReq(ProdOrder ins);
	public List<ProdOrder> reqList(ProdOrder sch);
	public void uptReqList(ProdOrder upt);
	public void delReqList(ProdOrder del);
}