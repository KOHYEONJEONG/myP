<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyP</title>
    <link rel="stylesheet" href="resources/css/main.css">
    <link rel="stylesheet" href="resources/css/font.css">
    <script src="resources/jquery/jquery-1.12.4.js"></script>
    <script src="resources/js/header.js"></script>
    <style>
/* .search_form1 {
  width: 200px;
  height: 35px;
  border: 1px solid #d7d7d7;
  margin-right: 5px;
  box-sizing: border-box;
}

.table_wrap .search_box .search_form1 input {
  width: 100%;
  height: 100%;
  border: 0;
  outline-color: #000;
  padding: 5px;
  box-sizing: border-box;
}

.table_wrap .search_box {
    position: relative;
    width: 800px;
    height: 100%;
    background-color: #fff;
    border: 0px; 
    display: flex;
    justify-content: right;
    align-items: end;
    box-sizing: border-box;
    margin-bottom: 20px;
}

.table_wrap .search_box .select {
    width: 110px;
    height: 35px;
    background-color: #f6f6f6;
    border: 1px solid #d7d7d7;
    cursor: pointer;
    margin-right: 5px;
    box-sizing: border-box;
}

.table_wrap .search_box .search_btn {
    width: 70px;
    height: 35px;
    border: 1px solid #e6e6e6;
    background: rgb(255,255,255);
    background: -moz-linear-gradient(top, rgba(255,255,255,1) 0%, rgba(229,229,229,1) 100%);
    background: -webkit-linear-gradient(top, rgba(255,255,255,1) 0%,rgba(229,229,229,1) 100%);
    background: linear-gradient(to bottom, rgba(255,255,255,1) 0%,rgba(229,229,229,1) 100%);
    font-size: 20px;
    text-align: center;
    box-sizing: border-box;
    text-align: center;
    font-size: 14px;
    line-height: 33px;
    cursor: pointer;
} */
    </style>
    <script src="./jquery/jquery-1.12.4.js"></script>
    <script src="./js/main.js"></script>
</head>
<body>
<c:import url="/header1"></c:import>
    <main>
      <div class="main_wrap">
        <div class="side_bar">
          <div class="title">주차장 안내</div>
          <div class="inner">
              <div class="on">공영 주차장 조회</div>
          </div> 
      </div>
      <div class="right_area">            
          <div class="table_wrap">
            <div class="search_box">
              <div class="select">
                  <select name="select_b" id="select_b">
                    <option value="all">구</option>
                    <option value="gu">강남구</option>
                    <option value="gu">강북구</option>
                    <option value="gu">강서구</option>
                </select>
              </div>
              <div class="select">
                <select name="select_b" id="select_b">
                  <option value="dong">동</option>
                  <option value="dong">개포동</option>
                  <option value="dong">논현동</option>
                  <option value="dong">도곡동</option>
              </select>
            </div>
              <div class="search_form">
                <input type="text" />
              </div>
              <div class="search_btn" >
                검색
              </div>
            </div>
            <table>
              <thead>
                <tr>
                  <th>no</th>
                  <th>주차장명</th>
                  <th>구</th>
                  <th>동</th>
                  <th>조회수</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>10</td>
                  <td>포이초교 공영주차장</td>
                  <td>강남구</td>
                  <td>개포동</td>
                  <td>50</td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td> </td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
              </tbody>
            </table>
              <!--페이징-->
              <div class="page_wrap">
                  <div class="page_nation">
                     <a class="arrow pprev" href="#"></a>
                     <a class="arrow prev" href="#"></a>
                     <a href="#" class="active">1</a>
                     <a href="#">2</a>
                     <a href="#">3</a>
                     <a href="#">4</a>
                     <a href="#">5</a>
                     <a href="#">6</a>
                     <a href="#">7</a>
                     <a href="#">8</a>
                     <a href="#">9</a>
                     <a href="#">10</a>
                     <a class="arrow next" href="#"></a>
                     <a class="arrow nnext" href="#"></a>
                  </div>
               </div>
          </div>
        </div>
      </div>
    </main>
	<c:import url="/footer"></c:import>
      <script src="./js/main.js"></script>
</body>
</html>