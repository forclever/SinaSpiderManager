package com.qiqiao.ssm.bpo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qiqiao.ssm.dao.mapper.SinaUsersMapper;
import com.qiqiao.ssm.dao.model.SinaUsers;

@Service
public class SsmService {
	@Autowired
	private SinaUsersMapper sinaUserMapper;
	
	//for test
	public SinaUsers getUser(String uid) {
		return sinaUserMapper.selectByPrimaryKey(uid);
	}
	
}
