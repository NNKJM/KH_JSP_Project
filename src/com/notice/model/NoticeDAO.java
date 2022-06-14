package com.notice.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.market.model.AdminDTO;

public class NoticeDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = null;

	private static NoticeDAO instance;

	private NoticeDAO() {}

	public static NoticeDAO getInstance() {

		if (instance == null) {
			instance = new NoticeDAO();
		}

		return instance;
	}

	// DB 연동
	public void openConn() {

		try {
			Context ctx = new InitialContext();

			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/myoracle");

			con = ds.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}

	} // openConn() - End
	
	// 공지사항 번호, 제목, 작성일, 조회수 순으로 조회
	public List<NoticeDTO> getNoticeList(int page, int rowsize, String val) {
		List<NoticeDTO> list = new ArrayList<NoticeDTO>();
		
		// 해당 페이지 시작 번호
		int startNo = (page * rowsize) - (rowsize - 1);
		
		// 해당 페이지 끝 번호
		int endNo = (page * rowsize);
		
		try {
			openConn();
			
			if(val.equals("title")) { // 제목(오름) -> 번호(내림)
				pstmt = con.prepareStatement("SELECT * FROM"
						+ " (SELECT ROW_NUMBER() OVER(ORDER BY NOTICE_TITLE, NOTICE_NO DESC) RNUM, N.* FROM NOTICE_MARKET N)"
						+ " WHERE RNUM >= ? AND RNUM <= ?");
			} else if(val.equals("date")) { // 수정일(내림) -> 작성일(내림) -> 번호(내림)
				pstmt = con.prepareStatement("SELECT * FROM"
						+ " (SELECT ROW_NUMBER() OVER(ORDER BY NOTICE_UPDATE DESC NULLS LAST, NOTICE_DATE DESC, NOTICE_NO DESC) RNUM, N.* FROM NOTICE_MARKET N)"
						+ " WHERE RNUM >= ? AND RNUM <= ?");
			} else if(val.equals("hit")) { // 조회수(내림) -> 번호(내림)
				pstmt = con.prepareStatement("SELECT * FROM"
						+ " (SELECT ROW_NUMBER() OVER(ORDER BY NOTICE_HIT DESC, NOTICE_NO DESC) RNUM, N.* FROM NOTICE_MARKET N)"
						+ " WHERE RNUM >= ? AND RNUM <= ?");
			} else { // 번호(내림)
				pstmt = con.prepareStatement("SELECT * FROM"
						+ " (SELECT ROW_NUMBER() OVER(ORDER BY NOTICE_NO DESC) RNUM, N.* FROM NOTICE_MARKET N)"
						+ " WHERE RNUM >= ? AND RNUM <= ?");
			}
			
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				
				dto.setNotice_no(rs.getInt("NOTICE_NO"));
				dto.setAdmin_id(rs.getString("ADMIN_ID"));
				dto.setAdmin_name(rs.getString("ADMIN_NAME"));
				dto.setNotice_title(rs.getString("NOTICE_TITLE"));
				dto.setNotice_content(rs.getString("NOTICE_CONTENT"));
				dto.setNotice_hit(rs.getInt("NOTICE_HIT"));
				dto.setNotice_date(rs.getString("NOTICE_DATE"));
				dto.setNotice_update(rs.getString("NOTICE_UPDATE"));
				
				list.add(dto);
			}
			
			rs.close(); pstmt.close(); con.close();
		} catch (SQLException e) { e.printStackTrace(); }
		
		return list;
	} // getNoticeList(...String val) - End

	// 해당 제목의 공지내용 조회
	public NoticeDTO getNoticeDetail(int notice_no) {
		NoticeDTO list = new NoticeDTO();
		
		try {
			openConn();
			
			sql = "SELECT * FROM NOTICE_MARKET WHERE NOTICE_NO = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list.setNotice_no(rs.getInt("NOTICE_NO"));
				list.setAdmin_id(rs.getString("ADMIN_ID"));
				list.setAdmin_name(rs.getString("ADMIN_NAME"));
				list.setNotice_title(rs.getString("NOTICE_TITLE"));
				list.setNotice_content(rs.getString("NOTICE_CONTENT"));
				list.setNotice_hit(rs.getInt("NOTICE_HIT"));
				list.setNotice_date(rs.getString("NOTICE_DATE"));
				list.setNotice_update(rs.getString("NOTICE_UPDATE"));
			}
			
			rs.close(); pstmt.close(); con.close();
		} catch (SQLException e) { e.printStackTrace(); }
		
		return list;
	} // getNoticeDetail() - End

	// 조회수 증가
	public void updateHit(int notice_no) {
		
		try {
			openConn();
			
			sql = "UPDATE NOTICE_MARKET SET NOTICE_HIT = NOTICE_HIT + 1 WHERE NOTICE_NO = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, notice_no);
			
			pstmt.executeUpdate();
			
			pstmt.close(); con.close();
		} catch (SQLException e) { e.printStackTrace(); }
	} // updateHit() - End

	// 총 게시물 수
	public int getBoardCount() {
		int count = 0;
		
		try {
			openConn();
			
			sql = "SELECT COUNT(*) FROM NOTICE_MARKET";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			rs.close(); pstmt.close(); con.close();
		} catch (SQLException e) { e.printStackTrace(); }
		
		return count;
	} // getBoardCount() - End

	// 검색 레코드 갯수
	public int searchListCount(String[] search_field, String search_keyword) {
		int count = 0;
		
		try {
			openConn();
			
			if(search_field.length == 1) { // 검색 항목 1개
				if(search_field[0].equals("writer")) {
					sql = "SELECT COUNT(*) FROM NOTICE_MARKET WHERE ADMIN_NAME LIKE ?"; 
				} else if(search_field[0].equals("title")) {
					sql = "SELECT COUNT(*) FROM NOTICE_MARKET WHERE NOTICE_TITLE LIKE ?"; 
				} else {
					sql = "SELECT COUNT(*) FROM NOTICE_MARKET WHERE NOTICE_CONTENT LIKE ?"; 
				} 
			} else if (search_field.length == 2) { // 검색 항목 2개
				if(search_field[0].equals("writer")) {
					if(search_field[1].equals("title")) { // 이름 + 제목
						sql = "SELECT COUNT(*) FROM NOTICE_MARKET WHERE ADMIN_NAME || NOTICE_TITLE LIKE ?"; 
					} else {	// 이름 + 내용
						sql = "SELECT COUNT(*) FROM NOTICE_MARKET WHERE ADMIN_NAME || NOTICE_CONTENT LIKE ?"; 
					}
				} else { // 제목 + 내용
					sql = "SELECT COUNT(*) FROM NOTICE_MARKET WHERE NOTICE_TITLE || NOTICE_CONTENT LIKE ?";
				}
			} else if (search_field.length == 3){ // 검색 항목을 모두 체크
				sql = "SELECT COUNT(*) FROM NOTICE_MARKET WHERE ADMIN_NAME || NOTICE_TITLE || NOTICE_CONTENT LIKE ?";
			}
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search_keyword + "%");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			rs.close(); pstmt.close(); con.close();
		} catch (SQLException e) { e.printStackTrace(); }
		
		return count;
	}
	
	// 공지사항 검색 기능
	public List<NoticeDTO> searchNotice(String[] search_field, String search_keyword, int page, int rowsize) {
		List<NoticeDTO> list = new ArrayList<NoticeDTO>();
		
		// 해당 페이지에서 시작 번호
		int startNo = (page * rowsize) - (rowsize - 1);

		// 해당 페이지에서 끝 번호
		int endNo = (page * rowsize);
		
		try {
			openConn();
			
			if(search_field.length == 1) { // 검색 항목 1개
				if(search_field[0].equals("writer")) {
					sql = "SELECT * FROM"
							+ " (SELECT ROW_NUMBER() OVER(ORDER BY NOTICE_NO DESC) RNUM, B.* FROM NOTICE_MARKET B"
							+ " WHERE ADMIN_NAME LIKE ?)"
							+ " WHERE RNUM >= ? AND RNUM <= ?";
				} else if(search_field[0].equals("title")) {
					sql = "SELECT * FROM"
							+ " (SELECT ROW_NUMBER() OVER(ORDER BY NOTICE_NO DESC) RNUM, B.* FROM NOTICE_MARKET B"
							+ " WHERE NOTICE_TITLE LIKE ?)"
							+ " WHERE RNUM >= ? AND RNUM <= ?";
				} else {
					sql = "SELECT * FROM"
							+ " (SELECT ROW_NUMBER() OVER(ORDER BY NOTICE_NO DESC) RNUM, B.* FROM NOTICE_MARKET B"
							+ " WHERE NOTICE_CONTENT LIKE ?)"
							+ " WHERE RNUM >= ? AND RNUM <= ?"; 
				} 
			} else if (search_field.length == 2) { // 검색 항목 2개
				if(search_field[0].equals("writer")) {
					if(search_field[1].equals("title")) { // 이름 + 제목
						sql = "SELECT * FROM"
								+ " (SELECT ROW_NUMBER() OVER(ORDER BY NOTICE_NO DESC) RNUM, B.* FROM NOTICE_MARKET B"
								+ " WHERE ADMIN_NAME || NOTICE_TITLE LIKE ?)"
								+ " WHERE RNUM >= ? AND RNUM <= ?"; 
					} else {	// 이름 + 내용
						sql = "SELECT * FROM"
								+ " (SELECT ROW_NUMBER() OVER(ORDER BY NOTICE_NO DESC) RNUM, B.* FROM NOTICE_MARKET B"
								+ " WHERE ADMIN_NAME || NOTICE_CONTENT LIKE ?)"
								+ " WHERE RNUM >= ? AND RNUM <= ?"; 
					}
				} else { // 제목 + 내용
					sql = "SELECT * FROM"
							+ " (SELECT ROW_NUMBER() OVER(ORDER BY NOTICE_NO DESC) RNUM, B.* FROM NOTICE_MARKET B"
							+ " WHERE NOTICE_TITLE || NOTICE_CONTENT LIKE ?)"
							+ " WHERE RNUM >= ? AND RNUM <= ?"; 
				}
			} else if (search_field.length == 3){ // 검색 항목을 모두 체크
				sql = "SELECT * FROM"
						+ " (SELECT ROW_NUMBER() OVER(ORDER BY NOTICE_NO DESC) RNUM, B.* FROM NOTICE_MARKET B"
						+ " WHERE ADMIN_NAME || NOTICE_TITLE || NOTICE_CONTENT LIKE ?)"
						+ " WHERE RNUM >= ? AND RNUM <= ?"; 
			}
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search_keyword + "%");
			pstmt.setInt(2, startNo);
			pstmt.setInt(3, endNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO();
				
				dto.setNotice_no(rs.getInt("NOTICE_NO"));
				dto.setAdmin_id(rs.getString("ADMIN_ID"));
				dto.setAdmin_name(rs.getString("ADMIN_NAME"));
				dto.setNotice_title(rs.getString("NOTICE_TITLE"));
				dto.setNotice_content(rs.getString("NOTICE_CONTENT"));
				dto.setNotice_hit(rs.getInt("NOTICE_HIT"));
				dto.setNotice_date(rs.getString("NOTICE_DATE"));
				dto.setNotice_update(rs.getString("NOTICE_UPDATE"));
				
				list.add(dto);
			}
			
			rs.close(); pstmt.close(); con.close();
		} catch (SQLException e) { e.printStackTrace(); }
		
		return list;
	} // searchNotice() - End

	// 해당 회원 문의 내역
	public List<InquiryDTO> getInquiryList(String user_id) {
		List<InquiryDTO> list = new ArrayList<InquiryDTO>();
		
		try {
			openConn();
			
			sql = "SELECT * FROM ASK_MARKET WHERE ASK_USERID = ? ORDER BY 1 DESC";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				InquiryDTO dto = new InquiryDTO();
				
				dto.setAsk_no(rs.getInt("ASK_NO"));
				dto.setAsk_userId(rs.getString("ASK_USERID"));
				dto.setAsk_title(rs.getString("ASK_TITLE"));
				dto.setAsk_content(rs.getString("ASK_CONTENT"));
				dto.setAsk_image(rs.getString("ASK_IMAGE"));
				dto.setAsk_date(rs.getString("ASK_DATE"));
				dto.setAsk_status(rs.getString("ASK_STATUS"));
				dto.setAsk_reply(rs.getString("ASK_REPLY"));
				dto.setAsk_replyDate(rs.getString("ASK_REPLYDATE"));
				
				list.add(dto);
			}
			
			rs.close(); pstmt.close(); con.close();
		} catch (SQLException e) { e.printStackTrace(); }
		
		return list;
	} // getInquiryList() - End

	// 1:1 문의 작성
	public void insertInquiry(String user_id, String inquiry_title, String inquiry_content, String inquiry_img) {
		int count = 0;
		
		try {
			openConn();
			
			sql = "SELECT COUNT(*) FROM ASK_MARKET";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
			
			sql = "INSERT INTO ASK_MARKET VALUES(?, ?, ?, ?, ?, SYSDATE, 0, '', '')";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setString(2, user_id);
			pstmt.setString(3, inquiry_title);
			pstmt.setString(4, inquiry_content);
			pstmt.setString(5, inquiry_img);
			
			pstmt.executeUpdate();
			
			rs.close(); pstmt.close(); con.close();
		} catch (SQLException e) { e.printStackTrace(); }
	} // insertInquiry() - End

	// 해당 문의 상세 내용
	public InquiryDTO getInquiryDetail(int no) {
		InquiryDTO dto = new InquiryDTO();
		
		try {
			openConn();
			
			sql = "SELECT * FROM ASK_MARKET WHERE ASK_NO = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setAsk_no(rs.getInt("ASK_NO"));
				dto.setAsk_userId(rs.getString("ASK_USERID"));
				dto.setAsk_title(rs.getString("ASK_TITLE"));
				dto.setAsk_content(rs.getString("ASK_CONTENT"));
				dto.setAsk_image(rs.getString("ASK_IMAGE"));
				dto.setAsk_date(rs.getString("ASK_DATE"));
				dto.setAsk_status(rs.getString("ASK_STATUS"));
				dto.setAsk_reply(rs.getString("ASK_REPLY"));
				dto.setAsk_replyDate(rs.getString("ASK_REPLYDATE"));
			}
			
			rs.close(); pstmt.close(); con.close();
		} catch (SQLException e) { e.printStackTrace(); }
		
		return dto;
	} // getInquiryDetail() - End

	// 1:1 문의 삭제
	public void deleteInquiry(int no) {
		
		try {
			openConn();
			
			sql = "DELETE FROM ASK_MARKET WHERE ASK_NO = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
			
			sql = "UPDATE ASK_MARKET SET ASK_NO = ASK_NO - 1 WHERE ASK_NO > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			pstmt.executeUpdate();
			
			pstmt.close(); con.close();
		} catch (SQLException e) { e.printStackTrace(); }
	} // deleteInquiry() - End

	public void updateInquiry(InquiryDTO dto) {
		
		try {
			openConn();
			
			sql = "UPDATE ASK_MARKET SET"
					+ " ASK_TITLE = ?,"
					+ " ASK_CONTENT = ?,"
					+ " ASK_IMAGE = ?,"
					+ " ASK_DATE = SYSDATE"
					+ " WHERE ASK_NO = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getAsk_title());
			pstmt.setString(2, dto.getAsk_content());
			pstmt.setString(3, dto.getAsk_image());
			pstmt.setInt(4, dto.getAsk_no());
			
			pstmt.executeUpdate();
			
			pstmt.close(); con.close();
		} catch (SQLException e) { e.printStackTrace(); }
	} // updateInquiry() - End

	// 공지사항 수정
	public void updateNotice(NoticeDTO dto) {
		
		try {
			openConn();
			
			pstmt = con.prepareStatement("UPDATE NOTICE_MARKET SET"
					+ " NOTICE_TITLE = ?,"
					+ " NOTICE_CONTENT = ?,"
					+ " NOTICE_UPDATE = SYSDATE"
					+ " WHERE NOTICE_NO = ?");
			
			pstmt.setString(1, dto.getNotice_title());
			pstmt.setString(2, dto.getNotice_content());
			pstmt.setInt(3, dto.getNotice_no());
			
			pstmt.executeUpdate();
			
			pstmt.close(); con.close();
		} catch (SQLException e) { e.printStackTrace(); }
	} // updateNotice() - End

	// 공지사항 삭제
	public void deleteNotice(int no) {
		
		openConn();
		
		try {
			pstmt = con.prepareStatement("DELETE FROM NOTICE_MARKET WHERE NOTICE_NO = ?");
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
			pstmt = con.prepareStatement("UPDATE NOTICE_MARKET SET NOTICE_NO = NOTICE_NO - 1 WHERE NOTICE_NO > ?");
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			
			pstmt.close(); con.close();
		} catch (SQLException e) { e.printStackTrace(); }
		
	} // deleteNotice() - End

	// 사용자 1:1 문의 내역 전체 조회
	public List<InquiryDTO> getInquiryAll(int page, int rowsize) {
		List<InquiryDTO> list = new ArrayList<InquiryDTO>();
		
		// 해당 페이지 시작 번호
		int startNo = (page * rowsize) - (rowsize - 1);

		// 해당 페이지 끝 번호
		int endNo = (page * rowsize);
		
		try {
			openConn();
			
			pstmt = con.prepareStatement("SELECT * FROM"
					+ " (SELECT ROW_NUMBER() OVER(ORDER BY ASK_DATE DESC) RNUM, A.* FROM ASK_MARKET A)"
					+ " WHERE RNUM >= ? AND RNUM <= ?");
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				InquiryDTO dto = new InquiryDTO();
				
				dto.setAsk_no(rs.getInt("ASK_NO"));
				dto.setAsk_userId(rs.getString("ASK_USERID"));
				dto.setAsk_title(rs.getString("ASK_TITLE"));
				dto.setAsk_content(rs.getString("ASK_CONTENT"));
				dto.setAsk_image(rs.getString("ASK_IMAGE"));
				dto.setAsk_date(rs.getString("ASK_DATE"));
				dto.setAsk_status(rs.getString("ASK_STATUS"));
				dto.setAsk_reply(rs.getString("ASK_REPLY"));
				dto.setAsk_replyDate(rs.getString("ASK_REPLYDATE"));
				
				list.add(dto);
			}
			
			rs.close(); pstmt.close(); con.close();
		} catch (SQLException e) { e.printStackTrace(); }
		
		return list;
	} // getNoticeList() - End

	// 전체 문의글 개수
	public int getInquiryCount() {
		int count = 0;
		
		try {
			openConn();
			
			pstmt = con.prepareStatement("SELECT COUNT(*) FROM ASK_MARKET");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) { count = rs.getInt(1); }
			
			rs.close(); pstmt.close(); con.close();
		} catch (SQLException e) { e.printStackTrace(); }
		
		return count;
	} // getInquiryCount() - End

	// 1:1 문의 답변 작성
	public void inquiryReply(int no, String reply_text) {
		
		openConn();
		
		try {
			pstmt = con.prepareStatement("UPDATE ASK_MARKET SET"
					+ " ASK_STATUS = '1',"
					+ " ASK_REPLY = ?,"
					+ " ASK_REPLYDATE = SYSDATE"
					+ " WHERE ASK_NO = ?");
			pstmt.setString(1, reply_text);
			pstmt.setInt(2, no);
			
			pstmt.executeUpdate();
			
			pstmt.close(); con.close();
		} catch (SQLException e) { e.printStackTrace(); }
	} // inquiryReply() - End

	// 관리자 - 공지사항 등록
	public int insertNotice(AdminDTO adminDTO, String notice_title, String notice_content) {
		int seq = 0;
		int result = 0;
		
		openConn();
		
		try {
			pstmt = con.prepareStatement("SELECT MAX(NOTICE_NO) FROM NOTICE_MARKET");
			rs = pstmt.executeQuery();
			
			if(rs.next()) { seq = rs.getInt(1) + 1; }
			
			pstmt = con.prepareStatement("INSERT INTO NOTICE_MARKET"
					+ " VALUES (?, ?, ?, ?, ?, DEFAULT, SYSDATE, NULL)");
			
			pstmt.setInt(1, seq);
			pstmt.setString(2, adminDTO.getAdmin_id());
			pstmt.setString(3, adminDTO.getAdmin_name());
			pstmt.setString(4, notice_title);
			pstmt.setString(5, notice_content);
			
			result = pstmt.executeUpdate();
			
			rs.close(); pstmt.close(); con.close();
		} catch (SQLException e) { e.printStackTrace(); }
		
		return result;
	} // insertNotice() - End

}













