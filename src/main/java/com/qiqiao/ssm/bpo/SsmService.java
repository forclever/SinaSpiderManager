package com.qiqiao.ssm.bpo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qiqiao.ssm.dao.mapper.SinaUsersMapper;
import com.qiqiao.ssm.dao.mapper.SysUsersMapper;
import com.qiqiao.ssm.dao.model.LoginResult;
import com.qiqiao.ssm.dao.model.SysUsers;

@Service
public class SsmService {
	public final static int LOGIN_ERROR = -1;
	public final static int LOGIN_SUCCESS = 0;
	public final static int LOGIN_FAILURE_NOUSER = 1;
	public final static int LOGIN_FAILURE_ERRPWD = 2;
	
	@Autowired
	private SysUsersMapper sysUsersMapper;
	
	@Autowired
	private SinaUsersMapper sinaUserMapper;
	
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
	
	public int sysChangePassword(String suid, String pwd) {
		SysUsers user = new SysUsers();
		user.setSuid(suid);
		user.setPwd(pwd);
		return sysUsersMapper.updateByPrimaryKey(user);
	}
	
}
