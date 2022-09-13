package com.gdj51.MyP.web.dao;

import java.util.HashMap;
import java.util.List;

public interface IACDao {
	
	//숫자 취득
	public int getIntData(String sql)throws Throwable;
	public int getIntData(String sql, HashMap<String,String> params)throws Throwable;
	
	//문자열 취득
	public String getStringData(String sql) throws Throwable;
	public String getStringData(String sql,
										HashMap<String,String> params) throws Throwable;
	
	//HashMap 취득
	public HashMap<String, String> getMapData(String sql) throws Throwable;
	public HashMap<String, String> getMapData(String sql, 
													HashMap<String,String> params) throws Throwable;
	
	//List 취득
	public List<HashMap<String, String>> getList(String sql) throws Throwable;
	public List<HashMap<String, String>> getList(String sql,
													HashMap<String,String> params) throws Throwable;
	
	//등록
	public int insert(String sql) throws Throwable;
	public int insert(String sql,HashMap<String,String> params) throws Throwable;
	
	//수정
	public int update(String sql) throws Throwable;
	public int update(String sql,HashMap<String,String> params) throws Throwable;
	
	//삭제
	public int delete(String sql) throws Throwable;
	public int delete(String sql,HashMap<String,String> params) throws Throwable;
	
	
	//관리자, 아이디 체크
	public int memberCheck(String string, HashMap<String, String> params) throws Throwable;
}
