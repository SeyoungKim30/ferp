package ferp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

import ferp.service.C1_Service;
import vo.Account;

@Controller
public class JsonController {

	@Autowired
	C1_Service service;
	
	@CrossOrigin(origins = "*",allowedHeaders = "*")
	@GetMapping("selectEmpListJson.do")
	public String selectEmpListJson(Model model) {
		//model.addAttribute();
		return "pageJsonReport";
	}
	
}
