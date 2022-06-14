package com.market.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class FrontController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@SuppressWarnings("deprecation")
	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		// 한글 인코딩을 처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
		
		// getRequestURI() : "/프로젝트명/파일명(*.do)" 라는 문자열을 
		//						반환해 주는 메서드.
		String uri = request.getRequestURI();
		System.out.println("URI >>>" + uri);
		
		
		// getContextPath() : 현재 프로젝트명을 문자열로 반환해 주는 메서드.
		String path = request.getContextPath();
		System.out.println("Path >>> " + path);
		
		// command 문자열 변수에는 *.do만 반환이 됨.
		String command = uri.substring(path.length() + 1);
		System.out.println("Command >>> " + command);
		
		Action action = null;
		ActionForward forward = null;
		
		Properties prop = new Properties();
		
		/*
		 * 
		 *  java.util.Properties 클래스 
		 *  - Properties 클래스는 HashTable의 하위 클래스.
		 *  - 보통은 환경 변수 및 속성 값을 Properties 파일에 저장하여 쉽게 접근 할 수 있는
		 *  	장점이 있음.
		 *  
		 *  - Properties 파일은 일련의 키(key) - 값(value)의 한 쌍으로 이루어져 있음.
		 *  - 보통은 파일에 저장하여 사용을 함. 파일 이름을 *.properties 이름으로 끝나게 함.
		 *  - FileInputStream 클래스에 Properties 파일을 인자로 넣어서 그 스트림으로부터
		 *    파일을 가져올 때 많이 사용함. 인자로 들어온 Properties 파일을 읽게 됨.
		 *  - 읽어 들일 때 사용하는 메서드는 load() 라는 메서드를 이용하여 파일을 읽어들이게 됨.
		 *  
		 */
		
		
		FileInputStream fis = 
				new FileInputStream("C:\\Users\\MrKoo\\git\\Jsp_TeamProject\\Jsp_TeamProject\\src\\com\\market\\controller\\mapping.properties");
				// mapping.properties의 주소의 객체를 생성해주는 작업.
		
		prop.load(fis); // Properties prop.load 메서드를 통해서 fis의 프로퍼티를 불러와주는 작업
		
	
		// 해당 주소값이 잘 불러져오는지 확인하기 위한 멤버
		String value = prop.getProperty(command);
		System.out.println("value >>> " + value);
		
		
		if(value.substring(0,7).equals("execute")) { 
			//  execute|com.reply.action.BbsListAction 에서 "excute"값만 가져옴
			// 위 if조건문은 mapping의 execute == "execute"값이 같은경우
			
			// value값에서 "|"기준으로 짤라서 앞 뒤로 값을 가져옴
			StringTokenizer st = new StringTokenizer(value, "|");
			String url_1 = st.nextToken(); // "execute" 
			String url_2 = st.nextToken(); // "패키지명.클래스명" 
			
			
			/*
			 * 동적 객체 생성 : newInstance()
			 *  - Class 객체를 이용하면 new 연산자의 사용 없이 동적으로 객체 생성이 가능함.
			 *  - 코드 작성 시에 클래스의 이름을 결정할 수 없고, 런타임(실행)시에 클래스의 
			 *  	이름이 결정되는 경우에 유용하게 사용이 됨.
			 *  
			 *  - newInstance() 메서드는 기본생성자를 호출해서 객체를 생성하기 때문에 
			 *  	반드시 클래스에 기본생성자가 존재해야 함.
			 *  	예외가 발생할 수 있는데 해당 클래스가 추상클래스이거나 인터페이스일 경우
			 *  	발생하고, 또 하나의 예외는 클래스의 생성자가 접근제한자로 인해 접근할 수
			 *  	없는 경우에 발생을 함. 따라서 예외처리를 해 주어야 함.
			 *  
			 * 	- 반환 타입은 Object 타입이므로 맞게 형 변환을 해 주면 되지만, 클래스의 타입을
			 * 		모르는 상태이므로 형변환을 해 줄 수가 없음. 이러한 문제를 해결하기 위해서
			 * 		인터페이스를 사용하는것임.
			 * 
			 * 	- Class.forName(class 이름)은 파라미터로 받은 class 이름에 해당하는
			 * 		클래스를 로딩한 후에, 그 클래스에 해당하는 인스턴스를 리턴을 해 줌.
			 * 		newInstance() 메서드는 로딩한 클래스의 객체를 생성하는 메서드이고,
			 * 		이렇게 생성된 객체를 동적 객체 생성이라고 함.
			 */
			
			try {
				// url_2의 주소값은 com.reply.action.BbsListAction 값을 호출하는거와 같다.
				Class url = Class.forName(url_2);
				
				// 동적으로 객체를 생성하는 방법 (반환형은 Action(interface)
				action = (Action)url.newInstance();
				
				// 비지니스 로직을 실행하는 메서드 호출
				forward = action.execute(request, response);
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else { // 매핑값과 메서드의값이 같지않은경우
			
			forward = new ActionForward();
			forward.setRedirect(false); // selectRedirect가 false인경우 *.jsp로 보내주는 작업
			forward.setPath(value);
		}
		
		if(forward != null) { // ActionForward의 set값이 있는경우
			if(forward.isRedirect()) { // true인 경우
				response.sendRedirect(forward.getPath());
			}else { // false 인경우 view page로이동
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				
				rd.forward(request, response);
			}
		}
	}
}
