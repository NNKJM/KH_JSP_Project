package com.admin.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.notice.model.NoticeDAO;
import com.notice.model.NoticeDTO;

public class AdminNoticeListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 공지사항 버튼 클릭 시 공지사항 목록을 조회
		
		List<NoticeDTO> list = null;
		HttpSession session = request.getSession();
		String num, title, date, hit = "";

		num = request.getParameter("num"); 		// 번호순
		title = request.getParameter("title");	// 제목순
		date = request.getParameter("date");	// 작성일순
		hit = request.getParameter("hit");		// 조회수순
		
		System.out.println("::::::::::::::::::::::");
		System.out.println("num : " + num + " / title : " + title + " / date : " + date + " / hit : " + hit);
		
		int rowsize = 10; 		// 한 페이지당 보여질 게시물의 수
		int block = 5;	 		// 아래에 보여질 페이지의 최대 수
		int totalRecord = 0; 	// DB 상의 게시물의 전체 수
		int allPage = 0;		// 전체 페이지 수 
		
		int page = 0;			// 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1;
		}
		
		// 해당 페이지에서의 시작 번호
		int startBlock = page - ((page - 1) % block);
		
		// 해당 페이지에서 끝 블럭
		int endBlock = (((page - 1) / block) * block) + block;
		
		NoticeDAO dao = NoticeDAO.getInstance();
		
		// DB상의 전체 게시물 수
		totalRecord = dao.getBoardCount();	

		allPage = (int) Math.ceil(totalRecord / (double)rowsize); 
		
		if(endBlock > allPage) {
			endBlock = allPage;
		}
		
		// 1. 해당 정렬 컬럼을 처음 클릭했을 경우 ==> val != null
		// 2. 해당 컬럼을 가지고 페이징 처리를 할 경우 모든 값이 null이므로 session을 가지고 처리
		// 3. 중간에 다른 컬럼을 클릭할 경우 이전 세션의 내용으로 인해 해당 컬럼을 제외한 다른 값들은 null이라는 조건을 세워줘야 한다.
		if((num != null ||
				((num == null && session.getAttribute("num") != null)
						&& title == null && date == null && hit == null))) {
			if(session.getAttribute("num") == null) {
				session.removeAttribute("title");
				session.removeAttribute("date");
				session.removeAttribute("hit");
				session.setAttribute("num", num);
			}
			System.out.println("page : " + page + " / rowsize : " + rowsize + " / val : " + session.getAttribute("num"));
			list = dao.getNoticeList(page, rowsize, (String)session.getAttribute("num"));
			
		} else if ((title != null ||
				((title == null && session.getAttribute("title") != null)
						&& num == null && date == null && hit == null))) {
			if(session.getAttribute("title") == null) {
				session.removeAttribute("num");
				session.removeAttribute("date");
				session.removeAttribute("hit");
				session.setAttribute("title", title);
			}
			System.out.println("page : " + page + " / rowsize : " + rowsize + " / val : " + session.getAttribute("title"));
			list = dao.getNoticeList(page, rowsize, (String)session.getAttribute("title"));
			
		} else if ((date != null ||
				((date == null && session.getAttribute("date") != null)
						&& title == null && num == null && hit == null))) {
			if(session.getAttribute("date") == null) {
				session.removeAttribute("num");
				session.removeAttribute("title");
				session.removeAttribute("hit");
				session.setAttribute("date", date);
			}
			System.out.println("page : " + page + " / rowsize : " + rowsize + " / val : " + session.getAttribute("date"));
			list = dao.getNoticeList(page, rowsize, (String)session.getAttribute("date"));
			
		} else if ((hit != null ||
				((hit == null && session.getAttribute("hit") != null)
						&& title == null && date == null && num == null))) {
			if(session.getAttribute("hit") == null) {
				session.removeAttribute("num");
				session.removeAttribute("title");
				session.removeAttribute("date");
				session.setAttribute("hit", hit);
			}
			System.out.println("page : " + page + " / rowsize : " + rowsize + " / val : " + session.getAttribute("hit"));
			list = dao.getNoticeList(page, rowsize, (String)session.getAttribute("hit"));
			
		} else {
			list = dao.getNoticeList(page, rowsize, "");
		}
		
		// 데이터 view 이동
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("noticeList", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath("admin/admin_notice_main.jsp");
		
		return forward;
	}

}
