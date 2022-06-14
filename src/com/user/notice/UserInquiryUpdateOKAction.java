package com.user.notice;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.controller.Action;
import com.market.controller.ActionForward;
import com.market.model.UserDTO;
import com.notice.model.InquiryDTO;
import com.notice.model.NoticeDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UserInquiryUpdateOKAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 1:1 문의 수정
		
		String saveFolder = "C:\\NCS\\workspace(jsp)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\Jsp_TeamProject\\uploadFile";
		
		int fileSize = 10 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(request,
				saveFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
		);
		
		HttpSession session = request.getSession();
		UserDTO userDTO = (UserDTO) session.getAttribute("userCont");
		
		int no = Integer.parseInt(multi.getParameter("no"));
		String inquiry_title = multi.getParameter("inquiry_title");
		String inquiry_content = multi.getParameter("inquiry_content");
		File inquiry_newImg = multi.getFile("inquiry_newImg");
		
		NoticeDAO dao = NoticeDAO.getInstance();
		String fileDBName = "";
		
		InquiryDTO dto = new InquiryDTO();
		
		if(inquiry_newImg == null) {
			String inquiry_oldImg = multi.getParameter("inquiry_oldImg");
			dto.setAsk_image(inquiry_oldImg);
		} else {
			String fileName = inquiry_newImg.getName();

			// 날짜 객체 생성
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) + 1;
			int day = cal.get(Calendar.DAY_OF_MONTH);

			// .../upload/2022-04-18
			String homedir = saveFolder + "/" + year + "-" + month + "-" + day;

			// 날짜 폴더 생성
			File path1 = new File(homedir);

			if (!path1.exists()) { // 폴더가 존재하지 않는 경우
				path1.mkdir(); // 폴더 생성
			}

			// .../upload/2022-04-18/작성자_파일명
			String reFileName = userDTO.getUser_id() + "_" + fileName;
			inquiry_newImg.renameTo(new File(homedir + "/" + reFileName));

			// DB에 저장되는 값 ==> "/2022-04-18/작성자_파일명"
			fileDBName = "/" + year + "-" + month + "-" + day + "/" + reFileName;
			
			dto.setAsk_image(fileDBName);
		}
		
		dto.setAsk_no(no);
		dto.setAsk_title(inquiry_title);
		dto.setAsk_content(inquiry_content);
		
		dao.updateInquiry(dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("notice_inquiry_list.do");
		
		return forward;
	}

}
