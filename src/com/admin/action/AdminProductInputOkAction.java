package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.ProductDAO;
import com.market.model.ProductDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminProductInputOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 상품 등록 폼 페이지에서 넘어온 데이터들을 DB에 저장
		
		// 첨부파일 저장위치
		String saveFolder = 
		"C:\\Users\\MrKoo\\git\\Jsp_TeamProject\\Jsp_TeamProject\\WebContent\\upload";
		
		// 첨부파일 용량(크기) 제한 - 파일 업로드 최대 크기
		int fileSize = 10 * 1024 * 1024;  // 10MB	
		
		// 이지파일 업로드를 위한 객체 생성
		MultipartRequest multi = new MultipartRequest(
				request, 
				saveFolder, 
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
		);
		
		// 상품등록 폼 페이지에서 넘어온 데이터들을 받아 주자.
		String p_category = multi.getParameter("p_category").trim();
		
		String p_name = multi.getParameter("pname").trim();
		
		String p_spec = multi.getParameter("pspec").trim();
		
		String p_company = multi.getParameter("pcompany").trim();
		
		int p_qty = Integer.parseInt(multi.getParameter("p_qty").trim());
		
		int p_price = Integer.parseInt(multi.getParameter("p_price").trim());
		
		String p_details = multi.getParameter("p_details").trim();
		
		// getFilesystemName() : 서버 상에 실제로 업로드될 파일의 이름을 문자열로 반환해 주는 메서드.
		String p_image = multi.getFilesystemName("pimage");
		
		ProductDTO dto = new ProductDTO();
		
		dto.setPname(p_name);
		
		dto.setPcategory_fk(p_category);
		
		dto.setPcompany(p_company);
		
		dto.setPimage(p_image);
		
		dto.setPqty(p_qty);
		
		dto.setPrice(p_price);
		
		dto.setPspec(p_spec);
		
		dto.setPdetails(p_details);

		
		ProductDAO dao = ProductDAO.getInstance();
		
		int check = dao.insertProduct(dto);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			
			forward.setRedirect(true);
			
			forward.setPath("admin_product_list.do");  // 상품 목록 컨트롤러로 이동
		}else {
			out.println("<script>");
			out.println("alert('상품 등록 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
