<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user_search.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body>
	<jsp:include page="/include/main_top.jsp"></jsp:include>

	<div class="search_container">
		<div class="search_title">비밀번호 찾기</div>
		<div class="search_innercontainer">
			<div class="btn_group">
				<button selected="" type="button" class="btn_phone">휴대폰 인증</button>
				<button type="button" class="btn_email">이메일 인증</button>
			</div>
			<form method="post" action="<%=request.getContextPath()%>/user_pwdsearch_ok.do" onsubmit="return submitCheck();">
				<div class="name_container">
					<label for="user_name">이름</label>
					<div>						
						<input type="text" data-testid="input-box" id="user_Name" name="user_name"
                             value="" placeholder="이름을 입력해 주세요" class="css-upmixo e1uzxhvi0">
					</div>
				</div>

				<div class="phone_container">
					<label for="user_phone">휴대폰 번호</label>
					<div class="css-176lya2 e1uzxhvi1">
						<input type="tel" data-testid="input-box" id="user_phone"
							name="user_phone" value="" placeholder="휴대폰 번호를 입력해 주세요"
							class="css-upmixo e1uzxhvi0"> <input type="hidden"
							id="phone_click" value="">
					</div>
				</div>

				<div class="email_container">
					<label for="user_email">이메일</label>
					<div class="css-176lya2 e1uzxhvi1">
						<input type="email" data-testid="input-box" id="user_email"
							name="user_email" value="" placeholder="이메일을 입력해 주세요"
							class="css-upmixo e1uzxhvi0"> <input type="hidden"
							id="email_click" value="">
					</div>
				</div>


				<div>
					<button class="btn_submit" type="submit" radius="4">
						<span>확인</span>
					</button>
				</div>
			</form>
		</div>
	</div>

	<jsp:include page="/include/main_bottom.jsp"></jsp:include>
	

<script src="<%=request.getContextPath()%>/js/user_search.js"></script>	
</body>
</html>