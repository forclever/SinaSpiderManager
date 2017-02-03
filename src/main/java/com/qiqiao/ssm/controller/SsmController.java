package com.qiqiao.ssm.controller;

import java.io.IOException;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qiqiao.ssm.bpo.SsmService;
import com.qiqiao.ssm.dao.model.LoginResult;
import com.qiqiao.ssm.dao.model.SysUsers;

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
	
	class temp {
		public String suid;
		public String pwd;
		
		public String getSuid() {
			return suid;
		}
		public void setSuid(String suid) {
			this.suid = suid;
		}
		public String getPwd() {
			return pwd;
		}
		public void setPwd(String pwd) {
			this.pwd = pwd;
		}
	}
	
	@RequestMapping(value="cp", method=RequestMethod.POST)
	public @ResponseBody int changePassword(@RequestBody temp t) {
		int result = 0;
		if ((!t.suid.equals("")) && (!t.pwd.equals(""))) {
			result = ssmService.sysChangePassword(t.suid, t.pwd);
		}
		return result;
	}
	
}
