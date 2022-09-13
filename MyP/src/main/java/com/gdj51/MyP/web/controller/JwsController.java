package com.gdj51.MyP.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj51.MyP.web.dao.IACDao;

@Controller
public class JwsController {
	@Autowired IACDao iACDao;
	
	
	
}
