package ferp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ferp.dao.A1_Dao;
import vo.Store;

@Service
public class A1_Service {

	@Autowired
	private A1_Dao dao;
	
	public Store storeLogin(Store st) {
		if(st.getFrRegiNum()==null) st.setFrRegiNum("");
		if(st.getFrPass()==null) st.setFrPass("");
		return dao.storeLogin(st);
	}
}
