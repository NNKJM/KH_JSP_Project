package com.market.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.CartDAO;
import com.market.model.CartDTO;
import com.market.model.OrderDAO;
import com.market.model.UserDTO;

public class UserOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 1. 장바구니 리스트 불러오기
		// 2. 장바구니 리스트를 결제 테이블에 저장
		// 3. 장바구니 초기화
		// 4. 주문내역 페이지로 이동
		
		HttpSession session = request.getSession();
		UserDTO userDto = (UserDTO)session.getAttribute("userCont");
		String userId = userDto.getUser_id();
		
		CartDAO dao = CartDAO.getInstance();
		List<CartDTO> list = dao.getCartList(userId);
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		int check = orderDAO.insertOrder(list, userDto);
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			dao.deleteAllCart(userId);
			forward.setRedirect(true);
			forward.setPath("user_order_list.do");
		}else {
			out.println("<script>");
			out.println("alert('결제 오류 발생!')");
			out.println("</script>");
		}
		
		return forward;
	}

}
