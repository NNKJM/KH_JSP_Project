<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지내용</title>
</head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/notice_detail.css">
</head>
<body>
	<header>
		<jsp:include page="../include/admin_main_top.jsp" />
	</header>
	
	<div id="body">
		<main id="main">
			<section>
				<div class="notice_header">
					<h2>공지사항 수정 - 관리자</h2> 
					<p>새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</p>
				</div>
				<form method="post" action="<%=request.getContextPath() %>/admin_notice_update_ok.do">
					<input type="hidden" name="notice_no" value="${list.getNotice_no() }" />
					<table class="notice_table">
						<tr>
							<th>제목</th> 
							<td>
								<input class="content_title" name="notice_title" value="${list.getNotice_title() }" required>
							</td>
						</tr>
						<tr>
							<th>작성자</th> <td>${list.getAdmin_name() }</td>
						</tr>
						<tr>
							<c:if test="${empty list.getNotice_update() }">
								<th>작성일</th> <td>${list.getNotice_date().substring(0, 10) }</td>
							</c:if> 
							<c:if test="${!empty list.getNotice_update() }">
								<th>작성일(최근수정일)</th> 
								<td>${list.getNotice_date().substring(0, 10) }
								(${list.getNotice_update().substring(0, 10) })</td>
							</c:if> 
							<th>조회수</th> <td>${list.getNotice_hit() }</td>
						</tr>
						<tr>
							<td colspan="4" class="notice_content">
								 <textarea class="content_area" name="notice_content" required>${list.getNotice_content() }</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="4" align="right">
								<input class="notice_list_btn" type="submit" value="수정완료">
								<input class="notice_list_btn" type="reset" value="되돌리기">
								<input class="notice_list_btn" type="button" value="뒤로가기" onclick="history.back()">
							</td>
						</tr> 
					</table>
				</form>
			</section>
		</main>
	</div>

	<footer>
		<jsp:include page="../include/admin_main_bottom.jsp" />
	</footer>
</body>
</html>