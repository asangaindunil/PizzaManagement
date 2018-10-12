package cs.jsbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		try {
		
			
			Connection con;
			PreparedStatement ps;
		
	
			con = Dbconnect.getDBConnection();
			
			
			ps = con.prepareStatement("SELECT * FROM login WHERE Username = ?");
			
			ps.setString(1, request.getParameter("user"));
			
			ResultSet rs = ps.executeQuery();
			String password = "";
			
			while (rs.next()) {
				
				password = rs.getString("Password");
				
			}
			
			
			
			if (password.equals(request.getParameter("pass"))) {
				HttpSession session = request.getSession(true);
				session.setAttribute("user",request.getParameter("user") );
				request.setAttribute("result", "Login Successful");
				
				RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
				
				rd.forward(request, response);
				
			
			}
			else {
				request.setAttribute("result", "Login Failed");
			
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
			ps.close();
			con.close();
			
			
		} catch (Exception e) {
			
			e.getStackTrace();
	
			
			
		}
		
	}

}