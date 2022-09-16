<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 권한 팝업 -->
  <div class="close_i">
      <img src="${pageContext.request.contextPath}/resources/icons/close.png" alt="">
  </div>
  
  <form action="#" name="autorityForm" id="autorityForm" method="post">
  <input type="hidden" id="no2" name="no2"/>
  	 <div class="popup">
		  <div class="popup_left">
		      <div class="txt_title">회원정보</div>
		      
		      <table>
			      <colgroup>
			      	<col width="50">
			      	<col width="100">
			      </colgroup>
		    
		     	 <thead>
			      </thead>
		      </table>
		  </div>
		
		  <div class="popup_right">
		      <div class="txt_title">권한 선택</div>
		      <!-- db에서 불러오게 해야겠음 -->
		      <div id="autoBox"></div>
		      <select name="autoritySelectBox" class="autoritySelectBox" id="autoritySelectBox">
		      </select>
		  </div>
	  </div>
	  
	   <div class="btn_wrap">
		  <div class="empower_btn" id="empower_btn">권한부여</div>
	  </div>
  </form>
 
