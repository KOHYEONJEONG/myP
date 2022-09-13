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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style>
.rigth_contents{
width: 900px;
position: absolute;
top: 50%;
left: 50%;
transform: translate(-50%,-50%);
}

table {
width: 900px;
box-sizing: border-box;
border: 1px #a39485 solid;
font-size: 14px;
box-shadow: 0 2px 5px rgba(0,0,0,.25);
border-collapse: collapse;
border-radius: 5px;
overflow: hidden;

}

th {
text-align: center;
}

thead {
font-weight: bold;
color: #000;
background: #eeeeee;
border-bottom: 1px solid rgba(0,0,0,.1);
}

td, th {
padding: 15px 5px;
vertical-align: middle;
}

td {
border-right: 1px solid rgba(0,0,0,.1);
border-bottom: 1px solid rgba(0,0,0,.1);
background: #fff;
text-align: center;
}

tr td:nth-child(odd){
background-color:#eeeeee; 
font-weight: bold;
}

td.money > div{
display: flex;
justify-content: space-between;
padding: 0 50px;
box-sizing: border-box;
}

</style>
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
        <div class="rigth_contents">
            <table>
                <thead>
                <tr>
                    <th colspan="4">가산동</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>주차장명</td>
                    <td>가산공영주차장</td>
                    <td>연락처</td>
                    <td>031-111-2222</td>
                </tr>
                <tr>
                    <td>노상/노외</td>
                    <td>노상</td>
                    <td>무료/유료</td>
                    <td>무료</td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td colspan="3">서울시 금천구 가산동</td>
                </tr>
                <tr>
                    <td>운영시간</td>
                    <td class="time">
                        <div>
                        <span>매일</span>
                        <span>00:00~24:00</span>
                        </div>
                        <div>
                        <span>공휴일</span>
                        <span>00:00~24:00</span>
                        </div>
                    </td>
                    <td>주차요금</td>
                    <td class="money">
                        <div>
                        <span>30분</span><span>1,500원</span>
                        </div>
                        <div>
                        <span>60분</span><span> 3,000원</span>
                        </div>
                        <div>
                        <span>120분 </span><span> 6,000원</span>
                        </div>
                        <div>
                        </span>240분<span>12,000원</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>방문자데이터</td>
                    <td colspan="3">
        
                    <canvas id="myChart"></canvas>
        
                    </td>
                </tr>
                </tbody>
                </table>
    </div>
    </div>
</div>
</main>
<c:import url="/footer"></c:import>
<script src="./jquery/jquery-1.12.4.js"></script>
<script src="./js/main.js"></script>
<script type="text/javascript">
var context = document
    .getElementById('myChart')
    .getContext('2d');
var myChart = new Chart(context, {
    type: 'line', // 차트의 형태
    data: { // 차트에 들어갈 데이터
        labels: [
            //x 축
            '0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17',
            '18','19','20','21','22','23','24'
        ],
        datasets: [
            { //데이터
                label: '시간도 인기도', //차트 제목
                fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                data: [
                    0,0,0,3,5,6,10,15,25,30,20,20,15,15,20,20,20,15,14,12,10,8,5,3,0 //x축 label에 대응되는 데이터 값
                ],
                backgroundColor: [
                    //색상
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    //경계선 색상
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1, //경계선 굵기
                
            }
        ]
    },
    options: {
        scales: {
            yAxes: [
                {
                    ticks: {
                        beginAtZero: true,
                        steps: 10,
                        max: 50
                    }
                }
            ]
        }
    }
});
</script>
</body>
</html>