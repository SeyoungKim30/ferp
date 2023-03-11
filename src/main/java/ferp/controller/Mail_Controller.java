package ferp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import ferp.service.Mail_Service;
import vo.Mail;
import vo.Store;

@Controller
public class Mail_Controller {
	
	@Autowired(required = false)
	Mail_Service service;
		

	@PostMapping("mailSend.do")
	public String mailSend(Mail mail,Model d) {
		d.addAttribute("msg",service.sendMail(mail));
		return "SY_lab.jsp";
	}
	
	@PostMapping("tempPassword.do")
	public String r1003tempPassword(Store store,Model d) {
		d.addAttribute("msg",service.r1003tempPassword(store));
		return "SY_lab.jsp";
	}
		

}
