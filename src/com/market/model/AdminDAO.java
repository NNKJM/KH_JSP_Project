package com.market.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AdminDAO {
	Connection con = null;                      // DB 연결하는 객체.
	PreparedStatement pstmt = null;             // DB에 SQL문을 전송하는 객체.
	ResultSet rs = null;                        // SQL문을 실행 후 결과 값을 가지고 있는 객체.

	String sql = null;                          // SQL문을 저장할 객체.

	// AdminDAO 객체를 싱글턴 방식으로 만들어 보자.
	// 1단계 : 싱글톤 방식으로 객체를 만들기 위해서는 우선적으로
	//       기본 생성자의 접근 제어자를 public에서 private으로 바꿔 주어야 한다.

	// 2단계 : AdminDAO 객체를 정적 멤버로 선언해 주어야 한다. - static으로 선언해야 함.
	private static AdminDAO instance;

	private AdminDAO() {  }   // 기본 생성자


	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 라는 메서드를
	// 만들어서 이 getInstance() 메서드에 외부에서 접근할 수 있게 해야 함.
	public static AdminDAO getInstance() {

		if(instance == null) {
			instance = new AdminDAO();
		}
		return instance;

	}

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
	}
	//DB에 연결된 자원을 종료하는 메서드
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {


		try {
			if(rs !=null) {
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


	}//closeConn() 메서드 end


	public int adminLogin(String id,String pwd) {
		int result = 0;

		try {
			openConn();

			sql = "select *from admin_market where admin_id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				if(pwd.equals(rs.getString("admin_pwd"))) {
					result = 1;
				}else {
					result = -1;
				}
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}

	public AdminDTO getAdminCont(String id) {
		AdminDTO dto = new AdminDTO();

		try {
			openConn();

			sql = "select *from admin_market where admin_id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if(rs.next()) {
				dto.setAdmin_id(id);
				dto.setAdmin_pwd(rs.getString("admin_pwd"));
				dto.setAdmin_name(rs.getString("admin_name"));
				dto.setAdmin_email(rs.getString("admin_email"));
				dto.setAdmin_date(rs.getString("admin_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}

		return dto;

	}
}