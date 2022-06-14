package com.market.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
	Connection con = null;                      // DB 연결하는 객체.
	PreparedStatement pstmt = null;             // DB에 SQL문을 전송하는 객체.
	ResultSet rs = null;                        // SQL문을 실행 후 결과 값을 가지고 있는 객체.

	String sql = null;                          // SQL문을 저장할 객체.

	// UserDAO 객체를 싱글턴 방식으로 만들어 보자.
	// 1단계 : 싱글톤 방식으로 객체를 만들기 위해서는 우선적으로
	//       기본 생성자의 접근 제어자를 public에서 private으로 바꿔 주어야 한다.

	// 2단계 : UserDAO 객체를 정적 멤버로 선언해 주어야 한다. - static으로 선언해야 함.
	private static UserDAO instance;

	private UserDAO() {  }   // 기본 생성자


	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 라는 메서드를
	// 만들어서 이 getInstance() 메서드에 외부에서 접근할 수 있게 해야 함.
	public static UserDAO getInstance() {

		if(instance == null) {
			instance = new UserDAO();
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
	
	public int checkUserId(String userId) {
		int result = 0;
		try {
			openConn();
			
			sql = "select *from user_market where user_id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	
	public int checkUserEmail(String email) {
		int result = 0;
		try {
			openConn();
			
			sql = "select *from user_market where user_email = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	
	public int insertUser(UserDTO dto) {
		int result = 0, count = 0;
		
		try {
			openConn();
			sql = "select max(user_no) from user_market";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1)+1;
			}
			
			sql = "insert into user_market values(?, ?, ?, ?, ?, ?, ?, ?, ? ,sysdate,'')";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getUser_id());
			pstmt.setString(3, dto.getUser_pwd());
			pstmt.setString(4, dto.getUser_name());
			pstmt.setString(5, dto.getUser_gender());
			pstmt.setString(6, dto.getUser_email());
			pstmt.setString(7, dto.getUser_address());
			pstmt.setString(8, dto.getUser_detailaddress());
			pstmt.setString(9, dto.getUser_phone());
			
			result = pstmt.executeUpdate();
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int userLogin(String id,String pwd) {
		int result = 0;
		
		try {
			openConn();
			
			sql = "select *from user_market where user_id = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pwd.equals(rs.getString("user_pwd"))) {
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
	
	public UserDTO getuserCont(String id) {
		UserDTO dto = new UserDTO();
		
		try {
			openConn();
			
			sql = "select *from user_market where user_id = ?";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setUser_no(rs.getInt("user_no"));
				dto.setUser_id(id);
				dto.setUser_pwd(rs.getString("user_pwd"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_gender(rs.getString("user_gender"));
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_address(rs.getString("user_address"));
				dto.setUser_detailaddress(rs.getString("user_detailaddress"));
				dto.setUser_phone(rs.getString("user_phone"));
				dto.setUser_date(rs.getString("user_date"));
				dto.setUser_update(rs.getString("user_update"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}
	
	public UserDTO getuserCont2(String name) {
		UserDTO dto = new UserDTO();
		
		try {
			openConn();
			
			sql = "select *from user_market where user_name = ?";
			
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, name);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setUser_no(rs.getInt("user_no"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pwd(rs.getString("user_pwd"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_gender(rs.getString("user_gender"));
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_address(rs.getString("user_address"));
				dto.setUser_detailaddress(rs.getString("user_detailaddress"));
				dto.setUser_phone(rs.getString("user_phone"));
				dto.setUser_date(rs.getString("user_date"));
				dto.setUser_update(rs.getString("user_update"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}
	
	
	public int userIdsearch1(String name,String phone) {
		int result = 0;
		
		try {
			openConn();
			
			sql = "select *from user_market where user_name = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(phone.equals(rs.getString("user_phone"))) {
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
	
	public int userIdsearch2(String name,String email) {
		int result = 0;
		
		try {
			openConn();
			
			sql = "select *from user_market where user_name = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(email.equals(rs.getString("user_email"))) {
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
	
	// 회원정보 수정
	public int userModify(UserDTO dto) {
		int result = 0;
		
		try {
			openConn();
			
			sql = "update user_market set user_pwd = ?, user_name = ?, user_email = ?, "
					+ "user_phone = ?, user_address = ?, user_detailaddress = ?, user_gender = ?, "
					+ "user_update = sysdate where user_no = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUser_pwd());
			pstmt.setString(2, dto.getUser_name());
			pstmt.setString(3, dto.getUser_email());
			pstmt.setString(4, dto.getUser_phone());
			pstmt.setString(5, dto.getUser_address());
			pstmt.setString(6, dto.getUser_detailaddress());
			pstmt.setString(7, dto.getUser_gender());
			pstmt.setInt(8, dto.getUser_no());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
		
	}
	
	// 회원 탈퇴
	public int userOut(int no) {
		int result = 0;
		try {
			openConn();
			
			sql = "delete from user_market where user_no = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
			
			sql = "update user_market set user_no = user_no -1 "
					+ "where user_no > ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	}
	
	// user_market 테이블의 전체 회원수를 확인하는 메서드.
	public int getUserCount() {
		int count = 0;
		try {
			openConn();
			
			sql = "select count(*) from user_market";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return count;
	}
	
	//user_market 테이블에서 현재 페이지에 해당하는 게시물을 조회하는 메서드
	public List<UserDTO> getUserList(int page,int rowsize){
		List<UserDTO> list = new ArrayList<UserDTO>();
		
		// 해당 페이지에서 시작 번호
		int startNo = (page * rowsize) - (rowsize - 1);
		
		// 해당 페이지에서 끝 번호
		int endNo = (page * rowsize);
		
		try {
			
			openConn();
			
			sql = "select *from (select row_number() over(order by user_no desc) rnum, b.*from user_market b) "
					+ "where rnum >= ? and rnum <= ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				dto.setUser_no(rs.getInt("user_no"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pwd(rs.getString("user_pwd"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_gender(rs.getString("user_gender"));
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_address(rs.getString("user_address"));
				dto.setUser_detailaddress(rs.getString("user_detailaddress"));
				dto.setUser_phone(rs.getString("user_phone"));
				dto.setUser_date(rs.getString("user_date"));
				dto.setUser_update(rs.getString("user_update"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	}
	
	// user_market 테이블의 전체 회원수를 검색을 통해 확인하는 메서드.
	public int searchUserCount(String field,String keyword) {
		int count = 0;
		
		try {
			openConn();
			
			if(field.equals("id")) {
				sql = "select count(*) from user_market "
						+ "where user_id like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
			}else if(field.equals("name")) {
				sql = "select count(*) from user_market "
						+ "where user_name like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
			}else {
				sql = "select count(*) from user_market "
						+ "where user_id like ? or user_name like ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setString(2, "%"+keyword+"%");
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return count;
	}
	
	// 검색 페이지에 해당하는 유저리스트
		public List<UserDTO> getSearchUserList(String filed,String keyword,int page,int rowsize){
			List<UserDTO> list = new ArrayList<UserDTO>();
			
			int startNo = (page * rowsize) - (rowsize - 1);
			int endNo = (page * rowsize);
			
			
			try {
				openConn();
				
				if(filed.equals("id")) {
					sql = "select *from "
							+ "(select row_number() over(order by user_no desc) rnum, b.*from user_market b "
							+ "where user_id like ?)where rnum >= ? and rnum <= ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+keyword+"%");
					pstmt.setInt(2, startNo);
					pstmt.setInt(3, endNo);
				}else if(filed.equals("name")) {
					sql = "select *from "
							+ "(select row_number() over(order by user_no desc) rnum, b.*from user_market b "
							+ "where user_name like ?)where rnum >= ? and rnum <= ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+keyword+"%");
					pstmt.setInt(2, startNo);
					pstmt.setInt(3, endNo);
				}else {
					sql = "select *from "
							+ "(select row_number() over(order by user_no desc) rnum, b.*from user_market b "
							+ "where user_id like ? or user_name like ? )where rnum >= ? and rnum <= ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+keyword+"%");
					pstmt.setString(2, "%"+keyword+"%");
					pstmt.setInt(3, startNo);
					pstmt.setInt(4, endNo);
				}
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					UserDTO dto = new UserDTO();
					dto.setUser_no(rs.getInt("user_no"));
					dto.setUser_id(rs.getString("user_id"));
					dto.setUser_pwd(rs.getString("user_pwd"));
					dto.setUser_name(rs.getString("user_name"));
					dto.setUser_gender(rs.getString("user_gender"));
					dto.setUser_email(rs.getString("user_email"));
					dto.setUser_address(rs.getString("user_address"));
					dto.setUser_detailaddress(rs.getString("user_detailaddress"));
					dto.setUser_phone(rs.getString("user_phone"));
					dto.setUser_date(rs.getString("user_date"));
					dto.setUser_update(rs.getString("user_update"));
					list.add(dto);
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return list;
		}
		
		//오늘날자 회원가입자수
		public int nowDateCount() {
			int result = 0;
			
			try {
				openConn();
				
				sql = "select count(*)from user_market "
						+ "where to_char(user_date,'YY/MM/DD') = to_char(sysdate,'YY/MM/DD')";
				
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					result = rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		}
	
	
	
}
