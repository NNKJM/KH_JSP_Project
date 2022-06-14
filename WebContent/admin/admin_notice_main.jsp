<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/notice_main.css">
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
			<section>
				<h1>공지사항 - 관리자</h1> <hr>
				<c:set var="list" value="${noticeList }" />
				<table class="table table-sm">
					<tr class="table_head">
						<th><a href="<%=request.getContextPath() %>/admin_notice_list.do?num=num">번호</a></th>
						<th class="notice_title">
							<a href="<%=request.getContextPath() %>/admin_notice_list.do?title=title">제목</a>
						</th>
						<th>작성자</th>
						<th><a href="<%=request.getContextPath() %>/admin_notice_list.do?date=date">작성일(최근수정일)</a></th>
						<th><a href="<%=request.getContextPath() %>/admin_notice_list.do?hit=hit">조회</a></th>
					</tr>
					<c:forEach items="${list }" var="dto">
						<tr class="table_content">
							<td>${dto.getNotice_no() }</td>
							<td class="nt">
							<a href="<%=request.getContextPath() %>/admin_notice_detail.do?no=${dto.getNotice_no() }">
								${dto.getNotice_title() }</a>
							</td>
							<td>${dto.getAdmin_name() }</td>
							<c:if test="${empty dto.getNotice_update() }">
								<td>${dto.getNotice_date().substring(0, 10) }</td>
							</c:if>
							<c:if test="${!empty dto.getNotice_update() }">
								<td>${dto.getNotice_date().substring(0, 10) }
								(${dto.getNotice_update().substring(0, 10) })</td>
							</c:if>
							<td>${dto.getNotice_hit() }</td>
						</tr>
					</c:forEach>
				</table>
			</section>

			<section>
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:if test="${page > block}">
							<li class="page-item"><a class="page-link" href="admin_notice_list.do?page=1">«</a></li>
							<li class="page-item"><a class="page-link" href="admin_notice_list.do?page=${startBlock -1 }">‹</a></li>
						</c:if>
						<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
							<li class="page-item"><a class="page-link" href="admin_notice_list.do?page=${i }">${i }</a></li>
						</c:forEach>
						<c:if test="${endBlock < allPage }">
							<li class="page-item"><a class="page-link" href="admin_notice_list.do?page=${endBlock + 1 }">›</a></li>
							<li class="page-item"><a class="page-link" href="admin_notice_list.do?page=${allPage }">»</a></li>
						</c:if>
					</ul>
				</nav>
				<hr>
			</section>

			<section id="search">
				<div class="search_table">
					<form method="post" action="<%=request.getContextPath() %>/admin_notice_search.do">
						<table>
							<tr>
								<td class="search_group">
									<label>
										<input type="checkbox" name="search_field" value="writer" checked> 이름
									</label>
									<label>
										<input type="checkbox" name="search_field" value="title"> 제목
									</label>
									<label>
										<input type="checkbox" name="search_field" value="content"> 내용
									</label>
								</td>
								<td>&nbsp;</td>
								<td>
									<div class="input-group mb-3">
										<input class="form-control" name="search_keyword" required>
										<input class="btn btn-outline-secondary" type="submit" value="검색">
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</section>
		</main>
	</div>

	<footer>
		<jsp:include page="../include/admin_main_bottom.jsp" />
	</footer>
</body>
</html>