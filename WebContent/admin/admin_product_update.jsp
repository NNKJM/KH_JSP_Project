<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.update_page{
		margin-top: 100px;
	}
	
	.update_page h3{
		font-size: 28px;
		font-weight: bold;
		border: 3px solid gray;
		width: 30%;
		margin: 0 auto;
		padding: 20px 0px;
		border-radius: 10px;
	}
	
	.update_page td{
		line-height: 45px;
		padding-left: 10px;
	}
	
	.update_page textarea{
		font-size: 18px;
	}
	
	.update_page img{
		margin-top: 10px;
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

</style>
</head>
<body>

	<div align="center" class="update_page">
		<h3>Product 제품 수정 페이지</h3>	
	
		<br>
		
		
		<form method="post" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/admin_product_update_ok.do">
		
			<c:set var="dto" value="${productCont}"/>
			
			<input type="hidden" name="p_num" value="${dto.getPnum() }">
		
			<table border="1" cellspacing="0" width="700">
				
				<tr>
					<th>카테고리 코드</th>
					<td>
						<input name="p_category" value="${dto.getPcategory_fk() }">
					</td>
				</tr>
				
				<tr>
					<th>상품명</th>
					<td><input name="p_name" value="${dto.getPname() }">
				</tr>
			
				<tr>
					<th>상품스펙</th>
					<td><input name="p_spec" value="${dto.getPspec() }">
				</tr>
				
				<tr>
					<th>상품이미지</th>
					<td>
						<img src="<%=request.getContextPath() %>/upload/${dto.getPimage()}"
							width="100" height="80">
						<input type="file" name="p_image_new">
						<input type="hidden" name="p_image_old"
							value="${dto.getPimage() }">
					</td>
				</tr>
				
				<tr>
					<th>상품수량</th>
					<td>
						<input type="number" name="p_qty"
							min="1" max="50" value="${dto.getPqty() }">
					</td>
				</tr>
				
				<tr>
					<th>상품가격</th>
					<td>
						<input name="p_price" maxlength="8" value="${dto.getPrice() }">
					</td>			
				</tr>
				
				<tr>
					<th>상품제조사</th>
					<td>
						<input name="p_company" value="${dto.getPcompany() }">
					</td>				
				</tr>
				
				<tr>
					<th>상품내용</th>
					<td>
						<textarea rows="10" cols="30" name="p_details">
							${dto.getPdetails() }
						</textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center" class="button_input">
						<input type="submit" value="상품수정">&nbsp;&nbsp;&nbsp;
						<input type="reset" value="다시작성">
					</td>
				</tr>
				
			</table>
		</form>
	</div>	
	

</body>
</html>