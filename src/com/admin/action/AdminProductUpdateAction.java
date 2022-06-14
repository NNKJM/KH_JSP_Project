package com.admin.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.ProductDAO;
import com.market.model.ProductDTO;
public class AdminProductUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// get 방식으로 넘어온 제품번호에 해당하는 제품의 상세 내역을  DB에서 조회하여 수정 폼 페이지(view page)로 이동
		
		int product_num =  Integer.parseInt(request.getParameter("pnum").trim());
		
		ProductDAO dao = ProductDAO.getInstance();
		
		ProductDTO dto = dao.productContent(product_num);
		
		request.setAttribute("productCont", dto);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_product_update.jsp");
		
		return forward;
		
		
	}

}
