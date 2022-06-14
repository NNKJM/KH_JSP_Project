package com.market.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.ProductDAO;
import com.market.model.ProductDTO;

public class MainFamousProductAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		ProductDAO dao = ProductDAO.getInstance();
		
		List<ProductDTO> list = dao.getFamousProduct();
		
		request.setAttribute("FamousList", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("select/famous_product_list.jsp");
		
		return forward;
	}
}
