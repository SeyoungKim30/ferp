package ferp.dao;

import java.util.List;

import vo.Rq_Product;
import vo.SCPage;
import vo.StoreClerk;

public interface A2_Dao {
	public List<StoreClerk> storeClerkList(SCPage sch);
	public void insStoreclerk(StoreClerk ins);
	public int totNum(SCPage sch);
	public void uptStoreClerk(StoreClerk upt);
	public void delStoreClerk(int clerkNum);
	public List<StoreClerk> storeClerkPayList(SCPage sch);
	public List<Rq_Product> availProd(Rq_Product plist);
}
