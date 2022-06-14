package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.CategoryDAO;
import com.market.model.CategoryDTO;

public class AdminCategoryListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		CategoryDAO dao = CategoryDAO.getInstance();
		List<CategoryDTO> list = dao.getCategoryList("");
		request.setAttribute("categoryList", list);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("admin/admin_category_list.jsp");
		
		return forward;
	}

}
