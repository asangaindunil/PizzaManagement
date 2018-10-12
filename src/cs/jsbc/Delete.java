package cs.jsbc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.jws.Oneway;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
@WebServlet("/Delete")


public class Delete extends HttpServlet
{
public void doGet(HttpServletRequest req, HttpServletResponse res)
throws IOException, ServletException
{
res.setContentType("text/html");
PrintWriter pw = res.getWriter();
Connection con;
PreparedStatement st;
ResultSet rs;
try
{ 
Class.forName("com.mysql.jdbc.Driver");
String id =req.getParameter("id");
System.out.println(id);
con =        DriverManager.getConnection("jdbc:mysql://localhost:3306/reg","root","");
st= con.prepareStatement("delete from route where `route id` = ?");
st.setString(1, id);
st.executeUpdate();
int i = st.executeUpdate();
if(i!=0)
pw.println("Deleting row...");

else if (i==0)
{
req.getRequestDispatcher("delete.jsp").forward(req, res);
}
}
catch(SQLException sx)
{
pw.println(sx);
}
catch(ClassNotFoundException cx)
{
pw.println(cx);
}   
}
}