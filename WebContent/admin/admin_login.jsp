<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
	function submitCheck(){
		const admin_id = $("#admin_id").val();
		const admin_pwd = $("#admin_pwd").val();
		if(admin_id == ''){
			swal("아이디 입력 오류.", "아이디를 입력해 주세요");
			$("#admin_id").focus();
			return false;
		}else if(admin_pwd == ''){
			swal("비밀번호 입력 오류.", "비밀번호를 입력해 주세요");
			$("#admin_pwd").focus();
			return false;
		}
	}
</script>

<link href="<%=request.getContextPath()%>/css/admin_login.css" rel="stylesheet">
</head>

<body class="text-center">

<main class="form-signin">
  <form method="post" action="<%=request.getContextPath()%>/admin_login_ok.do" onsubmit="return submitCheck();">
 	<img class="logo_img" src="<%=request.getContextPath()%>/uploadFile/logo.png" width="100" height="100">

    <h1 class="h3 mb-3 fw-normal">Admin Login</h1>

    <div class="form-floating">
      <input type="text" class="form-control" id="admin_id" name="admin_id" placeholder="Id">
      <label for="floatingInput">Id</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="admin_pwd" name="admin_pwd" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me" checked> Remember me
      </label>
    </div>
    <input type="submit" class="w-100 btn btn-lg btn-primary" value="Login"> 

    <input type="button" class="w-100 btn btn-lg btn-primary" value="Main Page"
    	onclick="location.href='<%=request.getContextPath()%>/main.jsp'"> 
    <p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
  </form>
</main>
</body>


</html> 