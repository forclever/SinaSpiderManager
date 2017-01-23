package com.qiqiao.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qiqiao.ssm.bpo.SsmService;
import com.qiqiao.ssm.dao.model.SinaUsers;

@Controller
public class SsmController {
	@Autowired
	private SsmService ssmService;

	@RequestMapping(value="getSysUser")
	public String getUser() {
		SinaUsers sinaUser = ssmService.getUser("18602701898");
		System.out.println(sinaUser.getPwd());
		return "index";
	}
}
