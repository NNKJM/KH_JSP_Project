package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.CategoryDAO;

public class AdminCategoryInputOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String category_code_head = request.getParameter("category_code_head").trim();
		String category_code_tail = request.getParameter("category_code_tail").trim();
		String category_code = category_code_head + category_code_tail.substring(0,3);
		
		String category_name = request.getParameter("category_name").trim();
		
		CategoryDAO dao = CategoryDAO.getInstance();
		
		int check = dao.insertCategory(category_code, category_name);

		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("alert('카테고리 등록 성공')");
			forward.setRedirect(true);
			forward.setPath("admin_category_list.do");
		} else {
			out.println("<script>");
			out.println("alert('카테고리 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}

}
