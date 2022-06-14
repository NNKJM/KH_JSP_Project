<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user_modify.css">
<body>
	<jsp:include page="/include/main_top.jsp"></jsp:include>
<div class="container">
	<div class="title">
	<span>개인 정보 수정</span>
	</div>
	<form method="post" action="<%=request.getContextPath()%>/user_modify_ok.do" onsubmit="return submitCheck();">
	<input type="hidden" name="user_no" value = "${userCont.getUser_no()}">
		<table border="0" cellspacing="0" >
			<tr>
				<th>아이디</th>
				<td>
					<div id="group_userId">
					<input type="text" id="user_id" name="user_id" value="${userCont.getUser_id()}" readonly>
					<p class="txt_guide square" style="display: block;"></p>
					</div>
				</td>
			</tr>
			
			<tr>
				<th>현재 비밀번호</th>
				<td>
					<div id="group_oldPwd">
					<input type="password" id="user_oldPwd" name="user_oldPwd" maxlength="16">
					<input type="hidden" id="hidden_oldPwd" name="hidden_oldPwd" value="${userCont.getUser_pwd()}">
					<p class="txt_guide square">
					</div>
				</td>
			</tr>

			<tr>
				<th>새 비밀번호</th>
				<td>
					<div id="group_userPwd1">
					<input type="password" id="user_pwd1" name="user_pwd1" maxlength="16">
					<p class="txt_guide square">
						<span class="txt txt_case1">10자 이상 입력</span>
						<span class="txt txt_case2">현재비밀번호와 다르게 입력</span>
					</div>
				</td>
			</tr>

			<tr>
				<th>새 비밀번호확인</th>
				<td>
					<div id="group_userPwd2">
					<input type="password" id="user_pwd2" name="user_pwd2" maxlength="16">
					<p class="txt_guide square">
						<span class="txt txt_case1">동일한 비밀번호를 입력해주세요.</span>
					</div>
				</td>
			</tr>

			<tr>
				<th>이름</th>
				<td>
					<input type="text" id="user_name" name="user_name" value="${userCont.getUser_name()}">
				</td>
			</tr>

			<tr>
				<th>이메일</th>
				<td>
					<input type="text" id="user_email" name="user_email" value="${userCont.getUser_email()}">
					<button type="button" id="btn_userEmail" class="btn btn-outline-secondary">중복확인</button>
					<input type="hidden" id="user_email_check" value="0">
				</td>
			</tr>

			<tr>
				<th>휴대폰</th>
				<td>
					<input type="text" id="user_phone" name="user_phone" value="${userCont.getUser_phone()}">
				</td>
			</tr>

			<tr>
				<th>주소</th>
					<td id="address">
						<button type="button" id = "btn_address" class="btn btn-outline-secondary btn_address" onclick="sample4_execDaumPostcode()"><i class="fa-solid fa-magnifying-glass"></i>주소검색</button>
						<div>
						<input type="text" class="address" id="sample4_postcode" class="address" placeholder="우편번호">
						<input type="text" class="address" id="sample4_roadAddress" placeholder="도로명주소">
						<input type="text" class="address" id="sample4_jibunAddress" name="user_jibunAddress" placeholder="지번주소"
							value="${userCont.getUser_address()}">
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" class="address" id="sample4_detailAddress" name="user_detailAddress" placeholder="상세주소"
							value="${userCont.getUser_detailaddress()}">
						<input type="text" class="address" id="sample4_extraAddress" placeholder="참고항목">
						</div>
						<span class="txt txt_case1">샛별배송</span>
						<span class="txt txt_case2">배송지에 따라 상품정보가 달라질 수 있습니다.</span>
					</td>
			</tr>

				

			<tr>
				<th>성별</th>
				<td>
				<input type="hidden" id="pre_gender" name="pre_gender" value="${userCont.getUser_gender() }">
				<div class="group_radio">
				<input type="radio" id="user_gender1" name="user_gender" value="남">
				<span class="txt_gender">남자</span>
				
				
				<input type="radio" id="user_gender2" name="user_gender" value="여">
				<span class="txt_gender">여자</span>
				
				<input type="radio" id="user_gender3" name="user_gender" value="무">
				<span class="txt_gender">선택안함</span>
				</div>
				
				</td>
			</tr>

			<tr>
				<th>생년월일</th>
				<td>
				<div class="birth_day">
				<input type="text" name="user_birth_year" id="user_birth_year" size="4" maxlength="4" placeholder="YYYY">
				<span class="bar"></span>
				<input type="text" name="user_birth_month" id="user_birth_month" size="2" maxlength="2" placeholder="MM">
				<span class="bar"></span>
				<input type="text" name="user_birth_day" id="user_birth_day" size="2" maxlength="2" placeholder="DD">
				</div>
				<p class="txt_guide">
				</td>
			</tr>

			<tr>
			<td colspan="2">
				<hr>
			</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<input type="button" class="btn_bottom" id = "btn_out" value="탈퇴하기"
						onclick = "location.href='user_out.do'">
					<input type="submit" class="btn_bottom" id = "btn_modify" value="수정하기">
					<input type="button" class="btn_bottom" id = "btn_main" value="메인화면"
						onclick="location.href='main.jsp'">
				</td>

					

			</tr>
		</table>

	</form>
</div>
<jsp:include page="/include/main_bottom.jsp"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/user_modify.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>