package com.market.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.UserDAO;

public class UserOutOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int user_no = Integer.parseInt(request.getParameter("user_no").trim());
		String user_pwd = request.getParameter("user_Pwd").trim();
		String user_oldpwd = request.getParameter("hidden_oldPwd").trim();
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		UserDAO dao = UserDAO.getInstance();
		
		if(user_pwd.equals(user_oldpwd)) {
			System.out.println("삭제 실시");
			int check = dao.userOut(user_no);
			if(check == 1) {
				HttpSession session = request.getSession();
				session.invalidate();
				forward.setRedirect(false);
				forward.setPath("main.jsp");
				
			}else {
				
				out.println("<script>");
				out.println("alert('삭제실패')");
				out.println("history.back()");
				out.println("</script>");
			}
		}else if(user_pwd.equals(user_oldpwd) == false){
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다. 다시확인해 주세요.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('삭제실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
