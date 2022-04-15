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

@WebServlet("/modify")
public class modify extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String _postNum = request.getParameter("postNum");
		int postNum = Integer.parseInt(_postNum);
		String _tag = request.getParameter("tag");
		int tag = Integer.parseInt(_tag);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		String sql = "UPDATE postDb SET tag=?, title=?, content=? WHERE postNum = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBcon.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, tag);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setInt(4, postNum);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("post1.jsp");
	}

}
