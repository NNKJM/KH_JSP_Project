package com.market.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.CartDAO;
import com.market.model.CartDTO;
import com.market.model.OrderDTO;
import com.market.model.UserDTO;

public class UserOrderMaybeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// session으로 id를 받아와서 해당 아이디의 장바구니 목록을 조회하여 view page로 이동
		
		HttpSession session = request.getSession();
		UserDTO userDto = (UserDTO)session.getAttribute("userCont");
		String userId = userDto.getUser_id();
		
		CartDAO dao = CartDAO.getInstance();
		
		List<CartDTO> list = dao.getCartList(userId);
		
		request.setAttribute("cartList", list);
		request.setAttribute("userDTO", userDto);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_payment.jsp");
		
		return forward;
	}
}
