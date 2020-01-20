package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import service.HonbobDetailService;

@Controller
public class HonbobController {
	
	@Autowired
	HonbobDetailService hbDetailService;
}
