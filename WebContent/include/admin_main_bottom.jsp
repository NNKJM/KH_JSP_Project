<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓컬리</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bottom.css">
</head>
<body>
	<hr width="100%">
	
	<div id="footer">
		<div class="footer-top">
			<div class="inner_footer">
				<div class="footer_cc">
						
						<h2 class="title_cc">고객행복센터</h2>
						
						<div class="cc_view">
							<h3>
								<span>0000-0000</span>
							</h3>
							
							<dl class="list"> 
								<dt>365일 고객센터</dt>
								<dd>오전 7시 - 오후 9시</dd>
							</dl>
						</div>
						
						<div class="cc_qna">
							<h3>
								<button type="button" class="btn btn-light" id="cc_qna_button">
									<a href="<%=request.getContextPath() %>/admin_inquiry_list.do" class="tit">
										1:1문의
									</a>
								</button>
								
							</h3>
							
							<dl class="list">
								<dt>24시간접수가능</dt>
								<dd>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</dd>
							</dl>
						</div>
						
						<div class="cc_qna">
							<h3>
								<button type="button" class="btn btn-light" id="cc_qna_button">
									<a href="<%=request.getContextPath()%>/admin_login.do" class="tit">
										관리자페이지
									</a>
								</button>
							</h3>
						</div>
						
				</div>
					
				<div class="company">
					<ul class="list_company">
						<li><a href="#" class="link">푸드톡소개</a></li>
						<li><a href="#" class="link">푸드톡소개영상</a></li>
						<li><a href="#" class="link">인재채용</a></li>
						<li><a href="#" class="link">이용약관</a></li>
						<li><a href="#" class="link">개인정보처리방침</a></li>
						<li><a href="#" class="link">이용안내</a></li>
					</ul>
					
					<div class="company_text">
						법인명(상호) : 푸드톡 <span>|</span> 사업자등록번호 : 000-00-00000<br>
						주소 : 서울특별시 강남구 역삼동 비자아파트 <span>|</span> 대표이사 : 홍길동<br>
						채용문의 : hong@naver.com<br>
					</div>
					
					<ul class="icon_bottom">
						<li>
							<a href="https://www.instagram.com/" class="link_sns" target="_blank">
								<i class="fa-brands fa-instagram fa-2x"></i>
							</a>
						</li>
						
						<li>
							<a href="https://ko-kr.facebook.com/" class="link_sns" target="_blank">
								<i class="fa-brands fa-facebook fa-2x"></i>
							</a>
						</li>
					
						<li>
							<a href="https://www.youtube.com/" class="link_sns" target="_blank">
								<i class="fa-brands fa-youtube fa-2x"></i>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
		
		<div class="footer_bottom">
			<p class="footer_bottom_txt">
				푸드톡에서 판매되는 상품은 푸드톡 마켓플레이스 상품이 포함되어 있습니다.<br>
				푸드톡 상품의 주문,품질,교환/환불 등 의무와 책임을 부당하지 않습니다.<br>
			</p>
			
			<em class="copy">&copy;FOOD TALK. ALL RIGHTS RESERVED</em>
		</div>
		
	</div>
	
	
	
</body>
</html>