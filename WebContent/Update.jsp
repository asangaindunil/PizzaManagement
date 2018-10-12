<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
 
<HTML>
    <HEAD>
        <TITLE>Fetching Data From a Database</TITLE>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
   <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">

   
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
            <th>ID </th>
               <TH>From:</TH>
               <TH>To :</TH>
               <TH>Description :</TH>
                          </TR>
      <%
      while(resultset.next()){
      %>                    
           <TR class="table-danger">
                          <TD> <%= resultset.getString(1) %> </TD>
           
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
<form class="contact100-form validate-form" action="Update"  method="post">
				<span class="contact100-form-title">
				Update Route
				</span>
				<div class="wrap-input100 validate-input" data-validate="ID Required">
					<span class="label-input100">ID :</span>
					<input class="input100" type="text" name="ID" placeholder="ID">
					<span class="focus-input100"></span>
				</div>
				<div  >
				</div>

				<div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate="Location Required">
					<span class="label-input100">From</span>
					<input class="input100" type="text" name="from" placeholder="Sender's Location">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 rs1-wrap-input100 validate-input" data-validate = "Location Required">
					<span class="label-input100">To</span>
					<input class="input100" type="text" name="to" placeholder="Receiver's Location">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input" data-validate = "Description is required">
					<span class="label-input100">Description</span>
					<textarea class="input100" name="description" placeholder="Description of product"></textarea>
					<span class="focus-input100"></span>
				</div>

				<div class="container-contact100-form-btn">
				
					<button class="contact100-form-btn">
						<span>
Update
							<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
						</span>
					</button>
				</div>
			</form>

 <font size="5" color="green"><a href="home.jsp">CLICK HERE TO GO BACK HOME</a></font>
 
 
    </BODY>
</HTML>