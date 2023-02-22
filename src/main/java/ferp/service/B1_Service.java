package ferp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ferp.dao.B1_Dao;

@Service
public class B1_Service {

	@Autowired
	B1_Dao dao;
	

}
