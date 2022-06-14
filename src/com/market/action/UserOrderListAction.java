package com.market.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.OrderDAO;
import com.market.model.OrderDTO;
import com.market.model.UserDTO;

public class UserOrderListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 주문리스트 불러와서 뷰 페이지로 넘기기
		
		HttpSession session = request.getSession();
		UserDTO userDto = (UserDTO)session.getAttribute("userCont");
		String userId = userDto.getUser_id();
		
		OrderDAO dao = OrderDAO.getInstance();
		List<OrderDTO> list = dao.getOrderList(userId);
		
		request.setAttribute("userDTO", userDto);
		request.setAttribute("orderList", list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("user/user_order_list.jsp");
		
		return forward;
	}

}
