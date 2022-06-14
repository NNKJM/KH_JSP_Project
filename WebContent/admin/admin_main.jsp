<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.admin_main_container{
	display: flex;
	flex-direction: row;
	width: 1150px;
	height: 100%;
	margin: 0 auto;
	margin-bottom: 50px;
	background-color: lightgray;
}
.admin_right_container{
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 100%;
}

.admin_main_logo{
	height: 200px;
	margin-top: 20px;
}

.admin_main_text{
	margin: 50px 0px;
}

.Clock{
	width: 200px;
	height: 100px;
	text-align: center;
	color: #f4f4f4;
	padding-top: 10px;
	margin-bottom: 20px;
}

.Clock span{
	font-size: 18px;
	font-weight: bold;
}

#Clock{
	color: #F0C420;
	font-size: 24px;
}

#Clockday{
	color: #F0C420;
	font-size: 18px;
	font-weight: bold;
}

</style>

<script type="text/javascript">
	
	function Clock(){
		let date = new Date();
		let YYYY = String(date.getFullYear());
		let MM = String(date.getMonth() + 1);
		let DD = Zero(date.getDate());
		let hh = Zero(date.getHours());
		let mm = Zero(date.getMinutes());
		let ss = Zero(date.getSeconds());
		let Week = Weekday();
		
		Write(YYYY, MM , DD , hh , mm, ss , Week);
		// 시계에 1의자리수가 나올때 0을 넣어주는 함수(ex : 1초 -> 0.1초)
		
		function Zero(num){
			return (num < 10 ? '0' + num : '' + num)
		}
		
		// 요일츨 추가해주는 함수
		function Weekday(){
			let Week = ['일','월','화','수','목','금','토'];
			let Weekday = date.getDay();
			return Week[Weekday];
		}
		
		// 시계부분을 써주는 함수
		function Write(YYYY,MM,DD,hh,mm,ss,Week){
			let Clockday = document.getElementById("ClockDay");
			let Clock = document.getElementById("Clock");
			
			Clockday.innerText = YYYY + '/' + MM + '/' + DD + '('+ Week + ')';
			Clock.innerText = hh + ':' + mm + ':' + ss;
		}
	}
	
	setInterval(Clock, 1000); // 1초(1000)마다 Clock함수를 재 실행 한다.
	
</script>	


</head>
<body>
	<jsp:include page="/include/admin_top.jsp"></jsp:include>

	<div class="admin_main_container">
	<jsp:include page="/include/admin_sidebar.jsp"></jsp:include>


	<div class="admin_right_container">
		<img class="admin_main_logo" src="<%=request.getContextPath()%>/uploadFile/logo.png">
		
		<div class="admin_main_text">
			<h2 align="center">관리자 메인페이지 입니다.</h2>
			<h5>관리자 상세 메뉴는 왼쪽에서 선택해주세요.</h5>
		</div>
		
		<div class="Clock">
			<span>WHAT TIME IS NOW?</span><br>
			<div id="Clock">00:00</div>
			<div id="ClockDay">00/00/00</div>
		</div>
		
		
	</div>
	
	</div>
</body>
</html>