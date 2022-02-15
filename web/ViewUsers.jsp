<%-- 
    Document   : User
    Created on : Dec 17, 2019, 3:51:13 PM
    Author     : Acer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.connection.Queries"%>
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
        
        <link href="style.css" rel="stylesheet"/>
         <link href="table.css" rel="stylesheet"/>
    </head>
    <body>
        <div id="main">
          <nav>
               <a href="Admin.jsp">Log out</a>
                <a href="ViewfakeData.jsp">View Fake Data</a>
                <a href="ViewfakeUsers.jsp">View Fake User</a>
                 <a href="AddFilter.jsp">Add Filter</a>
              
              <a href="ViewUsers.jsp">View Users</a>
                 <a href="AdminHome.jsp">Home</a>
             </nav>
            <h3 style="color:coral;margin-left:100px;"> Spammer Detection</h3>
        </div>
      <div id="scroll">
          <image class="mySlides" src="images/image1.jpg" width="100%" height="450"/>
            <image class="mySlides" src="images/image2.jpg" width="100%" height="450"/>
              <image class="mySlides" src="images/image3.jpg" width="100%" height="450"/>
      </div>
  <div id="bdy">
      <center>
         <div class="container">
	
             <h3>---View Users---</h3>
              <table>
                  
        <tr>
            <th>Profile</th><th>Email</th><th>Mobile</th><th>UserName</th><th>Status</th></tr>
        <%
        try{
            String sql="select * from register";
         
            ResultSet r=Queries.getExecuteQuery(sql);
            while(r.next()){
                String satus=r.getString("status");
              %>
        <tr>
            <td><image src="view.jsp?email=<%=r.getString("email")%>"  width="100" height="100"></td>
            <td><%=r.getString("email")%></td>
            <td><%=r.getString("mobile")%></td>
            <td><%=r.getString("username")%></td>
            <%if(satus.equals("waiting")){
           %>
             <td><a href="Authorize.jsp?email=<%=r.getString("email")%>">Authorize</a></td>
           
            <%
            }else{
%>
             <td><%=r.getString("status")%></td>
           
            <%
}%>
            
        </tr>
        
        <%
            }
        }catch(Exception e){
            System.out.println(e);
        }
        
        %>
        
        
        
    </table>
             
</div><!-- container -->   </center>
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
