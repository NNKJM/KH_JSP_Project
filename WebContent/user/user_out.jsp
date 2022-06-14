<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user_modify.css">
</head>
<body>
	<jsp:include page="/include/main_top.jsp"></jsp:include>
<div class="container">
	<div class="title">
	<span>회원탈퇴 안내</span>
	</div>
	<form method="post" action="<%=request.getContextPath()%>/user_out_ok.do">
	<input type="hidden" name="user_no" value = "${userCont.getUser_no()}">
		<table border="0" cellspacing="0" >
			<tr>
				<th>회원탈퇴안내</th>
				<td>
					<div id="group_userId">
					<p class="txt_guide square" style="display: block;"></p>
					<span class="txt ">회원탈퇴시의 아래사항을 숙지하시기 바랍니다.</span>
					<span class="txt ">1. 회원탈퇴 시 고객님의 정보는 상품 반품 및 A/S를 위해 전자상거래</span>
					<span class="txt "> 등에서의소비자 소보에 관란 법률에 의거한 고객정보 보호정책에 따라 관리 됩니다.</span>
					<span class="txt ">2. 탈퇴 시 고객님께서 보유하셨던 적립금은 모두 삭제 됩니다.</span>
					<span class="txt ">3. 회원 탈퇴 후 30일간 재가입이 불가능합니다.</span>
					</div>
				</td>
			</tr>	
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
				<th>비밀번호</th>
				<td>
					<div>
					<input type="password" id="user_Pwd" name="user_Pwd" maxlength="16">
					<input type="hidden" id="hidden_oldPwd" name="hidden_oldPwd" value="${userCont.getUser_pwd()}">
					<p class="txt_guide square">
					</div>
				</td>
			</tr>

			<tr>
			<td colspan="2">
				<hr>
			</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<input type="submit" class="btn_bottom" id = "btn_out" value="탈퇴">
					<input type="reset" class="btn_bottom" value="취소">
				</td>
			</tr>
		</table>
	</form>
</div>
<jsp:include page="/include/main_bottom.jsp"></jsp:include>
</body>
</html>