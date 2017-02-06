package com.qiqiao.ssm.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qiqiao.ssm.dao.mapper.SinaUsersMapper;
import com.qiqiao.ssm.dao.mapper.SysLogsMapper;
import com.qiqiao.ssm.dao.mapper.SysUsersMapper;
import com.qiqiao.ssm.dao.mapper.TweetUsersMapper;
import com.qiqiao.ssm.dao.mapper.TweetsMapper;
import com.qiqiao.ssm.dao.model.LoginResult;
import com.qiqiao.ssm.dao.model.SinaUsers;
import com.qiqiao.ssm.dao.model.SysLogs;
import com.qiqiao.ssm.dao.model.SysUsers;
import com.qiqiao.ssm.dao.model.Tweets;

@Service
public class SsmService {
	public final static int LOGIN_ERROR = -1;
	public final static int LOGIN_SUCCESS = 0;
	public final static int LOGIN_FAILURE_NOUSER = 1;
	public final static int LOGIN_FAILURE_ERRPWD = 2;
	
	@Autowired
	private SysUsersMapper sysUsersMapper;
	
	@Autowired
	private TweetsMapper tweetsMapper;
	
	@Autowired
	private TweetUsersMapper tweetUsersMapper;
	
	@Autowired
	private SysLogsMapper sysLogsMapper;
	
	@Autowired
	private SinaUsersMapper sinaUsersMapper;
	
	//系统用户登录校验过程
	public LoginResult sysLogin(String suid, String Pwd) {
		LoginResult loginResult = new LoginResult();
		int retCode = SsmService.LOGIN_ERROR;
		SysUsers sysUsers = sysUsersMapper.selectByPrimaryKey(suid);
		if (sysUsers != null) {
			String sPwd = sysUsers.getPwd();
			if (Pwd.equals(sPwd)) {
				retCode = SsmService.LOGIN_SUCCESS;
				loginResult.UserName = sysUsers.getSuname();
			}
			else {
				retCode = SsmService.LOGIN_FAILURE_ERRPWD;
			}
		}
		else {
			retCode = SsmService.LOGIN_FAILURE_NOUSER;
		}
		loginResult.LoginCode = retCode;
		loginResult.LoginMessage = this.getLoginErrorMessage(retCode);
		return loginResult;
	}
	
	private String getLoginErrorMessage(int code) {
		String result = "未知错误";
		switch(code) {
			case SsmService.LOGIN_SUCCESS:
				result = "登录成功";
				break;
			case SsmService.LOGIN_FAILURE_ERRPWD:
				result = "登录密码错误";
				break;
			case SsmService.LOGIN_FAILURE_NOUSER:
				result = "登录用户不存在";
				break;
		}
		return result;
	}
	
	//修改系统用户密码
	public int sysChangePassword(String suid, String pwd) {
		SysUsers user = new SysUsers();
		user.setSuid(suid);
		user.setPwd(pwd);
		return sysUsersMapper.updateByPrimaryKeySelective(user);
	}
	
	//获取用户总数量
	public int getUserCount() {
		return tweetUsersMapper.selectCount();
	}
	
	//获取博文总数量
	public int getTweetCount() {
		return tweetsMapper.selectCount();
	}
	
	//获取时间段内博文记录
	public List<Tweets> getPostByTime(String startTime, String endTime) {
		return tweetsMapper.selectByTime(startTime, endTime);
	}
	
	//获取系统日志，pagenum，页数，从1开始
	public List<SysLogs> getSysLog(int pagenum) {
		List<SysLogs> result = null;
		if (pagenum > 0)
			result = sysLogsMapper.selectByRowBounds((pagenum -1) * 10);
		return result;
	}
	
	//获取系统用户
	public List<SysUsers> getSysUser(int pagenum) {
		List<SysUsers> result = null;
		if (pagenum > 0)
			result = sysUsersMapper.selectByRowBounds((pagenum -1) * 8);
		return result;
	}
	
	//删除系统用户
	public void deleteSysUser(String suid) {
		sysUsersMapper.deleteByPrimaryKey(suid);
	}
	
	//status： 1未使用，0已使用，-1参数忽略
	public List<SinaUsers> getSinaUser(int pagenum, int status) {
		return sinaUsersMapper.selectByRowBounds((pagenum -1) * 8, status);
	}
	
	public boolean isScrapyRun() throws IOException {
		boolean result = false;
		final String python = "python.exe";
		Process process = null;

		Runtime rt = Runtime.getRuntime();
		process = rt.exec(new String[] {"cmd", "/c", "tasklist"});			

		
		BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
		String pLine = null;

		while((pLine = br.readLine()) != null) {
			if (pLine.toLowerCase().contains(python)) {
				result = true;
				break;
			}
		}		

		return result;
	}
}
