package lingnan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/manage")
public class ManageController {
	
	@RequestMapping(value="/manageuser")
	public String manageuser(){
		return "manageuser";
	}
	@RequestMapping(value="/managebook")
	public String managebook(){
		return "managebook";
	}
	@RequestMapping(value="/manageroom")
	public String manageroom(){
		return "manageroom";
	}
	
	
	

}
