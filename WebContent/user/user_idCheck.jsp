<%@page import="com.market.model.UserDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


	String userId = request.getParameter("paramId").trim();
	
	UserDAO dao = UserDAO.getInstance();
	
	int res = dao.checkUserId(userId);
	
	out.println(res);



%>