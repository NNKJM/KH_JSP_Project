package com.admin.notice;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.notice.model.NoticeDAO;

public class AdminInquiryDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 1:1 문의 내역 삭제
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		NoticeDAO dao = NoticeDAO.getInstance();
		dao.deleteInquiry(no);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("admin_inquiry_list.do");
		
		return forward;
	}
}
