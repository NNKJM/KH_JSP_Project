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
		<jsp:include page="../include/main_top.jsp" />
	</header>
	
	<div id="body">
		<main id="main">
			<section>
				<div class="notice_header">
					<h2>공지사항</h2> 
					<p>새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</p>
				</div>
				<table class="notice_table">
					<tr>
						<th>제목</th> <td>${curList.getNotice_title() }</td>
					</tr>
					<tr>
						<th>작성자</th> <td>${curList.getAdmin_name() }</td>
					</tr>
					<tr>
						<c:if test="${empty curList.getNotice_update() }">
							<th>작성일</th> <td>${curList.getNotice_date().substring(0, 10) }</td>
						</c:if>
						<c:if test="${!empty curList.getNotice_update() }">
							<th>작성일(최근수정일)</th> 
							<td>${curList.getNotice_date().substring(0, 10) }
							(${curList.getNotice_update().substring(0, 10) })</td>
						</c:if>
						<th>조회수</th> <td>${curList.getNotice_hit() }</td>
					</tr>
					<tr>
						<td colspan="4" class="notice_content">
							 <pre class="content">${curList.getNotice_content() }</pre>
						</td>
					</tr>
					<tr>
						<td colspan="4" align="right">
							<input class="notice_list_btn" type="button" value="목록" 
								onclick="location.href='<%=request.getContextPath() %>/notice_main_list.do'">
						</td>
					</tr> 
				</table>
			</section>
			<div>
				<table class="pre_post_content">
					<c:if test="${0 ne preList.getNotice_no() }">
						<tr>
							<th>⮝이전글</th>
							<td>
								<a href="<%=request.getContextPath() %>/notice_detail.do?no=${preList.getNotice_no() }">
									${preList.getNotice_title() }
								</a>
							</td>				
						</tr>
					</c:if>
					<c:if test="${0 ne postList.getNotice_no() }">
						<tr>
							<th>⮟다음글</th>
							<td>
								<a href="<%=request.getContextPath() %>/notice_detail.do?no=${postList.getNotice_no() }">
									${postList.getNotice_title() }
								</a>
							</td>				
						</tr>
					</c:if>
				</table>			
			</div>
		</main>
	</div>

	<footer>
		<jsp:include page="../include/main_bottom.jsp" />
	</footer>
</body>
</html>