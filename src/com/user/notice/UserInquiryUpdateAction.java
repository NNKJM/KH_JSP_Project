package com.user.notice;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.notice.model.InquiryDTO;
import com.notice.model.NoticeDAO;

public class UserInquiryUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 1:1 문의 수정
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		NoticeDAO dao = NoticeDAO.getInstance();
		InquiryDTO dto = dao.getInquiryDetail(no);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/notice/notice_inquiry_update.jsp");
		
		return forward;
	}

}
