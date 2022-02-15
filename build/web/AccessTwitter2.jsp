<%-- 
    Document   : User
    Created on : Dec 17, 2019, 3:51:13 PM
    Author     : Acer
--%>


<%@page import="java.util.Random"%>
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
   .image-upload>input {
  display: none;
}
        </style>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link href="style.css" rel="stylesheet"/>
    </head>
    <body>
        <div id="main">
          <nav>
              
                               
                       <a href="ViewT.jsp">View Tweets</a>
                 <a href="AccessTwitter.jsp">Compose Tweet</a>
                      
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
	<%  
String ii=(String)session.getAttribute("ii");  %>
             <h3>Welcome To : <%=ii%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=new Date()%></h3>
             
             
</div><!-- container -->   </center>
          <%
          
            String msg=request.getParameter("msg");
            if(msg!=null){
                if(msg.equals("success")){
                    %>
                    <center><font color="red">Tweet Successful...!!</font></center>
                    <%
                }else{
 %>
                    <center><font color="red">Tweet Failed...!!</font></center>
                    <%
}       }
            %>
                   <div id="s" style="width:400px;height:240px;border-radius:10px;border:1px solid #00ACEE;margin-bottom:100px;float:right;margin-right:400px;background:#00ACEE;">
                    <image src="images/twitter_PNG28.png" style="border-radius:100px;float:right;" width="40" height="40"/>   
                    <p style="float:right;margin-right:230px;color:white">@<%=ii%></p>
                       <image src="images/twitter_PNG28.png" style="border-radius:100px;" width="40" height="40"/>   
                       <form action="FakeTweetAction" method="post" enctype="multipart/form-data">
                       <textarea cols="50" rows="7" name="tweet" style="border-radius:10px;margin:10px;" required=""></textarea>
         
                                            <div class="image-upload">
  <label for="file-input">
    <img src="images/plus_PNG29.png" width="40" height="40"/>
  </label>
  <input id="file-input" type="file" name="image" required=""/>
</div>
                        <input type="submit" value="Tweet" style="border-radius:8px;width:80px;height:30px;float:right;margin-right:17px;background:#00008B;color:white;float:right;border:#00ACEE;">

                       </form>
                       
                       </div>
                   <div id="s1" style="width:200px;height:165px;border:none;margin-left: 345px;">
                  
                   
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
