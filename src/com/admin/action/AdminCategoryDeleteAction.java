package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.CategoryDAO;

public class AdminCategoryDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int category_num = Integer.parseInt(request.getParameter("num").trim());
		
		CategoryDAO dao = CategoryDAO.getInstance();
		int check = dao.deleteCategory(category_num);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('카테고리 삭제 성공')");
			out.println("</script>");
			forward.setRedirect(true);
			forward.setPath("admin_category_list.do");
		} else {
			out.println("<script>");
			out.println("alert('카테고리 삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
