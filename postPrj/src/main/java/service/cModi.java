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

@WebServlet("/cModi")
public class cModi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String _postNum = request.getParameter("postNum");
		int postNum = Integer.parseInt(_postNum);
		
		String _commentsNum = request.getParameter("commentsNum");
		int commentsNum = Integer.parseInt(_commentsNum);
		
		String comments = request.getParameter("comments");
		
		String sql = "UPDATE comments SET comments=? WHERE commentsNum = ?";
		
		String href = "detail.jsp?postNum=" + postNum;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, comments);
			pstmt.setInt(2, commentsNum);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect(href);
	}

}
