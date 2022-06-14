package com.admin.notice;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.notice.model.InquiryDTO;
import com.notice.model.NoticeDAO;

public class AdminInquiryReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 1:1 문의 내역 조회 후 답변 페이지로 이동
		
		int no = Integer.parseInt(request.getParameter("no"));
		String reply_text = request.getParameter("reply_text");
		
		NoticeDAO dao = NoticeDAO.getInstance();
		
		// 1:1 문의에 답변 달기
		dao.inquiryReply(no, reply_text);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("admin_inquiry_list.do");
		
		return forward;
	}

}
