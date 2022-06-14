package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.CategoryDAO;
import com.market.model.CategoryDTO;

public class AdminCategoryUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String category_name = request.getParameter("category_name").trim();
		int category_num = Integer.parseInt(request.getParameter("category_num").trim());
		
		CategoryDTO dto = new CategoryDTO();
		dto.setCategory_name(category_name);
		dto.setCategory_num(category_num);
		CategoryDAO dao = CategoryDAO.getInstance();
		
		int check = dao.updateCategory(dto);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			forward.setRedirect(true);
			forward.setPath("admin_category_list.do");
		} else {
			out.println("<script>");
			out.println("alert('카테고리 수정 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
	}
}
