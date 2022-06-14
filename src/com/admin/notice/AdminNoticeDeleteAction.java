package com.admin.notice;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.notice.model.NoticeDAO;

public class AdminNoticeDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 공지사항 삭제
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		NoticeDAO dao = NoticeDAO.getInstance();
		
		// 공지사항 삭제 메서드
		dao.deleteNotice(no);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("admin_notice_list.do");
		
		return forward;
	}

}
