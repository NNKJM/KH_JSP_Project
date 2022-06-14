<%@page import="com.market.model.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userEmail = request.getParameter("paramEmail").trim();

	String userId = request.getParameter("paramUserId").trim();
	
	UserDAO dao = UserDAO.getInstance();
	int res = 1;
	
	if(userId != ""){
		String userOldEmail = dao.getuserCont(userId).getUser_email();
		if(userEmail.equals(userOldEmail)){
			out.println(2);
		}
		else{
			res = dao.checkUserEmail(userEmail);
			out.println(res);
		}
	}else{
		res = dao.checkUserEmail(userEmail);
		out.println(res);
	}
	
%>