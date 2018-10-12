package cs.jsbc;

import java.sql.DriverManager;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class test
 */
@WebServlet("/test")
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test() {
        super();
        // TODO Auto-generated constructor stub
    }	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.getRequestDispatcher("Route.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html");
		Connection con ;
		PreparedStatement ps;

		String insertTableSQL = "INSERT INTO route"
				+ "(`from`,`to`,`description`) VALUES"
				+ "(?,?,?)";

		 
		try {
			
			con = Dbconnect.getDBConnection();		
			ps = con.prepareStatement(insertTableSQL);
			ps.setString(1, request.getParameter("from"));
			ps.setString(2, request.getParameter("to"));
			ps.setString(3, request.getParameter("description"));
			
			ps.executeUpdate();
		
			if (ps != null) {
				ps.close();
			}

			if (con != null) {
				con.close();
			}
			//if (rows > 0)
			//{
				//PrintWriter out = response.getWriter();
			
		//		out.println("<p><b>Successful added</b></p>");
			

			//	request.getRequestDispatcher("home.jsp");
			//}
			//	ps.close();
		//	con.close();
			 request.getRequestDispatcher("home.jsp").forward(request, response);;

			
			System.out.println("Record is inserted into DBUSER table!");

		} catch (SQLException e) {

			System.out.println(e.getMessage());

		} }

		

	}


