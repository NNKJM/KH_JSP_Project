<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	.insert_page{
		margin-top: 100px;
	}
	
	.insert_page h3{
		font-size: 28px;
		font-weight: bold;
		border: 3px solid gray;
		width: 30%;
		margin: 0 auto;
		padding: 20px 0px;
		border-radius: 10px;
	}
	
	.insert_page td{
		line-height: 35px;
		padding-left: 10px;
	}
	
	
	.button_input input{
		font-weight: bold;
		width: 100px;
		height: 40px;
		margin-left: 20px;
		border: none;
		border-radius: 15px;
		background-color: gray;
	}
	
	.button_input input:hover{
		cursor: pointer;
	}
	
	.insert_page textarea{
		font-size: 18px;
	}
	
</style>
</head>
<body>
	
	<div align="center" class="insert_page">
		<h3>제품등록 페이지</h3>	
		
		<br><br>
		
		<form method="post" enctype="multipart/form-data" 
			action="<%=request.getContextPath()%>/admin_product_input_ok.do">
			<c:set var="list" value="${categoryList}"/>
			
			<table border="1" cellspacing="0" width="700">
				<tr>
					<th>카테고리 코드</th>
					<td>
						<select name="p_category">
							<c:if test="${empty list}">
								<option value="">:::카테고리 없음:::</option>
							</c:if>
							
							<c:if test="${!empty list }">
								<c:forEach items="${list }" var="dto">
									<option value="${dto.getCategory_code() }">
										${dto.getCategory_name() } [${dto.getCategory_code() }]</option>
								</c:forEach>								
							</c:if>
						</select>
					</td>					
				</tr>
				
				<tr>
					<th>상품명</th>
					<td><input name="pname"></td>
				</tr>
				
				<tr>
					<th>상품스펙</th>
					<td><input name="pspec"></td>
				</tr>
				
				<tr>
					<th>상품이미지</th>
					<td><input type="file" name="pimage"></td>
				</tr>
				
				<tr>
					<th>상품수량</th>	
					<td>
						<input type="number" name="p_qty" min="1" max="50" value="1">
					</td>
				</tr>
				
				<tr>
					<th>상품가격</th>
					<td>
						<input name="p_price">
					</td>
				</tr>
				
				<tr>
					<th>상품제조사</th>
					<td>
						<input name="pcompany">
					</td>
				</tr>
				
				<tr>
					<th>상품내용</th>
					<td>
						<textarea rows="10" cols="30" name="p_details"></textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center" class="button_input">
						<input type="submit" value="상품등록">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성"> 
						<input type="button" value="돌아가기"
							onclick="location.href='admin_product_list.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	
</body>
</html>