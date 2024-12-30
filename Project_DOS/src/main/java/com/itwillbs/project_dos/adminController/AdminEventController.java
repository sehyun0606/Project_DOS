package com.itwillbs.project_dos.adminController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminEventController {
	@GetMapping("AdminEvent")
	public String adminEvent() {
		return "admin/admin_event/admin_event";
	}
	
	
	@GetMapping("EventEdit")
	public String eventEdit() {
		return "admin/admin_event/event_edit";
	}
	
}
