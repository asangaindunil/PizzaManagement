<%
session.setMaxInactiveInterval(2);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
 <script type="text/javascript">
var Msg ='<%=session.getAttribute("getAlert")%>';
    if (Msg != "null") {
 function alertName(){
 alert("Form has been submitted");
 } 
 }
 </script> 
</head>
<body background="Accenture-Post-IVL-Marquee.jpg">

<div class="container" style="margin-top: 200px">
    <div class="row">
        <div class="col-4"></div>
<div class="col-5" style="color: white">
    <h1>     Route Management
<c:if test="${param.success eq 1}">
     <div> success </div>
</c:if>

    </h1>
</div>
<P>


<script type="text/javascript"> window.onload = alertName; </script>


</P>
    </div>
    <br/>
    <br/>
<div class="row">
    <div class="col-md-3 offset-md-3" >
        <button type="button" class="btn btn-info" onclick="window.location.href='Route.jsp'">Add Route</button>
    </div>
    <div class="col-md-3 offset-md-3">
        <button type="button" class="btn btn-warning" onclick="window.location.href='view.jsp'">View Route</button>
    </div>

    </div>
<br/>
    <br/>
   <div class="row">

    <div class="col-md-3 offset-md-3">
    <button type="button" class="btn btn-primary"  onclick="window.location.href='Update.jsp'">Edit Route</button>
    </div>

    <div class="col-md-3 offset-md-3">
        <button type="button" class="btn btn-success"  onclick="window.location.href='delete.jsp'">Delete Route</button>
    </div>
    </div>
    </div>
    

<script type="text/javascript"> window.onload = alertName; </script>


</body>
</html>