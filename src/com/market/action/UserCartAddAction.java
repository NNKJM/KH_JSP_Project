package com.market.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.CartDAO;
import com.market.model.CartDTO;

public class UserCartAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 상품 상세 페이지에서 장바구니 추가
		
		int cart_pnum = Integer.parseInt(request.getParameter("pnum").trim());
		String cart_userId = request.getParameter("userId").trim();
		String cart_pname = request.getParameter("pname").trim();
		int cart_pqty = Integer.parseInt(request.getParameter("pqty").trim());
		int cart_price = Integer.parseInt(request.getParameter("price").trim());
		String cart_pspec = request.getParameter("pspec").trim();
		String cart_pimage = request.getParameter("pimage").trim();
		
		CartDTO dto = new CartDTO();
		dto.setCart_pnum(cart_pnum);
		dto.setCart_userId(cart_userId);
		dto.setCart_pname(cart_pname);
		dto.setCart_pqty(cart_pqty);
		dto.setCart_price(cart_price);
		dto.setCart_pspec(cart_pspec);
		dto.setCart_pimage(cart_pimage);
		
		CartDAO dao = CartDAO.getInstance();
		int check = dao.insertCart(dto);
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			// 그냥 그 페이지에 남아서 쇼핑을 계속할지? 장바구니 리스트로 넘어갈지?
			// out.println("alert('장바구니에 상품을 담았습니다.')");
			forward.setRedirect(true);
			forward.setPath("user_cart_list.do");
		}else {
			out.println("<script>");
			out.println("alert('장바구니 추가 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
