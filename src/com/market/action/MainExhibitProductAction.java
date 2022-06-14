package com.market.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.CategoryDAO;
import com.market.model.CategoryDTO;
import com.market.model.ProductDAO;
import com.market.model.ProductDTO;

public class MainExhibitProductAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String code;
		try {
			code = request.getParameter("code").trim() + "%";
		} catch (NullPointerException e) {
			code = "%";
		}

		ProductDAO dao1 = ProductDAO.getInstance();
		List<ProductDTO> plist = dao1.getProductList(code);
		
		CategoryDAO dao2 = CategoryDAO.getInstance();
		
		List<CategoryDTO> clist_A001 = dao2.getCategoryList("A001");
		List<CategoryDTO> clist_A002 = dao2.getCategoryList("A002");
		List<CategoryDTO> clist_A003 = dao2.getCategoryList("A003");
		List<CategoryDTO> clist_A004 = dao2.getCategoryList("A004");
		
		List<CategoryDTO> clist_B001 = dao2.getCategoryList("B001");
		List<CategoryDTO> clist_B002 = dao2.getCategoryList("B002");
		List<CategoryDTO> clist_B003 = dao2.getCategoryList("B003");
		
		List<CategoryDTO> clist_C001 = dao2.getCategoryList("C001");
		List<CategoryDTO> clist_C002 = dao2.getCategoryList("C002");
		
		List<CategoryDTO> clist_D001 = dao2.getCategoryList("D001");
		List<CategoryDTO> clist_D002 = dao2.getCategoryList("D002");
		List<CategoryDTO> clist_D003 = dao2.getCategoryList("D003");
		
		List<CategoryDTO> clist_Z001 = dao2.getCategoryList("Z001");
		
		request.setAttribute("pList", plist);
		
		request.setAttribute("cList_A001", clist_A001);
		request.setAttribute("cList_A002", clist_A002);
		request.setAttribute("cList_A003", clist_A003);
		request.setAttribute("cList_A004", clist_A004);
		
		request.setAttribute("cList_B001", clist_B001);
		request.setAttribute("cList_B002", clist_B002);
		request.setAttribute("cList_B003", clist_B003);
		
		request.setAttribute("cList_C001", clist_C001);
		request.setAttribute("cList_C002", clist_C002);
		
		request.setAttribute("cList_D001", clist_D001);
		request.setAttribute("cList_D002", clist_D002);
		request.setAttribute("cList_D003", clist_D003);

		request.setAttribute("cList_Z001", clist_Z001);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("select/exhibit_product_list.jsp");
		
		return forward;
	}

}
