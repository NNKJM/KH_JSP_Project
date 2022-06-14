<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.admin_main_container{
	display: flex;
	flex-direction: row;
	width: 1150px;
	height: 100%;
	margin: 0 auto;
	margin-bottom: 50px;
	background-color: white;
}
</style>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/admin_user_list.css?ver=2">
</head>
<body>
	<jsp:include page="/include/admin_top.jsp"></jsp:include>

	<div class="admin_main_container">
	<jsp:include page="/include/admin_sidebar.jsp"></jsp:include>


	<div class="admin_right_container">
	
		<div class="user_list_container">
            <table class="user_list_table">
           
                <tr>
                    <th>회원번호</th> <th>아이디</th> <th>이름</th>
                    <th>성별</th> <th>이메일</th> <th>가입일</th> <th>탈퇴</th>
                </tr>
                
				<c:set var = "list" value="${userList }"/>
				
				<c:if test="${! empty list}">
					<c:forEach items="${list }" var="dto">
		                <tr>
		                    <td>${dto.getUser_no() }</td>
		                    <td>${dto.getUser_id() }</td>
		                    <td>${dto.getUser_name() }</td>
		                    <td>${dto.getUser_gender() }</td>
		                    <td>${dto.getUser_email() }</td>
		                    <td>${dto.getUser_date().substring(0,10) }</td>
		                    <td>
		                    	<input type="button" class="btn btn-outline-secondary" id="button-addon2" value="탈퇴"
		                    	onclick="if(confirm('회원탈퇴를 진행하시겠습니까?')){
		                    		location.href='admin_user_delete.do?no=${dto.getUser_no() }'
		                    	}else{return;}">
		                    	
		                    </td>
		                </tr>
	                </c:forEach>
				</c:if>
				
				<c:if test="${empty list }">
					<tr>
						<td colspan="7" align="center">
							<h3>검색된 데이터가 없습니다.....</h3>						
						</td>					
					</tr>
				</c:if>
                
            </table>
            
            <div class="search_container">
            <form method="post" action="<%=request.getContextPath()%>/admin_user_search.do">          
             <div class="input-group mb-3">
             <select name="search_field">
	             <option value="id">아이디</option>
	             <option value="name">이름</option>
	             <option value="id_name">아이디+이름</option>
             </select>
			  <input type="text" name="search_keyword" class="form-control" required>
			  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
			</div>
            </form>  
            </div> 
                        
            <div clss="paging_container">
			<nav aria-label="Page navigation example">
			 	<ul class="pagination">
			 	<c:if test="${page > block }">
			    <li class="page-item"><a class="page-link" href="admin_user_list.do?page=1">Start</a></li>
			    <li class="page-item"><a class="page-link" href="admin_user_list.do?page=${startBlock - 1}">Previous</a></li>
			    </c:if>
			    
			    <c:forEach begin="${startBlock }" end="${endBlock }" var="i">
			    <c:if test="${i == page }">
			    <li class="page-item"><b><a class="page-link" href="admin_user_list.do?page=${i}">${i}</a></b></li>
			  	</c:if>
			  	<c:if test="${i != page }">
			    <li class="page-item"><a class="page-link" href="admin_user_list.do?page=${i}">${i}</a></li>
			    </c:if>
			    </c:forEach>
			    
			    <c:if test="${endBlock < allPage }">
			    <li class="page-item"><a class="page-link" href="admin_user_list.do?page=${endBlock +1 }">Next</a></li>
			    <li class="page-item"><a class="page-link" href="admin_user_list.do?page=${allPage }">End</a></li>
			    </c:if>
			  	</ul>
		    </nav>
			</div>
			
        </div>
        
        <div class="user_count_container">
        <c:set var="now" value = "<%=new Date() %>"/>
        <div class="total_user">
        <div>전체가입자수</div>
        <div>
        <span class="date"><fmt:formatDate value="${now }" pattern="YY.MM.dd"/>기준</span>
        <span> ${totalRecord}명</span>
        </div>
        </div>
        
        <div class="nowDate_user">
        <div>금일가입자수</div>
        <div>
        <span class="date"><fmt:formatDate value="${now }" pattern="YY.MM.dd"/>기준</span>
        <span>${nowDateCount}명</span>
        </div>
        </div>
        
        </div>
        
        
        
        
    </div>
        
	</div>
</body>
</html>