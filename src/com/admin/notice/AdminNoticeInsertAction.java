package com.admin.notice;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.AdminDTO;
import com.notice.model.NoticeDAO;

public class AdminNoticeInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 관리자 공지사항 등록
		PrintWriter out = response.getWriter();
		ActionForward forward = new ActionForward();

		String notice_title = request.getParameter("notice_title");
		String notice_content = request.getParameter("notice_content");
		
		HttpSession session = request.getSession();
		AdminDTO adminDTO = (AdminDTO) session.getAttribute("adminCont");
		
		NoticeDAO dao = NoticeDAO.getInstance();
		
		try {
			int result = dao.insertNotice(adminDTO, notice_title, notice_content);
			
			if(result > 0) {
				out.println("<script>");
				out.println("alert('공지사항이 등록되었습니다.')");
				out.println("</script>");
				
				forward.setRedirect(true);
				forward.setPath("admin_notice_list.do");
			} else {
				out.println("<script>");
				out.println("alert('공지사항 등록에 실패하였습니다.')");
				out.println("history.back()");
				out.println("</script>");
			}
		} catch (NullPointerException e) {
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("location.href='admin_login.do'");
			out.println("</script>");
		}
		
		return forward;
	}

}
