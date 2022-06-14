package com.market.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = null;
	private static CategoryDAO instance;
	
	private CategoryDAO() {
		
	}
	
	public static CategoryDAO getInstance() {
		if(instance == null) {
			instance = new CategoryDAO();
		}
		return instance;
	} // getInstance END
	
	public void openConn() {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "web";
		String password = "1234";

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			e.printStackTrace();
		}
	} // openConn END
	
	public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection con) {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(pstmt!=null) {
				pstmt.close();
			}
			if(con!=null) {
				con.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} // closeConn END
	
	public List<CategoryDTO> getCategoryList(String code){ 
		List<CategoryDTO> list = new ArrayList<CategoryDTO>();
		
		try {
			openConn();
			sql = "select * from category_market where category_code like ? order by category_code";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CategoryDTO dto = new CategoryDTO();
				dto.setCategory_num(rs.getInt("category_num"));
				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	} // getCategoryList END
	
	public int insertCategory(String code, String name) {
		int result = 0, count = 0;
		try {
			openConn();
			sql = "select max(category_num) from category_market";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
			
			String code_search = code + '%';
			sql = "select lpad(count(*)+1, 5, 0) from category_market where category_code like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code_search);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				code = code + rs.getString(1);
				System.out.println("최종 코드 : " + code);
			}
			
			sql = "insert into category_market values(?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setString(2, code);
			pstmt.setString(3, name);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	} // insertCategory END
	
	public CategoryDTO categoryContent(int num) {
		CategoryDTO dto = new CategoryDTO();
		try {
			openConn();
			sql = "select * from category_market where category_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setCategory_num(rs.getInt("category_num"));
				dto.setCategory_code(rs.getString("category_code"));
				dto.setCategory_name(rs.getString("category_name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	} // categoryContent END
	
	public int updateCategory(CategoryDTO dto) {
		int result = 0;
		try {
			openConn();
			sql="update category_market set category_name = ? where category_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getCategory_name());
			pstmt.setInt(2, dto.getCategory_num());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		return result;
	} // updateCategory END
	
	public int deleteCategory(int num) {
		String code = null;
		int result = 0;
		System.out.println("num 번째 삭제 : " + num);
		try {
			openConn();
			sql = "select category_code from category_market where category_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				code = rs.getString("category_code");
			}
			
			sql = "delete from category_market where category_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();

			sql = "update category_market set category_num = category_num - 1 where category_num > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			sql = "update category_market"
					+ " set category_code = replace(category_code,substr(category_code,4),substr(category_code,4) - 1)"
					+ " where substr(category_code, 1, 4) = substr(?, 1, 4)"
					+ " and substr(category_code, 4) > substr(?, 4)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.setString(2, code);
			pstmt.executeUpdate();
			
			sql = "delete from product_market where pcategory_fk = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs,pstmt,con);
		}
		
		return result;
	} // deleteCategory END

}
