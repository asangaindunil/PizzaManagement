package cs.jsbc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class addroute
 */
@WebServlet("/addroute")
public class addroute extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public addroute() {
        // TODO Auto-generated constructor stub
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		Connection con;
		//PreparedStatement ps;
		 try {
			 String from = request.getParameter("from");
			 String to = request.getParameter("to");
			 String description = request.getParameter("description");
			 
			 con= Dbconnect.getDBConnection();
			String sql=("insert into route ('from','to','description' ) values(?,?,?)");

			 PreparedStatement statement = con.prepareStatement(sql);
			 statement.setString(1, from);
			 statement.setString(2, to);
			 statement.setString(3, description);
			 //statement.setString(4, "bill.gates@microsoft.com");
 
			 int rowsInserted = statement.executeUpdate();
			 if (rowsInserted > 0) {
    System.out.println("A new user was inserted successfully!");

			 }
		        HttpSession session = request.getSession();

			 session.setAttribute("getAlert", "Yes");//Just initialize a random variable.


			 response.sendRedirect("home.jsp?success=1");

				
			 
		 }
		 catch (Exception e) {
				// TODO: handle exception
			}

		 }
		
	}

