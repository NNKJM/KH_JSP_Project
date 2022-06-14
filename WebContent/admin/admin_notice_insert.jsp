<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/notice_inquiry_form.css">
</head>
<body>
	<header>
		<jsp:include page="../include/admin_main_top.jsp" />
	</header>
	
	<div id="body">
		<aside id="aside">
			<jsp:include page="../include/admin_notice_aside.jsp" />
		</aside>

		<main id="main">
			<h1>공지등록 - 관리자</h1><hr>
			<section class="inquiry_section">
				<form method="post" action="<%=request.getContextPath() %>/admin_notice_insert.do">
					<div>
						<label class="label_title">제목</label>
						<input class="form-control" name="notice_title" placeholder="공지 제목을 작성해 주세요" required>
					</div>
					<div>
						<label class="label_content">내용</label>
						<textarea class="form-control" name="notice_content" rows="20" placeholder="공지 내용을 작성해 주세요" required></textarea>
					</div>
					<div class="inquiry_submit">
						<input type="submit" class="btn btn-secondary btn-lg" value="등록하기">
					</div>
				</form>
			</section>
		</main>
	</div>

	<footer>
		<jsp:include page="../include/admin_main_bottom.jsp" />
	</footer>
</body>
</html>