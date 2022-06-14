package com.market.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.AdminDAO;
import com.market.model.AdminDTO;

public class AdminLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 기존 로그인 유저가 있다면 세션을 종료한다.
		// 로그인 완료시 관리자 세션으로 진입하기 위해

		HttpSession session = request.getSession();
		session.invalidate();

		String admin_id =request.getParameter("admin_id").trim();
		String admin_pwd =request.getParameter("admin_pwd").trim();

		AdminDAO dao = AdminDAO.getInstance();

		int check = dao.adminLogin(admin_id,admin_pwd);

		ActionForward forward = new ActionForward();

		PrintWriter out = response.getWriter();

		if(check>0) {
			AdminDTO dto = dao.getAdminCont(admin_id);
			session = request.getSession();
			session.setAttribute("adminCont", dto);
			forward.setRedirect(false);
			forward.setPath("admin/admin_main.jsp");

		}else if(check ==-1){
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다. 다시확인해 주세요')");
			out.println("history.back()");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('아이디가틀립니다. 다시확인해 주세요')");
			out.println("history.back()");
			out.println("</script>");
		}

		return forward;
	}

}