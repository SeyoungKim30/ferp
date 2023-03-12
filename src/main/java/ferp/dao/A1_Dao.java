package ferp.dao;

import java.util.List;

import vo.ClerkSchedule;
import vo.Emp;
import vo.Menu;
import vo.Onsale;
import vo.Orders;
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
	public List<Menu> getMenuList(String FrRegiNum);
	public List<Menu> getMenuListCoffee(String FrRegiNum);
	public List<Menu> getMenuListEtc(String FrRegiNum);
	public List<Menu> getMenuListSmoothie(String FrRegiNum);
	public List<Menu> getMenuListSandwich(String FrRegiNum);
	public List<Menu> getMenuListCake(String FrRegiNum);
	
	// 판매할 메뉴 등록
	public void insOnsale(Onsale ins);
	
	// 본사 제공 전체 메뉴
	public List<Menu> getAllMenu(Menu sch);
	
	public int totCnt();
	
	// orders 추가 dao
	public void insertOrdersList(Orders ins);
	// orderNum 가져오기
	public String getOrderNum();
}
