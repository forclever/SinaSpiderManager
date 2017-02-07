package com.qiqiao.ssm.dao.model;

import java.util.List;

public class ResultWithPageInfo<T extends Object> {
	
	public List<T> resultList; 
	
	public int pageCount;
	
	public int curPageNum;
}
