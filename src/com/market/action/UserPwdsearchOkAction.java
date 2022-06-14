package com.market.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.UserDAO;
import com.market.model.UserDTO;

public class UserPwdsearchOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String user_name = request.getParameter("user_name").trim();
		String user_phone = request.getParameter("user_phone").trim();
		String user_email = request.getParameter("user_email").trim();
		
		UserDAO dao = UserDAO.getInstance();
		int check = 0;
		
		System.out.println(user_name);
		System.out.println(user_phone);
		System.out.println(user_email);
		
		if(user_phone != "") {
			
			check = dao.userIdsearch1(user_name,user_phone);
			
		}else if(user_email != "") {
			
			check = dao.userIdsearch2(user_name,user_email);
			
		}

		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		UserDTO dto = null;
		if(check == 1) {
			dto = dao.getuserCont2(user_name);
			forward.setRedirect(false);
			request.setAttribute("userContent", dto);
			request.setAttribute("searchKind", "pwd");
			forward.setPath("user/user_searchok.jsp");
		}
		else if(check == -1) {
			out.println("<script>");
			out.println("alert('전화번호 및 이메일 주소가 틀립니다.')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('검색된 회원의 이름이 존재하지 않습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}

		return forward;
	}

}
