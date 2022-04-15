package service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/aChk")
public class aChk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String sel = request.getParameter("a");
		String name = request.getParameter("name");
		
		String href = null;
		
		switch(sel) {
			case "0" :
				href = "login.jsp";
				break;
			case "1" :
				href = "post1.jsp";
				break;
			case "2" :
				href = "post2.jsp";
				break;
			case "3" :
				href = "post3.jsp";
				break;
			case "4" :
				href = "post4.jsp";
				break;
			case "5" : 
				href = "admin.jsp";
				break;
			case "6" :
				href = "myPage.jsp";
				break;
		}
		
		request.setAttribute("name", name);
		request.getRequestDispatcher(href).forward(request, response);
	}

}
