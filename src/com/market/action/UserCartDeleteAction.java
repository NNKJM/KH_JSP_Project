package com.market.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.CartDAO;

public class UserCartDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 카트 넘버를 받아와서 해당 넘버 조회 후 삭제
		
		int cart_num = Integer.parseInt(request.getParameter("num"));
		
		CartDAO dao = CartDAO.getInstance();
		int check = dao.deleteCart(cart_num);
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			forward.setRedirect(true);
			forward.setPath("user_cart_list.do");
		}else {
			out.println("<script>");
			out.println("alert('장바구니 삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
