package ferp.dao;

import java.util.List;

import vo.ClerkSchedule;
import vo.Emp;
import vo.Menu;
import vo.Store;
import vo.StoreClerk;

public interface A1_Dao {
	
	public Store storeLogin(Store st);
	public Emp empLogin(Emp emp);
	
	public List<StoreClerk> getStoreClerk(String FrRegiNum);
	
	
	// 출근 등록
	public void addOnDay(ClerkSchedule inscs);
	
	// 퇴근 등록
	public void addOffTime(ClerkSchedule uptcs);
	
	
	// 각 가맹점 메뉴 리스트
	public List<Menu> getMenuList(String FrRegiNum, String category);
}
