package com.market.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProductDAO {

	Connection con = null;             // DB 연결하는 객체.
	PreparedStatement pstmt = null;    // DB에 SQL문을 전송하는 객체.
	ResultSet rs = null;               // SQL문을 실행 후 결과 값을 가지고 있는 객체.
	String sql = null;                 // SQL문을 저장할 객체.
	
	
	// ProductDAO 객체를 싱글톤 방식으로 만들어 보자.
	// 1단계 : 싱글톤 방식으로 객체를 만들기 위해서는 우선적으로
	//        기본 생성자의 접근 제어자를 private 으로 선언해야 함.
	// 2단계 : ProductDAO 객체를 정적 멤버로 선언해야 함. - static으로 선언해야 함.
	private static ProductDAO instance = null;
	
	
	private ProductDAO() {   }  // 기본생성자.
		
	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는 getInstance() 라는
	//        메서드를 만들어서 여기에 접근하게 해야 함.
	public static ProductDAO getInstance() {
		
		if(instance == null) {
			instance = new ProductDAO();
		}
		return instance;
		
	}  // getInstance() 메서드 end
	
	
	// DB를 연동하는 작업을 진행하는 메서드
	public void openConn() {
		
		try {
			// 1단계 : JNDI 서버 객체 생성
			Context ctx = new InitialContext();
			
			// 2단계 : lookup() 메서드를 이용하여 매칭되는 커넥션을 찾는다.
			DataSource ds =
					(DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
			
			// 3단계 : DataSource 객체를 이용하여 커넥션 객체를 하나 가져온다.
			con = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			
	}  // openConn() 메서드 end
	
	
	// DB에 연결된 자원을 종료하는 메서드
	public void closeConn(ResultSet rs,
			PreparedStatement pstmt, Connection con) {
		
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
				e.printStackTrace();
			}
		
	}  // closeConn() 메서드 end
	
	
	// product_market 테이블에 상품을 등록(추가)하는 메서드.
	public int insertProduct(ProductDTO dto) {
		
		int result = 0, count = 0;
		
		
		try {
			openConn();
			
			sql = "select max(pnum) from product_market";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
			
			sql = "insert into product_market "
					+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			
			pstmt.setString(2, dto.getPname());
			
			pstmt.setString(3, dto.getPcategory_fk());
			
			pstmt.setString(4, dto.getPcompany());
			
			pstmt.setString(5, dto.getPimage());
			
			pstmt.setInt(6, dto.getPqty());
			
			pstmt.setInt(7, dto.getPrice());
			
			pstmt.setString(8, dto.getPspec());
			
			pstmt.setString(9, dto.getPdetails());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}  // insertProduct() 메서드 end
	
	
	// 전체 상품 목록 리스트를 조회하는 메서드.
	public List<ProductDTO> getProductList() {
		
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		
		try {
			openConn();
			
			sql = "select * from product_market "
					+ " order by pnum desc";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductDTO dto = new ProductDTO();
				
				dto.setPnum(rs.getInt("pnum"));
				
				dto.setPname(rs.getString("pname"));
				
				dto.setPcategory_fk(rs.getString("pcategory_fk"));
				
				dto.setPcompany(rs.getString("pcompany"));
				
				dto.setPimage(rs.getString("pimage"));
				
				dto.setPqty(rs.getInt("pqty"));
				
				dto.setPrice(rs.getInt("price"));
				
				dto.setPspec(rs.getString("pspec"));
				
				dto.setPdetails(rs.getString("pdetails"));
				
				dto.setPinputdate(rs.getString("pinputdate"));
				
				list.add(dto);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
	}  // getProductList() 메서드 end
	
	
	
	
	// 제품 번호에 해당하는 제품에 대한 상세 정보를 조회하는 메서드.
	public ProductDTO productContent(int num) {
		
		ProductDTO dto = new ProductDTO();
		
		
		try {
			openConn();
			
			sql = "select * from product_market "
					+ " where pnum = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setPnum(rs.getInt("pnum"));
				
				dto.setPname(rs.getString("pname"));
				
				dto.setPcategory_fk(rs.getString("pcategory_fk"));
				
				dto.setPcompany(rs.getString("pcompany"));
				
				dto.setPimage(rs.getString("pimage"));
				
				dto.setPqty(rs.getInt("pqty"));
				
				dto.setPrice(rs.getInt("price"));
				
				dto.setPspec(rs.getString("pspec"));
				
				dto.setPdetails(rs.getString("pdetails"));
				
				dto.setPinputdate(rs.getString("pinputdate"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return dto;
	}  // productContent() 메서드 end
	
	
	// 제품번호에 해당하는 제품의 정보를 수정하는 메서드.
	public int updateProduct(ProductDTO dto) {
		
		int result = 0;
		
		
		try {
			openConn();
			
			sql = "update product_market set pimage = ?, "
					+ " pqty = ?, price = ?, pspec = ?, "
					+ " pdetails = ? "
					+ " where pnum = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getPimage());
			
			pstmt.setInt(2, dto.getPqty());
			
			pstmt.setInt(3, dto.getPrice());
			
			pstmt.setString(4, dto.getPspec());
			
			pstmt.setString(5, dto.getPdetails());
			
			pstmt.setInt(6, dto.getPnum());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
			
		}
		
		return result;
	}  // updateProduct() 메서드 end
	
	
	// 제품번호에 해당하는 제품을 DB에서 삭제하는 메서드.
	public int deleteProduct(int num) {
		
		int result = 0;
		
		try {
			openConn();
			
			sql = "delete from product_market "
					+ " where pnum = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
			sql = "update product_market set "
					+ " pnum = pnum - 1 "
					+ " where pnum > ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return result;
	}  // deleteProduct() 메서드 end
	
	
	
	// 카테고리 코드에 해당하는 제품의 전체 리스트를 조회하는 메서드.
	public List<ProductDTO> getProductList(String code) {
		
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		try {
			openConn();
			
			sql = "select * from product_market "
					+ " where pcategory_fk like ? ";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, code);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductDTO dto = new ProductDTO();
				
				dto.setPnum(rs.getInt("pnum"));
				
				dto.setPname(rs.getString("pname"));
				
				dto.setPcategory_fk(rs.getString("pcategory_fk"));
				
				dto.setPcompany(rs.getString("pcompany"));
				
				dto.setPimage(rs.getString("pimage"));
				
				dto.setPqty(rs.getInt("pqty"));
				
				dto.setPrice(rs.getInt("price"));
				
				dto.setPspec(rs.getString("pspec"));
				
				dto.setPdetails(rs.getString("pdetails"));
				
				dto.setPinputdate(rs.getString("pinputdate"));
				
				list.add(dto);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
		
	}  // getProductList() 메서드 end
	
  // 검색을 눌렀을때 인풋에서넘어오는 자료를 DB와 연동하기
	
	public List<ProductDTO> searchProduct(String name) {
		
		List<ProductDTO> list = new ArrayList<ProductDTO>();

		try {
			openConn();
			sql = "select * from product_market where pname like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%"+name+"%");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductDTO dto = new ProductDTO();
				
				dto.setPnum(rs.getInt("pnum"));
				
				dto.setPname(rs.getString("pname"));
				
				dto.setPcategory_fk(rs.getString("pcategory_fk"));
				
				dto.setPcompany(rs.getString("pcompany"));
				
				dto.setPimage(rs.getString("pimage"));
				
				dto.setPqty(rs.getInt("pqty"));
				
				dto.setPrice(rs.getInt("price"));
				
				dto.setPspec(rs.getString("pspec"));
				
				dto.setPdetails(rs.getString("pdetails"));
				
				dto.setPinputdate(rs.getString("pinputdate"));
				
				
				list.add(dto);
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return list;
	} // searchProduct 메서드 end
  
	// 신상품을 클릭했을때 DB에 내용을 저장하고 View Page에 띄우기
	
	public List<ProductDTO> getNewProduct(){
		
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		// 오늘의 시간을 가져오는 변수 만들기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); 
		Calendar c1 = Calendar.getInstance(); 
		String strToday = sdf.format(c1.getTime()); 
		System.out.println(strToday);

		
		try {
			openConn();
			sql = "select * from product_market where TO_CHAR(pinputdate, 'yyyymmdd') = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, strToday);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductDTO dto = new ProductDTO();
				dto.setPnum(rs.getInt("pnum"));
				dto.setPname(rs.getString("pname"));
				dto.setPcategory_fk(rs.getString("pcategory_fk"));
				dto.setPcompany(rs.getString("pcompany"));
				dto.setPimage(rs.getString("pimage"));
				dto.setPqty(rs.getInt("pqty"));
				dto.setPrice(rs.getInt("price"));
				dto.setPspec(rs.getString("pspec"));
				dto.setPdetails(rs.getString("pdetails"));
				dto.setPinputdate(rs.getString("pinputdate"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
		
	} // getNewProduct 메서드 end
	
	
	// 베스트상품을 클릭하는 경우 DB에서 값을 가져온 후 페이지에 보여주는 메서드
	
	public List<ProductDTO> getBestProduct(){
		
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		try {
			openConn();
			sql = "select * from product_market where price > 5000";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductDTO dto = new ProductDTO();
				dto.setPnum(rs.getInt("pnum"));
				dto.setPname(rs.getString("pname"));
				dto.setPcategory_fk(rs.getString("pcategory_fk"));
				dto.setPcompany(rs.getString("pcompany"));
				dto.setPimage(rs.getString("pimage"));
				dto.setPqty(rs.getInt("pqty"));
				dto.setPrice(rs.getInt("price"));
				dto.setPspec(rs.getString("pspec"));
				dto.setPdetails(rs.getString("pdetails"));
				dto.setPinputdate(rs.getString("pinputdate"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
		
	} // getNewProduct 메서드 end
	
	// 인기상품을 클릭하는 경우 DB에 값을 저장한 후 페이지로 불러오는 메서드
	
	public List<ProductDTO> getFamousProduct(){
		
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		try {
			openConn();
			sql = "select * from product_market where pqty < 3";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductDTO dto = new ProductDTO();
				dto.setPnum(rs.getInt("pnum"));
				dto.setPname(rs.getString("pname"));
				dto.setPcategory_fk(rs.getString("pcategory_fk"));
				dto.setPcompany(rs.getString("pcompany"));
				dto.setPimage(rs.getString("pimage"));
				dto.setPqty(rs.getInt("pqty"));
				dto.setPrice(rs.getInt("price"));
				dto.setPspec(rs.getString("pspec"));
				dto.setPdetails(rs.getString("pdetails"));
				dto.setPinputdate(rs.getString("pinputdate"));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}
		
		return list;
		
	} // getNewProduct 메서드 end
	
}


