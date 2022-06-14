<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    th{
        width: 100px;
    }

    #searchok_container{
        display: flex;
        flex-direction: column;
        align-items: center;
        border-top: 2px solid black;
        border-bottom: 2px solid black;
        width: 100%;
        margin: 50px auto;
    }
    #search_title{
        display: inline-block;
        margin-top: 50px;
        font-size: 23px;
        font-weight: bold;
        color: #606060;
    }
    table{
        border-top: 4px solid #9c64a6;
        margin-bottom: 50px;
    }

   tr{
        height: 65px;
    }


    th{
        padding-left: 20px;
    }

    td{
        padding-left: 100px;
    }

    #btn_searchok{
    width: 200px;
    height: 45px;
    font-size: 16px;
    line-height: 40px;
    border: 1px solid #5f0081;
    background-color: #5f0080;
    color: #fff;
    margin-right: 80px;
    }

</style>
<body>
	<jsp:include page="/include/main_top.jsp"></jsp:include>
	
	<c:if test="${!empty userContent }">
	
    <div class="container" id="searchok_container">
        <span id="search_title">회원정보</span>
        <hr>
        
        <table cesllspacing="0" width="600">
        
        <c:if test="${searchKind == 'id' }">
        <tr>
            <th>아이디</th>
            <td>${userContent.getUser_id() }</td>
        </tr>
        </c:if>
        
        <c:if test="${searchKind == 'pwd' }">
        <tr>
            <th>비밀번호</th>
            <td>${userContent.getUser_pwd() }</td>
        </tr>
        </c:if>
        
        <tr>
            <th>이름</th>
            <td>${userContent.getUser_name() }</td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <input type="button" id="btn_searchok" value="메인페이지로이동"
                	onclick="location.href='main.jsp'">
            </td>
        </tr>
        </table>

    </div>
    </c:if>
    
    <jsp:include page="/include/main_bottom.jsp"></jsp:include>
</body>
</html>