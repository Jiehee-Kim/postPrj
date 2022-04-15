package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBcon.DBcon;

@WebServlet("/regist")
public class regist extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");

		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO userDb VALUES(?, ?)";
		
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.setCharacterEncoding("utf-8");
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

}
