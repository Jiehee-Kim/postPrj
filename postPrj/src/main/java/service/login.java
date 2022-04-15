package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DBcon.DBcon;

@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		String sql = "SELECT * FROM userDb where userId = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String href = null;
		String message = null;
		String nowUser = null;
		
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			String _id = rs.getString("userId");
			String _pw = rs.getString("userPw");
			
			HttpSession session = request.getSession();
			
			if(_id.equals(userId) && _pw.equals(userPw)) {
				href = "post1.jsp";
				nowUser = _id;
				session.setAttribute("user", nowUser);
			}else {
				href = "login.jsp";
				message = "아이디 또는 비밀번호를 잘못 입력하셨습니다.";
				request.setAttribute("message", message);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.setCharacterEncoding("utf-8");
		request.getRequestDispatcher(href).forward(request, response);
	}

}
