package ferp.dao;

import java.util.List;

import vo.ClerkSchedule;
import vo.Store;
import vo.StoreClerk;

public interface A1_Dao {
	
	public Store storeLogin(Store st);
	
	public List<StoreClerk> getStoreClerk(String FrRegiNum);
	
	// 출근 등록
	public void addOnDay(ClerkSchedule inscs);
}
