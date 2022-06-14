<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 class="fw-bolder">고객센터</h1>
		<ul class="list-group list-group-flush fw-bold">
			<li class="list-group-item lg"><a href="<%=request.getContextPath() %>/admin_notice_list.do">공지사항</a></li>
			<li class="list-group-item lg"><a href="<%=request.getContextPath() %>/admin/admin_notice_insert.jsp">공지등록</a></li>
			<li class="list-group-item lg"><a href="<%=request.getContextPath() %>/admin_inquiry_list.do">1:1문의</a></li>
		</ul>
</body>
</html>