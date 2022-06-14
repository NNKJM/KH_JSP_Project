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
	
	$(function() {
		$(".reply").click(function() {
			var replybtn = $(this).closest('div');
			var replyArea = replybtn.next('div');
			if(replyArea.is(":visible")) {
				replyArea.hide();
			} else {
				replyArea.show();
			}
		});
	});
	
</script>
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
			<c:set var="list" value="${InquiryList }" />
				<h1>1:1 문의 - 관리자</h1> <hr>
				
				<%-- 문의 내용이 없는 경우 --%>
				<c:if test="${empty list }">
					<div class="inquiry_empty">
						사용자로부터 1:1 문의가 없습니다.
					</div>
				</c:if>
					
				<%-- 문의 내용이 있는 경우 --%>
				<c:if test="${!empty list }">
					<table class="table table-sm">
						<tr class="notice_head">
							<th class="notice_title">제목	</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>답변상태</th>
						</tr>
						<c:forEach items="${list }" var="dto">
							<tr class="notice_main">
								<td class="notice_title">${dto.getAsk_title() }</td>
								<td>${dto.getAsk_userId() }</td>
								<td>${dto.getAsk_date().substring(0, 10) }</td>
								<td><c:if test="${dto.getAsk_status() eq 0}">
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
								<td colspan="4">
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
											<input type="button" value="답변" class="reply">
											<input type="button" value="삭제" 
												onclick="if(confirm('정말로 삭제하시겠습니까?')) {
												location.href='<%=request.getContextPath() %>/admin_inquiry_delete.do?no=${dto.getAsk_no() }'}
												else { return; }">
										</div>
										<div class="reply_area">
											<form method="post" action="<%=request.getContextPath() %>/admin_inquiry_reply.do">
												<input type="hidden" name="no" value="${dto.getAsk_no() }">
												<textarea class="area" name="reply_text" placeholder="해당 문의 내역에 대한 답변을 작성해 주세요" required ></textarea>
												<input type="submit" value="답변완료" class="reply_ok_btn">
											</form>
										</div>
									</div>
								</td>
							</tr>
						</c:if>
						
						<%-- 답변이 있는 경우 --%>
						<c:if test="${!empty dto.getAsk_reply() }" >
							<tr class="replyRow">
								<td colspan="4">
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
											<div class="reply_date_dbtn">
												<div class="reply_content">
													${dto.getAsk_replyDate().substring(0, 10) }
												</div>
												<div class="reply_btn">
												<input type="button" value="삭제" 
													onclick="if(confirm('정말로 삭제하시겠습니까?')) {
													location.href='<%=request.getContextPath() %>/admin_inquiry_delete.do?no=${dto.getAsk_no() }'}
													else { return; }">
											</div>
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

			<section>
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:if test="${page > block}">
							<li class="page-item"><a class="page-link" href="admin_inquiry_list.do?page=1">«</a></li>
							<li class="page-item"><a class="page-link" href="admin_inquiry_list.do?page=${startBlock -1 }">‹</a></li>
						</c:if>
						<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
							<li class="page-item"><a class="page-link" href="admin_inquiry_list.do?page=${i }">${i }</a></li>
						</c:forEach>
						<c:if test="${endBlock < allPage }">
							<li class="page-item"><a class="page-link" href="admin_inquiry_list.do?page=${endBlock + 1 }">›</a></li>
							<li class="page-item"><a class="page-link" href="admin_inquiry_list.do?page=${allPage }">»</a></li>
						</c:if>
					</ul>
				</nav>
			</section>
		</main>
	</div>

	<footer>
		<jsp:include page="../include/admin_main_bottom.jsp" />
	</footer>
	

</body>
</html>