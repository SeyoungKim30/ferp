package ferp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ferp.dao.C2_Dao;

@Service
public class C2_Service {
	
	@Autowired(required=false)
	C2_Dao dao;

}
