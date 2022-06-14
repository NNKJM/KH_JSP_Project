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
			$("#menu_join").css("display","none");
			$("#menu_login").css("display","none");
			
		}
		else if(user_name==''){
			$("#user_menu1").css("display","none");
			$("#menu_join").css("display","block");
			$("#menu_login").css("display","block");
		} 
		console.log(user_name);
	});

</script>

</head>
<body>


	<div id="header">
		<div id="userMenu">
			<ul class="list_menu">
			<li class="nav-item dropdown" id="user_menu1">
		          <a class="nav-link dropdown-toggle" href="#" id="userScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		          	  <span id="welcome">웰컴</span> <span id="user_name">${userCont.getUser_name()}</span>님
		          </a>
		          <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
		            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/user_order_list.do">주문내역</a></li>
		            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/user_modify.do">개인정보 수정</a></li>
		            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/user_logout.do">로그아웃</a></li>
		          </ul>
			</li> 
			    
				<li class="menu_join" id="menu_join">
					<a href="<%=request.getContextPath()%>/user_Join.do">회원가입 <span>|</span></a>
				</li>
				
				<li class="menu_login" id="menu_login">
					<a href="<%=request.getContextPath()%>/user_login.do">로그인 <span>|</span></a>
				</li>
				
				<li class="nav-item dropdown" id="menu_comunity">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		          	  고객센터
		          </a>
		          <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
		            <li><a class="dropdown-item lg" href="<%=request.getContextPath()%>/notice_main_list.do">공지사항</a></li>
		            <li><a class="dropdown-item lg" href="<%=request.getContextPath()%>/notice_inquiry_list.do">1:1문의</a></li>
		          </ul>
			    </li>
			</ul>
		</div>
			
			
		<div id="headerLogo">
			<a href="<%=request.getContextPath()%>/main.jsp" class="link_menu">
				<img class="logo_img" src="<%=request.getContextPath()%>/uploadFile/logo.png">
			</a>
		</div>
		
		
			
		<div id="gnb">
			<nav class="navbar navbar-expand-lg navbar-light bg-white" id="navbar1">
			  <div class="container-fluid" id="container">
			    
			    <div class="dropdown">
				  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
				    	전체 카테고리
				  </button>
				  
				  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				    <li><a class="dropdown-item" href="#main1">일일 특가</a></li>
				    <li><a class="dropdown-item" href="#main2">인기상품</a></li>
				    <li><a class="dropdown-item" href="#main3">맛잘알 상품</a></li>
				    <li><a class="dropdown-item" href="#main4">오늘의 저녁메뉴</a></li>
				  </ul>
				</div>
			    
			    
			    <div class="collapse navbar-collapse" id="navbarScroll">
			      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
			      
			        <li>
			          <a href="<%=request.getContextPath()%>/main_product_exhibit.do"><span class="product-select">상품목록</span></a>
			        </li>
			      
			        <li>
			          <a href="<%=request.getContextPath()%>/main_product_new.do"><span class="product-select">신상품</span></a>
			        </li>
			        
			        <li>
			          <a href="<%=request.getContextPath()%>/main_product_best.do" class="product-select"><span class="product-select">베스트 상품</span></a>
			        </li>
			        
			        <li>
			          <a href="<%=request.getContextPath()%>/main_product_famous.do" class="product-select"><span class="product-select">인기 상품</span></a>
			        </li>
			      
			      </ul>
			     
			     <form class="d-flex_main" method="post" action="<%=request.getContextPath()%>/user_search.do">
			        <input id="Serarch_flex" name="search_product" required="required" type="text">
			       	<button type="submit"><i class="fa-solid fa-magnifying-glass fa-lg"></i></button>
			     </form> 
		        
		        
		        <span class="main_icon">
			        <a href="#"><i class="fa-solid fa-heart fa-2x"></i></a>
			        <a href="<%=request.getContextPath()%>/user_cart_list.do"><i class="fa-solid fa-cart-shopping fa-2x"></i></a>
		        </span>
			      
			      
			      
			    </div>
			  
			  </div>
			</nav>
		</div>
	</div>
	
	
	<hr width="100%">


<script src="https://kit.fontawesome.com/27a0dd965d.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/scroll.js"></script>
</body>
</html>