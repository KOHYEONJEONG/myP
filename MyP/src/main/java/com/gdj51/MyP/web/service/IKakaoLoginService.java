package com.gdj51.MyP.web.service;

import java.util.HashMap;

public interface IKakaoLoginService {

	String getAccessToken(String authorize_code) throws Exception;

	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable;

	public HashMap<String, String> getMapData(String sql, HashMap<String, String> params) throws Throwable;

	public void getLogout(String accessToken) throws Throwable;


}