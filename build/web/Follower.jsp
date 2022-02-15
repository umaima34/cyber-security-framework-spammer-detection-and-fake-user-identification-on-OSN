<%-- 
    Document   : User
    Created on : Dec 17, 2019, 3:51:13 PM
    Author     : Acer
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="com.connection.Queries"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Spammer Detection</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body{
                margin:0px;
            }
            #main{
                width:100%;
                height:60px;
                border:1px solid whitesmoke;
                position: fixed;
                background: whitesmoke;
                
            }
            nav a{
        color: coral;
        text-decoration: none;
        padding: 7px 25px;
        display: inline-block;
        float:right;
        margin-top:20px;
        margin-right:50px;
        font-weight:bolder;
    }
    #scroll{
        width:100%;
        height:450px;
            border:5px solid gold;
    }
    a:hover{
        color:green;
    }

        </style>
           <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="table.css" rel="stylesheet"/>
          
    </head>
    <body>
        <div id="main">
          <nav>
               <a href="User.jsp">Log out</a>
                            <a href="Follower.jsp">Follower</a>
                       <a href="Following.jsp">Following</a>
                       <a href="Treding.jsp">Trending</a>
                      <a href="ComposeTweet.jsp">Compose Tweet</a>
                      <a href="Profile.jsp">Profile</a>
                       <a href="UserHome.jsp">Home</a>
             </nav>
            <h3 style="color:blueviolet;margin-left:100px;"> Twitter</h3>
        </div>
      <div id="scroll">
          <image class="mySlides" src="images/image1.jpg" width="100%" height="450"/>
            <image class="mySlides" src="images/image2.jpg" width="100%" height="450"/>
              <image class="mySlides" src="images/image3.jpg" width="100%" height="450"/>
      </div>
  <div id="bdy">
      <center>
         <div class="container" style="border-bottom:1px solid grey;">
	<% String email=(String)session.getAttribute("email");
         String uname=(String)session.getAttribute("username");%>
             <h3>Welcome To :<%=email%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=new Date()%></h3>
   </div><!-- container -->   </center>
   
        <center>
           <h3 style="color:#00ACEE;">FOLLOWER</h3>
           <%
           String query="select * from follow  where following='"+uname+"'";
           
ResultSet r=Queries.getExecuteQuery(query);
%>
<table style="margin-bottom:100px;">
           <tr><th>ID</th><th>Name</th></tr>
           
<%
while(r.next()){
    
   %>
  
   <div id="u" style="width:200px;height:50px;border:none;float:right;margin-right:60px;">
       
       <tr> 
           <tr><td><%=r.getString("id")%></td>
           <td><%=r.getString("user")%></td>
           </tr>
      
  
<%}%> 
</table>
        </center>

   </div>
    
   
   
  </div>
        
<script>
var myIndex = 0;
carousel();

function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 2000);    
}
</script>    
        
    </body>
</html>
