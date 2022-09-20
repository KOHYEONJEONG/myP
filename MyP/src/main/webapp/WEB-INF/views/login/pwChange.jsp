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
	<script src="resources/js/join.js"></script>
<style>
   .wrap {
   width: 490px;
   height: 350px;
   padding: 40px 20px 20px 20px;
   background-color: #f5f6f7;
   position: absolute;
   top: 50%;
   left: 50%;
   transform: translate(-50%,-50%);
    border-radius: 30px;
   box-sizing: border-box;
}
.logo {
    width: 250px;
    height: 100px;
    background: url(resources/icons/logo8.png) no-repeat;
    background-size: 130%;
    background-position: 50%;
    position: absolute;
    top: -80px;
    left: 50%;
    transform: translate(-50%,-50%);
}
a{
    width: 280px;
    height: 110px;
    display: block;
}

.title {
   margin: 0 auto;
    width: 240px;
    height: 44px;
    text-align: center;
    font-size: 25px;
    background-repeat: no-repeat;
    background-position: 0 0;
    background-size: 240px auto;
    margin-bottom: 20px;
}
.input_box {
   position: relative;
   height: 60px;
    border: solid 1px #dadada;
    background: #fff;
    border-radius: 10px;
   padding: 10px;
   margin: 5px 0;
   box-sizing: border-box;
   
}

input {
   height: 100%;
   width: 100%;
    border: 0;
    background: #fff;
   font-size: 15px;
   outline: 0;

}


.input_box2{
    height: 60px;
    width: 36%;
    border: solid 1px #dadada;
    background: #fff;
    border-radius: 10px;
    padding: 10px;
    margin: 5px 0;
    box-sizing: border-box;
}
.a{
    width: 7%;
    height: 60px;
    line-height: 60px;
    text-align: center;
}
.input_box3{
    height: 60px;
    border: solid 1px #dadada;
    background: #fff;
    border-radius: 10px;
    padding: 10px;
    margin: 5px 0;
    box-sizing: border-box;
    width: 350px;
}

input, select{
   height: 100%;
   width: 100%;
    border: 0;
    background: #fff;
   font-size: 15px;
   outline: 0;

}

.df{
    display: flex;
}
.join_btn{
    width: 100px;
    height: 60px;
    background: #FD9A29;
    border: solid 1px #dadada;
    border-radius: 10px;
    color: #fff;
    font-size: 14px;
    margin: 5px 0;
    cursor: pointer;
}

#changeBtn{
    margin-top: 15px;
   height: 60px;
    border: solid 1px #00af80;
    text-align: center;
    background: #00af80;
    color:white;
    font-size: 18px; 
   box-sizing: border-box;
   border-radius: 5px;
   cursor: pointer;
    width: 450px;
}

/*비밀번호 확인 일치 유효성 검사*/
.pwck_input_re_1 {
	color : green;
	display : none;
}
.pwck_input_re_2{
	color : red;
	display : none;
}

</style>
<script type="text/javascript">
console.log($("#memNo").val());

</script>
</head>
<body>
    <div class="wrap">
   	<h1 class="logo"></h1>
   <form name="pwChangeform" id="pwChangeform">
   		<input type="hidden" name="memNo" id="memNo" value="${data.MEM_NUM}"/>
        <div class="title">비밀번호 변경</div>
        <div class="input_box">
           <input type="password" name="pwd" placeholder="새비밀번호" id="pwd" required><br>
        </div> 
        <span class="" id="pw_ck_status"></span>
          <div class="input_box">
              <input type="password" id="rePw" placeholder="새비밀번호 재확인"><br>
          </div>  
         <span class="pwck_input_re_1">비밀번호가 일치합니다.</span> 
			<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
        <div>
            <button class="sign_up" type="submit" id="changeBtn">변경</button>
        </div>
    </form>
</div>
</body>
</html>