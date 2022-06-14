package com.market.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.UserDAO;
import com.market.model.UserDTO;

public class UserLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String user_id = request.getParameter("user_id").trim();
		String user_pwd = request.getParameter("user_pwd").trim();
		
		UserDAO dao = UserDAO.getInstance();
		
		int check = dao.userLogin(user_id,user_pwd);
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		if(check>0) {
			UserDTO dto = dao.getuserCont(user_id);
			session.setAttribute("userCont", dto);
			forward.setRedirect(false);
			forward.setPath("main.jsp");
		}else if(check==-1) {
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다. 다시확인해 주세요')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('아이디가 틀립니다. 다시확인해 주세요')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
