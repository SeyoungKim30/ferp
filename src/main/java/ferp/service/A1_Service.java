package ferp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ferp.dao.A1_Dao;
import vo.ClerkSchedule;
import vo.Emp;
import vo.Menu;
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
		if(emp.getEmpnum()==0) emp.setEmpnum(0);
		if(emp.getPass()==null) emp.setPass("");
		return dao.empLogin(emp);
	}
	
	public List<StoreClerk> getStoreClerk(String FrRegiNum){
		return dao.getStoreClerk(FrRegiNum);
	}
	
	//메뉴 불러오기
	public List<Menu> getMenuList(String FrRegiNum, String category){
		return dao.getMenuList(FrRegiNum, category);
	}
	
	// 출근 등록
	public void addOnDay(ClerkSchedule inscs) {
		dao.addOnDay(inscs);
	}
	
	// 퇴근 등록
	public void addOffTime(ClerkSchedule uptcs) {
		dao.addOffTime(uptcs);
	}
}