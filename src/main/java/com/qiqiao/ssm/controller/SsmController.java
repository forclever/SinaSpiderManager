package com.qiqiao.ssm.controller;

import java.io.IOException;
import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qiqiao.ssm.dao.model.ChPwdParam;
import com.qiqiao.ssm.dao.model.LoginResult;
import com.qiqiao.ssm.dao.model.ResultWithPageInfo;
import com.qiqiao.ssm.dao.model.SinaUsers;
import com.qiqiao.ssm.dao.model.SysLogs;
import com.qiqiao.ssm.dao.model.SysUsers;
import com.qiqiao.ssm.service.SsmService;

@Controller
public class SsmController {
	@Autowired
	private SsmService ssmService;

	public String BeanToJson(Object obj) throws IOException {  
		ObjectMapper objectMap = new ObjectMapper();			
		return objectMap.writeValueAsString(obj);
	} 
	
	@RequestMapping(value="test")
	public String test() {
		return "test";
	}
	
	/**************************************************************************
	 * 功能地址：index.do （GET）
	 * 功能说明：首页
	 * 输入参数: 无
	 * 输出结果：  无
	 * ************************************************************************/
	@RequestMapping(value="index")
	public String welcome(){
		return "index";
	}


	/**************************************************************************
	 * 功能地址： login.do （POST）
	 * 功能说明： 系统登录
	 * 输入参数: JSON， {"suid": "xxx", "pwd": "xxx"}, suid为用户代码，pwd为用户输入的密码
	 * 输出结果： JSON, {"LoginCode": n, "UserName": "xxx", "LoginMessage": "xxx"}
	 *        LoginCode 0:代表登录成功， 其它值与LoginMessage对应登录失败原因。
	 *        UserName为登录成功后用户名称
	 * 注：所有密码为明码，未加密处理。
	 * ************************************************************************/
	@RequestMapping(value="login", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public @ResponseBody String sysLogin(@RequestBody SysUsers sysUsers) throws IOException {

		LoginResult result = null;
		if (sysUsers != null) {
			result = ssmService.sysLogin(sysUsers.getSuid(), sysUsers.getPwd());
		}
		return BeanToJson(result);

	}
	
	/**************************************************************************
	 * 功能地址： cp.do （POST）
	 * 功能说明： 修改密码
	 * 输入参数: JSON， {"suid": "xxx", "pwd": "xxx"}，suid为需要修改的用户编码，pwd为新的密码值（明码）
	 * 输出结果： 整数值，1为修改成功。
	 * ************************************************************************/
	@RequestMapping(value="cp", method=RequestMethod.POST)
	public @ResponseBody int changePassword(@RequestBody ChPwdParam cpp) {
		int result = 0;
		if (cpp != null) {
			if ((!cpp.suid.equals("")) && (!cpp.pwd.equals(""))) {
				result = ssmService.sysChangePassword(cpp.suid, cpp.pwd);
			}
		}
		return result;
	}
	
	/**************************************************************************
	 * 功能地址：du.do?suid=xxx （POST）
	 * 功能说明：删除系统用户
	 * 输入参数: suid为用户ID
	 * 输出结果：无
	 * ************************************************************************/
	@RequestMapping(value="du", method=RequestMethod.POST)
	public void delSysUsers(@RequestParam String suid) throws IOException {
		if ((suid != null) && (!suid.isEmpty()))
			ssmService.deleteSysUser(suid);
	}
	
	/**************************************************************************
	 * 功能地址： usercount.do （GET）
	 * 功能说明： 获取微博用户总数
	 * 输入参数: 无
	 * 输出结果：整型，总数值
	 * ************************************************************************/
	@RequestMapping(value="usercount", method=RequestMethod.GET)
	public @ResponseBody int getUserCount() {		
		return ssmService.getTweetUserCount();
	}
	
	/**************************************************************************
	 * 功能地址：tweetcount.do （GET）
	 * 功能说明： 获取微博文章总数
	 * 输入参数: 无
	 * 输出结果：整型，总数值。
	 * ************************************************************************/
	@RequestMapping(value="tweetcount", method=RequestMethod.GET)
	public @ResponseBody int getTweetCount() {
		
		return ssmService.getTweetCount();
	}
	
	/**************************************************************************
	 * 功能地址：postbytime.do?startTime=yyyy-mm-dd&endTime=yyyy-mm-dd （GET）
	 * 功能说明： 获取时间段内微博文章列表
	 * 输入参数: startTime和endTime，两个参数都为必选
	 * 输出结果：微博文章数据JSON数组，字段参见tweets表
	 * ************************************************************************/
	@RequestMapping(value="postbytime", method=RequestMethod.GET, produces="application/text;charset=UTF-8")
	public @ResponseBody String getPostByTime(@RequestParam String startTime, @RequestParam String endTime) throws IOException {
		if ((startTime == null) || (endTime== null)) return "";
		return this.BeanToJson(ssmService.getPostByTime(startTime, endTime));
	}
	
	/**************************************************************************
	 * 功能地址：syslog.do?pagenum=n （GET）
	 * 功能说明： 获取某一页的日志数据，按UI原型固定每页10条
	 * 输入参数: pagenum整型从1开始，必选参数
	 * 输出结果：JSON对象，含三个字段：
	 *        resultList: 日志数据JSON数组，字段参见syslogs表
	 *        pageCount: 日志数据总页数
	 *        curPageNum: 与传入参数pagenum一致，表示当前返回数据所在的页数
	 * ************************************************************************/
	@RequestMapping(value="syslog", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	public @ResponseBody ResultWithPageInfo<SysLogs> getSysLogs(@RequestParam Integer pagenum) throws IOException {
		ResultWithPageInfo<SysLogs> result = new ResultWithPageInfo<SysLogs>();
		
		if ((pagenum != null) && (pagenum >0)) {
			result.resultList = ssmService.getSysLog(pagenum);
			result.pageCount = ssmService.getPageCount(SsmService.TABLE_SYSLOGS, -1);
			result.curPageNum = pagenum;
		}
		return result;
	}
	
	/**************************************************************************
	 * 功能地址：sysuser.do?pagenum=n （GET）
	 * 功能说明： 获取某一页的系统用户数据，按UI原型固定每页8条
	 * 输入参数: pagenum整型从1开始，必选参数
	 * 输出结果：同上
	 * ************************************************************************/
	@RequestMapping(value="sysuser", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	public @ResponseBody ResultWithPageInfo<SysUsers> getSysUsers(@RequestParam Integer pagenum) throws IOException {
		ResultWithPageInfo<SysUsers> result = new ResultWithPageInfo<SysUsers>();

		if ((pagenum != null) && (pagenum >0)) {
			result.resultList = ssmService.getSysUser(pagenum);
			result.curPageNum = pagenum;
			result.pageCount = ssmService.getPageCount(SsmService.TABLE_SYSUSERS, -1);
		}
		
		return result;
	}

	/**************************************************************************
	 * 功能地址：sinauser.do?pagenum=n&status=n （GET）
	 * 功能说明： 获取某一页的新浪微博用户数据，按UI原型固定每页8条
	 * 输入参数: pagenum整型从1开始，必选参数；
	 *        status整型，用户状态：1未使用，0已使用，-1为所有。可选参数，不设置时默认为-1
	 * 输出结果：同上
	 * ************************************************************************/
	@RequestMapping(value="sinauser", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	public @ResponseBody ResultWithPageInfo<SinaUsers> getSinaUsers(@RequestParam Integer pagenum, @RequestParam(required=false) Integer status) throws IOException {
		if (status == null) status = -1;
		ResultWithPageInfo<SinaUsers> result = new ResultWithPageInfo<SinaUsers>();

		if ((pagenum != null) && (pagenum >0)) {
			result.resultList = ssmService.getSinaUser(pagenum, status);
			result.curPageNum = pagenum;
			result.pageCount = ssmService.getPageCount(SsmService.TABLE_SINAUSERS, status);
		}
		return result;
	}
	
	
	/**************************************************************************
	 * 功能地址：start.do （GET）
	 * 功能说明： 启动爬虫程序
	 * 输入参数: 无
	 * 输出结果：整形值，0：启动失败，1：启动成功，2：爬虫程序已在运行中
	 * ************************************************************************/
	@RequestMapping(value="start", method=RequestMethod.GET)
	public @ResponseBody int startScrapy() throws IOException {
		int result = 0;
		if (ssmService.isScrapyRun()) {
			result =2;
		}
		else {
			Runtime rt = Runtime.getRuntime();
		    Process p = rt.exec(new String[] {"cmd", "/c", "start", "python"});
		    if (p != null) result = 1;
		}
		return result;
	}
	
	
}
