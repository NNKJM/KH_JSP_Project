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

public class UserModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int user_no = Integer.parseInt(request.getParameter("user_no").trim());
		String user_id = request.getParameter("user_id").trim();
		String user_pwd1 = request.getParameter("user_pwd1").trim();
		String user_name = request.getParameter("user_name").trim();
		String user_email = request.getParameter("user_email").trim();
		String user_phone = request.getParameter("user_phone").trim();
		String user_jibunAddress = request.getParameter("user_jibunAddress").trim();
		String user_detailAddress = request.getParameter("user_detailAddress").trim();
		String user_gender = request.getParameter("user_gender").trim();
		String user_birth_year = request.getParameter("user_birth_year").trim();
		String user_birth_month = request.getParameter("user_birth_month").trim();
		String user_birth_day = request.getParameter("user_birth_day").trim();
		
		System.out.println(user_gender);
		
		UserDTO dto = new UserDTO();
		dto.setUser_no(user_no);
		dto.setUser_id(user_id);
		dto.setUser_pwd(user_pwd1);
		dto.setUser_name(user_name);
		dto.setUser_email(user_email);
		dto.setUser_phone(user_phone);
		dto.setUser_address(user_jibunAddress);
		dto.setUser_detailaddress(user_detailAddress);
		dto.setUser_gender(user_gender);
		
		UserDAO dao = UserDAO.getInstance();
		
		int check = dao.userModify(dto);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		
		if(check == 1) {
			HttpSession session = request.getSession();
			session.invalidate();
			
			dto = dao.getuserCont(user_id);
			session = request.getSession();
			session.setAttribute("userCont", dto);
			forward.setRedirect(false);
			forward.setPath("user/user_modify.jsp");
		}else {
			out.println("<script>");
			out.println("alert('회원정보 수정 실패~')");
			out.println("history.back()");
			out.println("</script>");
		}

		return forward;
	}

}
