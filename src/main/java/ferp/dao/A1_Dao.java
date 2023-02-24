package ferp.dao;

import java.util.List;

import vo.Store;
import vo.StoreClerk;

public interface A1_Dao {
	
	public Store storeLogin(Store st);
	
	public List<StoreClerk> getStoreClerk(String FrRegiNum);
}
