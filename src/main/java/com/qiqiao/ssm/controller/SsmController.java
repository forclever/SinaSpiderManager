package com.qiqiao.ssm.controller;

import java.io.IOException;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qiqiao.ssm.dao.model.LoginResult;
import com.qiqiao.ssm.dao.model.SysUsers;
import com.qiqiao.ssm.service.SsmService;
import com.qiqiao.ssm.dao.model.ChPwdParam;

@Controller
public class SsmController {
	@Autowired
	private SsmService ssmService;

	public String BeanToJson(Object obj) throws IOException {  
		ObjectMapper objectMap = new ObjectMapper();			
		return objectMap.writeValueAsString(obj);
	} 
	
	@RequestMapping(value="index")
	public String welcome(){
		return "index";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST, produces="application/text;charset=UTF-8")
	public @ResponseBody String sysLogin(@RequestBody SysUsers sysUsers) throws IOException {

		LoginResult result = null;
		if (sysUsers != null) {
			result = ssmService.sysLogin(sysUsers.getSuid(), sysUsers.getPwd());
		}
		return BeanToJson(result);

	}
	
	@RequestMapping(value="cp", method=RequestMethod.POST)
	public @ResponseBody int changePassword(@RequestBody ChPwdParam cpp) {
		int result = 0;
		if ((!cpp.suid.equals("")) && (!cpp.pwd.equals(""))) {
			result = ssmService.sysChangePassword(cpp.suid, cpp.pwd);
		}
		return result;
	}
	
}
