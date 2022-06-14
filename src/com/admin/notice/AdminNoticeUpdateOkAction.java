package com.admin.notice;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.notice.model.NoticeDAO;
import com.notice.model.NoticeDTO;

public class AdminNoticeUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 공지사항 수정 처리
		
		int no = Integer.parseInt(request.getParameter("notice_no"));
		String title = request.getParameter("notice_title");
		String content = request.getParameter("notice_content");
		
		NoticeDAO dao = NoticeDAO.getInstance();
		NoticeDTO dto = new NoticeDTO();
		dto.setNotice_no(no);
		dto.setNotice_title(title);
		dto.setNotice_content(content);
		
		// 공지사항 수정 메서드
		dao.updateNotice(dto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(true);
		forward.setPath("admin_notice_list.do");
		
		return forward;
	}

}
