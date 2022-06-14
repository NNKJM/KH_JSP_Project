<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>회원로그인</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/user_login.css">
</head>
<body>
	<jsp:include page="/include/main_top.jsp"></jsp:include>
	
    <div class="container" id="login_container">
        <span id="login_title">로그인</span>
        <form method="post" action="<%=request.getContextPath()%>/user_login_ok.do">
            <table>
                <tr>
                    <td colspan="2">
                            <input type="text" class="user_input" id="user_id" name="user_id" required placeholder="아이디를 입력해 주세요">
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                            <input type="password" class="user_input" id="user_pwd" name="user_pwd" required placeholder="비밀번호를 입력해 주세요">
                    </td>
                </tr>

                <tr>
                    <td>
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
                            <label class="form-check-label" for="flexCheckChecked">
                              보안접속
                            </label>
                          </div>
                    </td>
                    <td>
                        <div id="search">
                         <a href="<%=request.getContextPath()%>/user_idsearch.do">아이디 찾기</a>
                         | 
                         <a href="<%=request.getContextPath()%>/user_pwdsearch.do">비밀번호찾기</a>
                         </div>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <input id="btn_login" type="submit" value="로그인">
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <input id="btn_jointo" type="button" value="회원가입"
                        onclick="location.href='user_Join.do'">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    
    <jsp:include page="/include/main_bottom.jsp"></jsp:include>
</body>
</html>