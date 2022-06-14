package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.CategoryDAO;
import com.market.model.CategoryDTO;

public class AdminCategoryUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int category_num = Integer.parseInt(request.getParameter("num").trim());
		CategoryDAO dao = CategoryDAO.getInstance();
		CategoryDTO dto = dao.categoryContent(category_num);
		
		request.setAttribute("Cont", dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("admin/admin_category_update.jsp");
		
		return forward;
	}

}
