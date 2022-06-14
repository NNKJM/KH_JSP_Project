<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/notice_inquiry_list.css">
<link rel="stylesheet" href="/Jsp_TeamProject/css/fontello/css/fontello.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	
	$(function() {
		$(".notice_title").click(function() {
			var currentRow = $(this).closest('tr');
			var detail = currentRow.next('tr');
			if(detail.is(":visible")) {
				detail.hide();
			} else {
				detail.show();
			}
		});
	});
	
</script>
</head>
<body>
	<header>
		<jsp:include page="../include/main_top.jsp" />
	</header>
	
	<div id="body">
		<aside id="aside">
			<jsp:include page="../include/notice_aside.jsp" />
		</aside>

		<main id="main">
			<section>
			<c:set var="list" value="${inquiryList }" />
				<h1>1:1 문의</h1> <hr>
				
				<%-- 문의 내용이 없는 경우 --%>
				<c:if test="${empty list }">
					<div class="inquiry_empty">
						작성한 1:1 문의가 없습니다.
					</div>
				</c:if>
					
				<%-- 문의 내용이 있는 경우 --%>
				<c:if test="${!empty list }">
					<table class="table table-sm">
						<tr class="notice_head">
							<th class="notice_title">제목</th>
							<th>작성일</th>
							<th>답변상태</th>
						</tr>
						<c:forEach items="${list }" var="dto">
							<tr class="notice_main">
								<td class="notice_title">${dto.getAsk_title() }</td>
								<td>${dto.getAsk_date().substring(0, 10) }</td>
								<td>
									<c:if test="${dto.getAsk_status() eq 0}">
											<span style="color:#808080;">처리중</span>
									</c:if> 
									
									<c:if test="${dto.getAsk_status() eq 1}">
											<span style="color:#ea7500;">답변완료</span>
									</c:if>
								</td>
							</tr>
							
						<%-- 답변이 없는 경우 --%>
						<c:if test="${empty dto.getAsk_reply() }" >
							<tr class="replyRow">
								<td colspan="3">
									<div class="reply_main">
										<div class="reply_img_content">
											<span class="reply_img icon-help"></span>
											<div class="reply_content">
												<pre class="content">${dto.getAsk_content() }</pre>
											</div>
										</div>
										<div class="reply_img">
											<img src="<%=request.getContextPath() %>/uploadFile${dto.getAsk_image() }" 
												onerror="this.style.display='none'"/>
										</div>
										<div class="reply_btn">
											<input type="button" value="수정"
												onclick="location.href='notice_inquiry_update.do?no=${dto.getAsk_no() }'">
											<input type="button" value="삭제" 
												onclick="location.href='notice_inquiry_delete.do?no=${dto.getAsk_no() }'">
										</div>
									</div>
								</td>
							</tr>
						</c:if>
						
						<%-- 답변이 있는 경우 --%>
						<c:if test="${!empty dto.getAsk_reply() }" >
							<tr class="replyRow">
								<td colspan="3">
									<div class="reply_main">
										<div>
											<div class="reply_img_content">
												<span class="icon-help"></span>
												<div class="reply_content">
													<pre class="content">${dto.getAsk_content() }</pre>
												</div>
											</div>
											<div class="reply_img">
												<img src="<%=request.getContextPath() %>/uploadFile${dto.getAsk_image() }" 
													onerror="this.style.display='none'"/>
											</div>
										</div>
										<div>
											<div class="reply_img_content reply_admin">
												<span class="icon-wechat"></span>
												<div class="reply_content">
													<pre class="content">${dto.getAsk_reply() }</pre>
												</div>
											</div>
											<div class="reply_content">
												${dto.getAsk_replyDate().substring(0, 10) }
											</div>
										</div>
									</div>
								</td>
							</tr>
						</c:if>
						</c:forEach>
					</table>
				</c:if>
			</section>

			<div class="inquiry_btn">
				<input type="button" class="btn btn-secondary btn-lg" value="문의하기" 
					onclick="location.href='notice/notice_inquiry_form.jsp'">
			</div>
		</main>
	</div>

	<footer>
		<jsp:include page="../include/main_bottom.jsp" />
	</footer>
	

</body>
</html>