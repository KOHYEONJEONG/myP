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
    <script src="./jquery/jquery-1.12.4.js"></script>
    <script src="./js/main.js"></script>
</head>
<body>
  <c:import url="/header1"></c:import>
      <main>
        <div class="main_wrap">
          <div class="side_bar">
            <div class="title">랭킹</div>
            <div class="inner">
                <div class="on">시스템 좋은 주차장</div>
                <div>요금 합리적인 주차장</div>
            </div> 
        </div>
        <div class="right_area">            
            <div class="table_wrap">
                <div class="ranking_area">
                    <div class="ranking_box">
                      <div class="icon gold"></div>
                      <div class="photo">
                          <img src="./img/1.png" alt="" width="100%">
                      </div>
                      <div class="info">
                        <span class="parking_name">논현 공영주차장</span>
                        <sapn>⭐⭐⭐⭐⭐</sapn>
                      </div>
                  </div>    
                    <div class="ranking_box">
                        <div class="icon sliver"></div>
                        <div class="photo">
                            <img src="./img/1.png" alt="" width="100%">
                        </div>
                        <div class="info">
                          <span class="parking_name">논현 공영주차장</span>
                          <sapn>⭐⭐⭐⭐⭐</sapn>
                        </div>
                    </div>
                    <div class="ranking_box">
                        <div class="icon bronze"></div>
                        <div class="photo">
                            <img src="./img/1.png" alt="" width="100%">
                        </div>
                        <div class="info">
                          <span class="parking_name">논현 공영주차장</span>
                          <sapn>⭐⭐⭐⭐⭐</sapn>
                        </div>
                    </div>
                </div>
              <table>
                <thead>
                  <tr>
                    <th>순위</th>
                    <th>주차장명</th>
                    <th>구</th>
                    <th>동</th>
                    <th width="150px">별점</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>논현 공영주차장</td>
                    <td>강남구</td>
                    <td>개포동</td>
                    <td>⭐⭐⭐⭐⭐</td>
                  </tr>
                  <tr>
                    <td> </td>
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
                  <tr>
                    <td> </td>
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
                  <tr>
                    <td> </td>
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
                  <tr>
                    <td> </td>
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
                  <tr>
                    <td> </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                </tbody>
              </table>
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
</body>
</html>