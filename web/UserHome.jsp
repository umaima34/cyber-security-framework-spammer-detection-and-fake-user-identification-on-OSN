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
        <link href="style.css" rel="stylesheet"/>
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
   <center><H2>TIMELINE</H2></center>
   <div id="tweets" style="width:400px;height:auto;border:none;float:right;margin-right:400px;margin-bottom: 100px; ">
       <center>
           <h3 style="color:#00ACEE;">Public Tweets</h3>
           <% 
           String query="select * from tweet";
           
ResultSet r=Queries.getExecuteQuery(query);
while(r.next()){
   %>
  
   <div id="u" style="width:200px;height:50px;border:none;float:right;margin-right:60px;"><p style="float:left"><%=r.getString("user")%>  <font color="olive">@<%=r.getString("user")%></font></p></div>
   <div id="u" style="width:50px;height:50px;border:none;float:left;margin-left:80px;">
       <image src="view.jsp?email=<%=email%>" width="40" height="40" style="border-radius:15px;"/>
   </div>
   <center>
  
       <a href="ViewTweet.jsp?user=<%=r.getString("user")%>"> <image src="view1.jsp?id=<%=r.getString("id")%>" width="250" height="250" style="margin:0px;"></a>
   </center>
   <%
}
           
           %>
   <% 
           String query11="select * from ftweet";
           
ResultSet r11=Queries.getExecuteQuery(query11);
while(r11.next()){
   %>
  
   <div id="u" style="width:200px;height:50px;border:none;float:right;margin-right:60px;"><p style="float:left"><%=r11.getString("user")%>  <font color="red">@<%=r11.getString("user")%></font></p></div>
   <div id="u" style="width:50px;height:50px;border:none;float:left;margin-left:80px;">
       <image src="" width="40" height="40" style="border-radius:15px;"/>
   </div>
   <center>
  
       <a href="ViewTweet1.jsp?user=<%=r11.getString("user")%>"> <image src="Fview.jsp?id=<%=r11.getString("id")%>" width="250" height="250" style="margin:0px;"></a>
   </center>
   <%
}
           
           %>
           
           
           
       </center>
   </div>
     <div id="tweets" style="width:200px;height:auto;border:none;float:left;margin-left:300px;">
   <center>
           <h3 style="color:#00ACEE;">You Might Like</h3>
           <%
               String query1="Select * from register where email!='"+email+"' and status='Authorized'";
               ResultSet r1=Queries.getExecuteQuery(query1);
               while(r1.next()){
               
                   %>
                   <table>
                       <tr><td><p  style="margin-left:20px;color:coral;"><%=r1.getString("username")%></p></td></tr>
                       <tr><td> <image src="view.jsp?email=<%=r1.getString("email")%>" width="80" height="80" style="border-radius:80px;margin-right:0px;"/>
                               
                               <%String s="select count(*) from follow where user='"+uname+"' and following='"+r1.getString("username")+"'";
                               ResultSet rr1=Queries.getExecuteQuery(s);
                               int c=0;
                               while(rr1.next()){
                                  c=rr1.getInt(1); 
                               }
                               if(c==0){
                               %>
                       <tr><td><p  style="margin-left:20px;"><a href="Follow.jsp?follower=<%=r1.getString("username")%>"><font color=""><b><i>Follow</i></b></font></a></p></td></tr>   
                           </td></tr>
                   <%}else{
%>
              <tr><td><p  style="margin-left:20px;"><font color=""><b><i>Following</i></b></font></p></td></tr>   
                           </td></tr>      
                   <%
}%>
                   </table>
                     <%
               }
               %>
                   
           
           
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
