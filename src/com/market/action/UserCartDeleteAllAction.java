package com.market.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.CartDAO;
import com.market.model.UserDTO;

public class UserCartDeleteAllAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 세션으로 아이디 받아와서 해당하는 장바구니를 비우는 로직
		
		HttpSession session = request.getSession();
		UserDTO userDto = (UserDTO)session.getAttribute("userCont");
		String userId = userDto.getUser_id();
		
		CartDAO dao = CartDAO.getInstance();
		int check = dao.deleteAllCart(userId);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			forward.setRedirect(true);
			forward.setPath("user_cart_list.do");
		}else {
			out.println("<script>");
			out.println("alert('장바구니 초기화 실패!')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
