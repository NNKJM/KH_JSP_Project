package com.user.notice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.UserDTO;
import com.notice.model.InquiryDTO;
import com.notice.model.NoticeDAO;

public class UserInquiryListAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 1:1 문의 리스트 목록
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		try {
			// 해당 회원의 문의 목록만 조회
			HttpSession session = request.getSession();
			UserDTO userDTO = (UserDTO) session.getAttribute("userCont");
			
			// 문의 리스트 조회
			NoticeDAO dao = NoticeDAO.getInstance();
			List<InquiryDTO> dto = dao.getInquiryList(userDTO.getUser_id());
			
			request.setAttribute("inquiryList", dto);
			
			forward.setRedirect(false);
			forward.setPath("notice/notice_inquiry_list.jsp");
			
		} catch (NullPointerException e) {
			out.println("<script>");
			out.println("alert('로그인이 필요합니다.')");
			out.println("location.href='user/user_login.jsp'");
			out.println("</script>");
		}
		return forward;
	}

}
