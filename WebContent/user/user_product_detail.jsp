<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/user_product_detail.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(function(){
    const totalPrice = $(".totalPrice");
    const productPrice = $("#product_price").val();
    
    $(".plus").click(function(){
   	const num = $(".numBox").val();
    const plusNum = Number(num) + 1;
    
    if(plusNum >= 100) {
     $(".numBox").val(num);
    } else {
     $(".numBox").val(plusNum);          
    }
    totalPrice.text((parseInt(plusNum)*parseInt(productPrice)).toString()
    		  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));   
   });
   
   $(".minus").click(function(){
    const num = $(".numBox").val();
    const minusNum = Number(num) - 1;
    
    if(minusNum <= 0) {
     $(".numBox").val(num);
    } else {
     $(".numBox").val(minusNum);          
    }
    if(minusNum >0){
    totalPrice.text((parseInt(minusNum)*parseInt(productPrice)).toString()
    		  .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
    }
   });
   
   });
    
    function submitCheck(){
    	const userId = $("#userId").val();
    	if(userId==""){
    		location.href="user/user_login.jsp";
    		return false;
    	}
    }

</script>
</head>
<body>
<jsp:include page="../include/main_top.jsp" />
	<div id="detail_main">
	<c:set var="dto" value="${productCont }"/>
        <div id="detail_image">
            <img src="<%=request.getContextPath()%>/upload/${dto.getPimage()}" alt="...">
        </div>
		
        <div id ="detail_info">
            <form method="post" action="<%=request.getContextPath()%>/user_cart_add.do" onsubmit="return submitCheck();">
            <input type="hidden" id="userId" name="userId" value="${userCont.getUser_id()}">
            <input type="hidden" name="pnum" value="${dto.getPnum()}">
            <input type="hidden" name="pname" value="${dto.getPname()}">
            <input id="product_price" name="price" type="hidden" value="${dto.getPrice()}">
            <input type="hidden" name="pspec" value="${dto.getPspec()}">
            <input type="hidden" name="pimage" value="${dto.getPimage()}">
            
                <table id="info_table">
                    <tr>
                        <td colspan="2">
                            <p class="product_name"> 
                                <strong class="name">${dto.getPname()}</strong> 
                                <span class="short_spec">${dto.getPdetails()}</span>
                             </p>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <p class="product_price"> 
                                <span class="price">
                                <fmt:formatNumber>${dto.getPrice()}</fmt:formatNumber> 
                                <span class="won">???</span>
                                </span>
                            </p>
                            <span class="login">
                            	?????????????????? ??????????????? ???????????????.
                            </span>
                        </td>
                    </tr>

                    <tr>
                        <td class="left">????????????</td>
                        <td class="right">????????????/????????????</td>
                    </tr>
                    <tr>
                        <td class="left">????????????</td>
                        <td class="right">${dto.getPspec()}</td>
                    </tr>

                    <tr>
                        <td class="left">????????????</td>
                        <td class="right">${dto.getPqty()}???</td>
                    </tr>

                    <tr>
                        <td class="left">????????????</td>
                        <td class="right">
                            <span id="count_btn">
                            <button type="button" class="plus">+</button>
                            <input type="number" class="numBox" name="pqty" min="1" max="100" value="1" readonly="readonly"/>
                            <button type="button" class="minus">-</button>
                            </span>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" align="right">
                            <span class="totalWord">??? ????????????: </span>
                            <span class="totalPrice">
                            <fmt:formatNumber>${dto.getPrice()}</fmt:formatNumber>
                            </span>
                            <span class="totalWord">???</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="loginBenefits" colspan="2"  align="right">?????????????????? ???????????? ??????</td>
                    </tr>
                    <tr>
                        <td colspan="2"  align="right">
                            <button class="cart_button"type="submit" class="btn btn-primary">???????????? ??????</button>
                        </td>
                        
                    </tr>
                    
                </table>
            </form>
        </div>
    </div>

	<jsp:include page="../include/main_bottom.jsp" />
</body>
</html>