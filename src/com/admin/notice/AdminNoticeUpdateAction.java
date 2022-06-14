package com.admin.notice;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.notice.model.NoticeDAO;
import com.notice.model.NoticeDTO;

public class AdminNoticeUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 공지사항 수정 폼 페이지
		int no = Integer.parseInt(request.getParameter("no"));
		
		NoticeDAO dao = NoticeDAO.getInstance();
		NoticeDTO dto = dao.getNoticeDetail(no);
		
		request.setAttribute("list", dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("admin/admin_notice_update.jsp");
		
		return forward;
	}
}
