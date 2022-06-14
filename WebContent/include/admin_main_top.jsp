<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸드이야기</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/top.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">

	$(function(){
		const user_name = $("#user_name").text();
		
		if(user_name != ''){
			$("#user_menu1").css("display","block");
			
		}
	});

</script>
</head>
<body>

	<div id="header">
		<div id="userMenu">
			<ul class="list_menu">
				<li class="nav-item dropdown" id="user_menu1">
		          <a class="nav-link dropdown-toggle" href="#" id="userScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		          	  <span id="welcome">웰컴</span> <span id="user_name">${adminCont.getAdmin_name()}</span>님
		          </a>
		          <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
		            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/user_login.do">사용자 로그인</a></li>
		            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/admin_login.do">로그아웃</a></li>
		          </ul>
				</li> 
			</ul>
		</div>
			
		<div id="headerLogo">
			<a href="<%=request.getContextPath()%>/admin_notice_list.do" class="link_menu">
				<img class="logo_img" src="<%=request.getContextPath()%>/uploadFile/logo.png">
			</a>
		</div>
	</div>
	
	<hr width="100%">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>