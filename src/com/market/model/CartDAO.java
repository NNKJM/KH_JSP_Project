package com.market.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CartDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = null;
	
	// DAO 싱글톤 방식으로 만들기
	private static CartDAO instance = null;
	
	private CartDAO() {	}
	
	// getInstance() 메서드
	public static CartDAO getInstance() {
		
		if(instance == null) {
			instance = new CartDAO();
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

	
	// 장바구니 리스트를 받아오는 메세드
	public List<CartDTO> getCartList(String id) {
		
		List<CartDTO> list = new ArrayList<CartDTO>();
		
		try {
			openConn();
			
			sql = "select * from cart_market where cart_userId = ? order by cart_num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CartDTO dto = new CartDTO();
				dto.setCart_num(rs.getInt("cart_num"));
				dto.setCart_pnum(rs.getInt("cart_pnum"));
				dto.setCart_userId(rs.getString("cart_userId"));
				dto.setCart_pname(rs.getString("cart_pname"));
				dto.setCart_pqty(rs.getInt("cart_pqty"));
				dto.setCart_price(rs.getInt("cart_price"));
				dto.setCart_pspec(rs.getString("cart_pspec"));
				dto.setCart_pimage(rs.getString("cart_pimage"));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	}	// getCartList() 메서드 end


	// 장바구니 아이템 삭제 메서드
	public int deleteCart(int no) {
		
		int result = 0;
		
		try {
			openConn();
			
			sql = "delete from cart_market where cart_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
			
			sql = "update cart_market set cart_num = cart_num - 1 where cart_num > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}	// deleteCart() 메서드 end


	// 장바구니 추가 메서드
	public int insertCart(CartDTO dto) {
		
		int result = 0, count = 0;
		
		try {
			openConn();
			
			sql = "select max(cart_num) from cart_market";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
			
			sql = "insert into cart_market values(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, dto.getCart_pnum());
			pstmt.setString(3, dto.getCart_userId());
			pstmt.setString(4, dto.getCart_pname());
			pstmt.setInt(5, dto.getCart_pqty());
			pstmt.setInt(6, dto.getCart_price());
			pstmt.setString(7, dto.getCart_pspec());
			pstmt.setString(8, dto.getCart_pimage());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}	// insertCart() 메서드 end


	// 장바구니를 비우는 메서드
	public int deleteAllCart(String id) {
		
		int result = 0;
		
		try {
			openConn();
			
			sql = "delete cart_market where cart_userId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}	// DeleteAllCart() 메소드 end
	
}
