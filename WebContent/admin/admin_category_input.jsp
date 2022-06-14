<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Category Input</title>
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
	display: block;
}
</style>
</head>
<body onload='choosingTail(head);'>
	<jsp:include page="/include/admin_top.jsp"></jsp:include>

	<div class="admin_main_container">
	<jsp:include page="/include/admin_sidebar.jsp"></jsp:include>


	<div class="admin_right_container" style="padding:50px;">
		<form method="post" action="<%=request.getContextPath() %>/admin_category_input_ok.do">
			<table border="2" cellspacing="0" width="350" bgcolor="white">
				<tr>
					<th>카테고리 코드</th>
					<td>
						<select id="head" name="category_code_head" onchange="choosingTail(this)">
							<option value="A" selected>A[음식]</option>
							<option value="B">B[음료]</option>
							<option value="C">C[화장]</option>
							<option value="D">D[가전]</option>
							<option value="Z">Z[기타]</option>
						</select>&nbsp;
						<select id="tail" name="category_code_tail" style="width:134px;"></select>
					</td>
				</tr>
				<tr>
					<th>카테고리 이름</th>
					<td><input name="category_name" style="width:205px"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="등록">
						<input type="button" value="취소" onclick="history.back()">
				</tr>
			</table>
		</form>
	</div>
	<!-- admin_bottom.jsp include 할 것 -->
<script src="<%=request.getContextPath()%>/js/category_manage.js"></script>
</body>
</html>