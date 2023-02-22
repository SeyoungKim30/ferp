package ferp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ferp.dao.C1_Dao;
import vo.Account;

@Service
public class C1_Service {

	@Autowired
	C1_Dao dao;
	
	public List<Account> r7200SelectAccount(Account ac){
		
		return dao.r7200SelectAccount(ac);
	}
}
