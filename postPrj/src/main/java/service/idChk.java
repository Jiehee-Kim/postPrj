package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBcon.DBcon;

@WebServlet("/idChk")
public class idChk extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("userId");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT count(userId) FROM userDb WHERE userId = ?";
//		String message = null;
		PrintWriter out = response.getWriter();
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			int _id = rs.getInt(1);
			
			if(_id != 0) {
				out.print("사용할 수 없는 아이디 입니다.");
			}else {
				out.print("사용 가능한 아이디 입니다.");
			}
			
//			if(_id.length() != 0) {
//				message = "이미 사용중인 아이디 입니다.";
//			}else {
//				message = "사용 가능한 아이디 입니다.";
//			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
//		response.setCharacterEncoding("utf-8");
//		request.getRequestDispatcher("regist.jsp").forward(request, response);
		
	}

}
