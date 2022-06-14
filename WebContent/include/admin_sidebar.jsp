<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin_sidebar.css">
</head>
<body>
    <div class="b-example-divider"></div>
    <div class="flex-shrink-0 p-3" style="width: 280px;">
        <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
        	<span class="admin_name">${adminCont.getAdmin_name()}님</span>
      <ul class="list-unstyled ps-0">
        <li class="mb-1">
          <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
           	 회원관리
          </button>
          <div class="collapse show" id="home-collapse">
            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
              <li><a href="<%=request.getContextPath() %>/admin_user_list.do" class="link-dark rounded">회원목록 & 수정</a></li>
              <li><a href="<%=request.getContextPath() %>/admin_notice_list.do" class="link-dark rounded">공지사항 & 답변</a></li>
            </ul>
          </div>
        </li>
        <li class="mb-1">
          <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
            매출관리
          </button>
          <div class="collapse" id="dashboard-collapse">
            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
              <li><a href="<%=request.getContextPath()%>/admin_sales_list.do" class="link-dark rounded">매출현황</a></li>
            </ul>
          </div>
        </li>
        <li class="mb-1">
          <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
           	 제품관리
          </button>
          <div class="collapse" id="orders-collapse">
            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
              <li><a href="admin_category_list.do" class="link-dark rounded">카테고리 관리</a></li>
              <li><a href="admin_product_list.do" class="link-dark rounded">제품등록</a></li>
            </ul>
          </div>
        </li>
        
        <li>
			<a class="admin_logout" href="<%=request.getContextPath()%>/admin_logout.do">관리자 로그아웃</a>
		</li>
        
      </ul>
    </div>
</body>
</html>