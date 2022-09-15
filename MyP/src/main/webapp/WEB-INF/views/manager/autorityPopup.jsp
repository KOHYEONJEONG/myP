<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 권한 팝업 -->
  <div class="close_i">
      <img src="${pageContext.request.contextPath}/resources/icons/close.png" alt="">
  </div>
  
  <form>
  	 <div class="popup">
		  <div class="popup_left">
		      <div class="txt_title">대상</div>
		      <textarea></textarea>
		  </div>
		
		  <div class="popup_right">
		      <div class="txt_title">권한 선택</div>
		      <select name="autoritySelectBox" class="autoritySelectBox" id="autoritySelectBox">
		      	<option value="1">관리자</option>
		      	<option value="2">회원</option>
		      	<option value="3">개발자</option>
		      </select>
		     
		  </div>
	  </div>
  </form>
  
  <div class="empower_btn" id="empower_btn">권한부여</div>
 
