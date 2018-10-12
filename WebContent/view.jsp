<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
 
<HTML>
    <HEAD>
        <TITLE>Fetching Data From a Database</TITLE>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    </HEAD>
 
    <BODY>
 
    <center>
        <font size="7" color="green">Route Details View</font>
 
    </center>
 
        <% 
            Connection connection = DriverManager.getConnection( "jdbc:mysql://localhost:3306/reg", "root", "");
 
            Statement statement = connection.createStatement();
 
            
            ResultSet resultset = 
                statement.executeQuery("select * from route") ; 
 
            if(!resultset.next()) {
                out.println("SORRY, WE COULD NOT GET YOUR INFORMATIONS. ");
            } else {
            
        %>
 
        <TABLE BORDER="1"class="table">
            <TR class="table-primary">
               <TH>From:</TH>
               <TH>To :</TH>
               <TH>Description :</TH>
                          </TR>
      <%
      while(resultset.next()){
      %>                    
           <TR class="table-danger">
               <TD> <%= resultset.getString(2) %> </TD>
               <TD> <%= resultset.getString(3) %> </TD>
               <TD> <%= resultset.getString(4) %></TD>
 
 
                          </TR>
                          <%} %>
       </TABLE>
       <BR>
       <% 
           } 
       %>
 
<BODY bgcolor="#ffffcc">
<font size="5" color="green"><a href="home.jsp">CLICK HERE TO GO BACK HOME</a></font>
 
 
    </BODY>
</HTML>