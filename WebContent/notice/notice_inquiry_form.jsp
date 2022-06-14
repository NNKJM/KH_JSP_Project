<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/notice_inquiry_form.css">
<script type="text/javascript">

	function PreviewImage() {
		var preview = new FileReader();
		preview.onload = function(e) {
			document.getElementById("PreImg").src = e.target.result;
		};
		preview.readAsDataURL(document.getElementById("inquiry_img").files[0]);
	};

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
			<h1>1:1 문의</h1><hr>
			<section class="inquiry_section">
				<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/notice_inquiry_insert.do">
					<div>
						<label class="label_title">제목</label>
						<input class="form-control" name="inquiry_title" placeholder="제목을 입력해 주세요" required>
					</div>
					<div>
						<label class="label_content">내용</label>
						<textarea class="form-control" name="inquiry_content" rows="20" placeholder="1:1문의 내용을 작성해 주세요" required></textarea>
					</div>
					<div class="filebox">
						<img class="img-thumbnail" id="PreImg"/>
						<label class="btn btn-outline-secondary" for="inquiry_img">
							<span class="inquiry_img"><img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMzAiIGhlaWdodD0iMzAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgICA8ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxwYXRoIGQ9Ik0wIDBoMzB2MzBIMHoiLz4KICAgICAgICA8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSg0Ljc3OSA2LjExMSkiIHN0cm9rZT0iIzMzMyIgc3Ryb2tlLXdpZHRoPSIxLjMiPgogICAgICAgICAgICA8cGF0aCBkPSJNMTEuNzkyIDBjLjM5OSAwIC43MTcuMDU2Ljk1NS4xNy4xNzkuMDg0LjM0Ni4xOTkuNTAzLjM0NGwuMTUzLjE1NS42MzEuNzAzYy4xMjIuMTMuMjM0LjIzMy4zMzcuMzFhLjk1Ljk1IDAgMCAwIC4zNC4xNmMuMTI1LjAzMS4yOTIuMDQ3LjUwMy4wNDdsMi45MDYtLjAwM2MxLjI4NCAwIDIuMzI0IDEuMDYyIDIuMzI0IDIuMzd2MTEuMTUxYzAgMS4zMS0xLjA0IDIuMzctMi4zMjQgMi4zN0gyLjMyNGMtMS4yODMgMC0yLjMyNC0xLjA2LTIuMzI0LTIuMzdWNC4yNTdjMC0xLjMxIDEuMDQtMi4zNyAyLjMyNC0yLjM3aDIuOTgzYy4yNDUtLjAwOS40MzItLjA0NS41NTktLjEwOC4xMS0uMDU1LjIzLS4xNDUuMzYtLjI3bC4xMzQtLjEzNy42MzEtLjcwM2MuMi0uMjIuNDE4LS4zODcuNjU3LS41LjE5LS4wOS40MzItLjE0NC43MjUtLjE2Mkw4LjYwMyAwaDMuMTg5eiIvPgogICAgICAgICAgICA8Y2lyY2xlIGN4PSIxMC4xNDIiIGN5PSI5LjUyOSIgcj0iMy41NTYiLz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo="></span>
							<input type="file" id="inquiry_img" name="inquiry_img" onchange="PreviewImage();"/>
						</label>
					</div> 
					<span class="img_text">
					상품과 무관한 내용이거나 음란 및 불법적인 내용은 통보없이 삭제 될 수 있습니다.
					</span> <hr>
					<div class="inquiry_submit">
						<input type="submit" class="btn btn-secondary btn-lg" value="등록하기">
					</div>
				</form>
			</section>
		</main>
	</div>

	<footer>
		<jsp:include page="../include/main_bottom.jsp" />
	</footer>
</body>
</html>