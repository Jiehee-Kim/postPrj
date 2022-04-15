package service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/detail")
public class detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("userId");
		String _postNum = request.getParameter("postNum");
		int postNum = Integer.parseInt(_postNum);
		
		request.setAttribute("name", name);
		request.setAttribute("postNum", postNum);
		request.getRequestDispatcher("modify.jsp").forward(request, response);
	}

}
