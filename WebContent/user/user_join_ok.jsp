<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<style>
    th{
        width: 100px;
    }

    #joinok_container{
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
        margin: 50px auto;
    }
    #joinok_title{
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

    #btn_joinok{
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
</head>
<body>
	<jsp:include page="/include/main_top.jsp"></jsp:include>
    <div class="container" id="joinok_container">
        <span id="joinok_title">회원가입이완료되었습니다.</span>
        <hr>
        
        <table cesllspacing="0" width="600">
        <tr>
            <th>아이디</th>
            <td>${user_id }</td>
        </tr>
        <tr>
            <th>이름</th>
            <td>${user_name }</td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>${user_email }</td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <input type="button" id="btn_joinok" value="메인페이지로이동"
                	onclick="location.href='main.jsp'">
            </td>
        </tr>
        </table>

    </div>
    
    <jsp:include page="/include/main_bottom.jsp"></jsp:include>

</body>
</html>