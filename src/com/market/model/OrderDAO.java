package com.market.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OrderDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = null;
	
	// DAO 싱글톤 방식으로 만들기
	private static OrderDAO instance = null;
	
	private OrderDAO() {	}
	
	// getInstance() 메서드
	public static OrderDAO getInstance() {
		
		if(instance == null) {
			instance = new OrderDAO();
		}
		
		return instance;
	}	// getInstance() 메서드 end

	
	// DB 연동 메서드
	
	public void openConn() {
		
		try {
			// 1단계 : JNDI 서버 객체 생성
			Context ctx = new InitialContext();
			
			// 2단계 : lookup() 메서드로 매칭되는 커넥션 찾기
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			
			// 3단계 : DataSource 객체를 이용하여 커넥션 객체 가져오기
			con = ds.getConnection();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}// openConn() 메서드 end
	
	
	// DB 연결 자원 종료
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {
		
		try {
			if(rs != null) {
				rs.close();
			}
			
			if(pstmt != null) {
				pstmt.close();
			}
			
			if(con != null) {
				con.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	// closeConn() 메서드 end

	
	// 주문 리스트 저장 메서드
	public int insertOrder(List<CartDTO> list, UserDTO dto) {
		
		int result = 0, count = 0, group = 0;
		
		try {
			openConn();
			
			sql = "select max(order_group) from order_market";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				group = rs.getInt(1) + 1;
			}
			
			for(int i=0; i<list.size(); i++) {
				
				sql = "select max(order_num) from order_market";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1) + 1;
				}
				
				sql = "insert into order_market values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, count);
				pstmt.setInt(2, group);
				pstmt.setString(3, dto.getUser_id());
				pstmt.setString(4, dto.getUser_address());
				pstmt.setString(5, dto.getUser_detailaddress());
				pstmt.setInt(6, list.get(i).getCart_pnum());
				pstmt.setString(7, list.get(i).getCart_pname());
				pstmt.setString(8, list.get(i).getCart_pimage());
				int amount = list.get(i).getCart_pqty();
				pstmt.setInt(9, amount);
				int price = list.get(i).getCart_price();
				pstmt.setInt(10, price);
				pstmt.setInt(11, (amount * price));
				
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}	// insertOrder() 메서드 end
	
	
	// 주문 내역 메서드
	public List<OrderDTO> getOrderList(String id){
		
		List<OrderDTO> list = new ArrayList<OrderDTO>();
		
		int group = 0;
		
		try {
			openConn();
			
			sql = "select max(order_group) from order_market";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				group = rs.getInt(1);
			}
			
			sql = "select * from order_market where order_userId = ? and order_group = ? order by order_num desc";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, group);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				OrderDTO dto = new OrderDTO();
				
				dto.setOrder_num(rs.getInt("order_num"));
				dto.setOrder_group(rs.getInt("order_group"));
				dto.setOrder_userId(rs.getString("order_userid"));
				dto.setOrder_userAddr(rs.getString("order_useraddr"));
				dto.setOrder_detailAddr(rs.getString("order_detailAddr"));
				dto.setOrder_pnum(rs.getInt("order_pnum"));
				dto.setOrder_pname(rs.getString("order_pname"));
				dto.setOrder_image(rs.getString("order_image"));
				dto.setOrder_pqty(rs.getInt("order_pqty"));
				dto.setOrder_price(rs.getInt("order_price"));
				dto.setOrder_total(rs.getInt("order_total"));
				dto.setOrder_date(rs.getString("order_date"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	}	// getOrderList() 메서드 end
	
	
	// 일 매출 메서드
	public SalesDTO getTodaySales(String today){
		
		SalesDTO dto = new SalesDTO();
		
		try {
			openConn();
			
			sql = "select count(distinct order_group) "
					+ "from order_market "
					+ "where to_char(order_date, 'YYYY-mm-dd') = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, today);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setSales_count(rs.getInt(1));
			}
			
			sql = "select sum(order_total) "
					+ "from order_market "
					+ "where to_char(order_date, 'YYYY-mm-dd') = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, today);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setSales_total(rs.getInt(1));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return dto;
	}	// getTodaySales() 메서드 end
	
	
	// 월 매출 
	public int getMonthlyTotal(String month) {
		int total = 0;
		
		try {
			openConn();
			
			sql = "select sum(order_total) "
					+ "from order_market "
					+ "where to_char(order_date, 'YYYY-mm') = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, month);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return total;
	}
	
	// 월 주문 건수
	public int getMonthlyCount(String month) {
		int count = 0;
		
		try {
			openConn();
			
			sql = "select count(distinct order_group) "
					+ "from order_market "
					+ "where to_char(order_date, 'YYYY-mm') = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, month);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return count;
	}
	
}
