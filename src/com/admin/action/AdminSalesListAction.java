package com.admin.action;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.OrderDAO;
import com.market.model.SalesDTO;

public class AdminSalesListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 매출현황을 불러오는 로직
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String format_now = now.format(formatter);
		
		// 일일 조회
		String searchDate = request.getParameter("date");
		if(searchDate != null) {
			format_now = searchDate;
		}
		
		OrderDAO dao = OrderDAO.getInstance();
		SalesDTO todaySales = dao.getTodaySales(format_now);
		
		// 월 조회
		DateTimeFormatter month_format = DateTimeFormatter.ofPattern("yyyy-MM");
		String monthValue = now.format(month_format);
		
		int monthlyTotal =  dao.getMonthlyTotal(monthValue);
		int monthlyCount =  dao.getMonthlyCount(monthValue);
		
		request.setAttribute("monthlyTotal", monthlyTotal);
		request.setAttribute("monthlyCount", monthlyCount);
		request.setAttribute("todaySales", todaySales);
		request.setAttribute("today", format_now);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("admin/admin_sales_list.jsp");
		
		return forward;
	}

}
