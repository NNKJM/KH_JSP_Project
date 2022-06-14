package com.admin.notice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.notice.model.NoticeDAO;
import com.notice.model.NoticeDTO;

public class AdminNoticeSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 공지사항 검색 시 해당 목록 출력
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		String[] search_field = request.getParameterValues("search_field");
		String search_keyword = request.getParameter("search_keyword"); 
		
		try {
			int rowsize = 10; 		// 한 페이지당 보여질 게시물의 수
			int block = 5;	 		// 아래에 보여질 페이지의 최대 수
			int totalRecord = 0; 	// DB 상의 게시물의 전체 수
			int allPage = 0;		// 전체 페이지 수 
			
			int page = 0;			// 현재 페이지 변수
			
			if(request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			} else { page = 1; }
			
			// 해당 페이지에서의 시작 번호
			int startBlock = page - ((page - 1) % block);
			
			// 해당 페이지에서 끝 블럭
			int endBlock = (((page - 1) / block) * block) + block;
			
			NoticeDAO dao = NoticeDAO.getInstance();
			// 검색 레코드 총 개수
			totalRecord = dao.searchListCount(search_field, search_keyword);
			
			allPage = (int) Math.ceil(totalRecord / (double) rowsize);

			if (endBlock > allPage) { endBlock = allPage; }
			
			if(search_field != null) { // 체크 1개 이상
				List<NoticeDTO> dto = dao.searchNotice(search_field, search_keyword, page, rowsize);
				
				if(dto.size() == 0) { // 검색된 항목이 없음
					out.println("<script>");
					out.println("alert('검색된 항목이 없습니다.')");
					out.println("history.back()");
					out.println("</script>");
				} else {
					request.setAttribute("page", page);
					request.setAttribute("rowsize", rowsize);
					request.setAttribute("block", block);
					request.setAttribute("totalRecord", totalRecord);
					request.setAttribute("allPage", allPage);
					request.setAttribute("startBlock", startBlock);
					request.setAttribute("endBlock", endBlock);
					request.setAttribute("noticeList", dto);
					request.setAttribute("search_keyword", search_keyword);

					for(int i = 0; i < search_field.length; i++) { // 검색 유지 페이징 처리
						request.setAttribute("search_field"+i, search_field[i]);
					}
					
					forward.setRedirect(false);
					forward.setPath("admin/admin_notice_search.jsp");
				}
			}
		} catch (NullPointerException e) { // 검색 항목을 체크 안했을 경우
			out.println("<script>");
			out.println("alert('검색 항목을 체크해 주세요.')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}
}
