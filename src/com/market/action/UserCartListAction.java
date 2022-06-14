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
import com.market.model.UserDTO;

public class UserCartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// session으로 id를 받아와서 해당 아이디의 장바구니 목록을 조회하여 view page로 이동
		
		HttpSession session = request.getSession();
		UserDTO userDto = (UserDTO)session.getAttribute("userCont");
		
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(userDto != null) {
			
			String userId = userDto.getUser_id();
			String userAddr = userDto.getUser_address();
			String userDAddr = userDto.getUser_detailaddress();
			CartDAO dao = CartDAO.getInstance();
			
			List<CartDTO> list = dao.getCartList(userId);
			
			request.setAttribute("cartList", list);
			request.setAttribute("userAddr", userAddr);
			request.setAttribute("userDAddr", userDAddr);
			
			forward.setRedirect(false);
			forward.setPath("user/user_cart_list.jsp");
			
			return forward;
			
		} else {
			out.println("<script>");
			out.println("alert('로그인하셔야 본 서비스를 이용하실 수 있습니다')");
			out.println("location.href='user_login.do'");
			out.println("</script>");
			
			return null;
		}
		
	}

}
