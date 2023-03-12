package ferp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ferp.dao.A1_Dao;
import vo.ClerkSchedule;
import vo.Emp;
import vo.Menu;
import vo.Onsale;
import vo.Orders;
import vo.Store;
import vo.StoreClerk;

@Service
public class A1_Service {

	@Autowired(required = false)
	private A1_Dao dao;
	
	public Store storeLogin(Store st) {
		if(st.getFrRegiNum()==null) st.setFrRegiNum("");
		if(st.getFrPass()==null) st.setFrPass("");
		return dao.storeLogin(st);
	}
	
	public Emp empLogin(Emp emp) {
		if(emp.getEmpnum()==null) emp.setEmpnum("");
		if(emp.getPass()==null) emp.setPass("");
		return dao.empLogin(emp);
	}
	
	public List<StoreClerk> getStoreClerk(String FrRegiNum){
		return dao.getStoreClerk(FrRegiNum);
	}
	
	//메뉴 불러오기
	public List<Menu> getMenuList(String FrRegiNum){
		return dao.getMenuList(FrRegiNum);
	}
	public List<Menu> getMenuListCoffee(String FrRegiNum){
		return dao.getMenuListCoffee(FrRegiNum);
	}
	public List<Menu> getMenuListSmoothie(String FrRegiNum){
		return dao.getMenuListSmoothie(FrRegiNum);
	}
	public List<Menu> getMenuListEtc(String FrRegiNum){
		return dao.getMenuListEtc(FrRegiNum);
	}
	public List<Menu> getMenuListCake(String FrRegiNum){
		return dao.getMenuListCake(FrRegiNum);
	}
	public List<Menu> getMenuListSandwich(String FrRegiNum){
		return dao.getMenuListSandwich(FrRegiNum);
	}
	
	// 출근 등록
	public void addOnDay(ClerkSchedule inscs) {
		dao.addOnDay(inscs);
	}
	
	// 퇴근 등록
	public void addOffTime(ClerkSchedule uptcs) {
		dao.addOffTime(uptcs);
	}
	
	// 판매할 메뉴 등록
	public void insOnsale(Onsale ins) {
		dao.insOnsale(ins);
	}
	
	// 판매 메뉴 삭제
	public void delOnsale(Onsale del) {
		dao.delOnsale(del);
	}
	
	// 본사 제공 전체 메뉴
	public List<Menu> getAllMenu(Menu sch){
		if(sch.getMenuName()==null) sch.setMenuName("");
		return dao.getAllMenu(sch);
	}
	
	
	// orders ins
    public void insertOrdersList(
    		String[] menuNum,
			String[] frRegiNum,
			int[] amount,
			int[] payprice,
			String[] orderOption
    		) {
    	System.out.println(menuNum[0]);
    	int totCnt = dao.totCnt();
    	for(int i=0;i<menuNum.length;i++) {
    		System.out.println(menuNum[i]);
    		Orders ins = new Orders();
    		ins.setTotCnt(totCnt);
        	ins.setAmount(amount[i]); ins.setFrRegiNum(frRegiNum[i]);
    		ins.setMenuNum(menuNum[i]); ins.setPayprice(payprice[i]);
    		ins.setOrderOption(orderOption[i]);
            dao.insertOrdersList(ins);
    	}
    	
 
    	
    }
	
    // maxOrderNum
    public String getMaxOrderNum() {
    	return dao.getMaxOrderNum();
    }
    
    public List<Orders> getPayPrice(Orders order){
    	return dao.getPayPrice(order);
    }
    
 // 결제대기에서 제조대기로
 	public void uptOrderStatePay(String orderNum) {
 		dao.uptOrderStatePay(orderNum);
 	}
 	
 	// 제조 대기 리스트
 	public List<Orders> getStandByList(Orders orders){
 		return dao.getStandByList(orders);
 	}
    
}
