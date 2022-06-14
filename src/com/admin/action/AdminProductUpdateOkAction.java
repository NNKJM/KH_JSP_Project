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

public class AdminProductUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		
		// 상품 수정 폼 페이지에서 넘어온 데이터들을  DB에 수정
		
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
		
		// 수정 폼 페이지에서 넘어온 데이터들을 받아주자.
		String p_category = multi.getParameter("p_category").trim();
		
		String p_name = multi.getParameter("p_name").trim();
		
		String p_company = multi.getParameter("p_company").trim();
		
		int p_qty = Integer.parseInt(multi.getParameter("p_qty").trim());
		
		int p_price = Integer.parseInt(multi.getParameter("p_price").trim());
		
		String p_spec = multi.getParameter("p_spec").trim();
		
		String p_details = multi.getParameter("p_details").trim();
		
		int p_num = Integer.parseInt(multi.getParameter("p_num").trim());
		
		String p_image_new = multi.getFilesystemName("p_image_new");
		
		if(p_image_new == null) {  // 수정할 첨부파일 이미지가 없는 경우
			p_image_new = multi.getParameter("p_image_old");
		}
		
		ProductDTO dto = new ProductDTO();
		
		dto.setPnum(p_num);
		
		dto.setPname(p_name);
		
		dto.setPcategory_fk(p_category);
		
		dto.setPcompany(p_company);
		
		dto.setPimage(p_image_new);
		
		dto.setPqty(p_qty);
		
		dto.setPrice(p_price);
		
		dto.setPspec(p_spec);
		
		dto.setPdetails(p_details);
		
		
		ProductDAO dao = ProductDAO.getInstance();
		
		int check = dao.updateProduct(dto);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			
			forward.setRedirect(true);
			
			forward.setPath("admin_product_list.do");
			
		}else {
			out.println("<script>");
			out.println("alert('제품 정보 수정 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
	
		
		return forward;
	}

}

