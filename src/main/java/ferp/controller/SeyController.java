package ferp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SeyController {

	@RequestMapping("addAccount")
	public String r7201AddAccount(){
		
		return "WEB-INF\\headquarter\\pg7201_addAccount.jsp";
	}
}