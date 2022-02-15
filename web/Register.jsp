<%-- 
    Document   : User
    Created on : Dec 17, 2019, 3:51:13 PM
    Author     : Acer
--%>

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
                background: blue
                
            }
            nav a{
        color: blACK;
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
        color:greY;
    }
    #bdy{
        width:100%;
        height:400px;
       
    }
        </style>
        <link href="style.css" rel="stylesheet"/>
    </head>
    <body>
        <div id="main">
          <nav>
               <a href="Admin.jsp">Admin Login</a>
              <a href="User.jsp">User Login</a>
                 <a href="index.html">Home</a>
             </nav>
            <h3 style="color:coral"> Spammer Detection and Fake User Identification on Social Networks</h3>
        </div>
      <div id="scroll">
          <image class="mySlides" src="images/image1.jpg" width="100%" height="450"/>
            <image class="mySlides" src="images/image2.jpg" width="100%" height="450"/>
              <image class="mySlides" src="images/image3.jpg" width="100%" height="450"/>
      </div>
  <div id="bdy">
      <center>
         <div class="container">
	<section id="content">
            
		<form action="RegisterAction" method="post" enctype='multipart/form-data'>
                    <h1>Register Form</h1>
                    <%
            String msg=request.getParameter("msg");
            if(msg!=null){
                if(msg.equals("success")){
                    %>
                    <font color="red">Registration Successful...!!</font>
                    <%
                }else if(msg.equals("failed")){
 %>
                    <font color="red">Registration Failed...!!</font>
                    <%
}else{
 %>
                    <font color="red">Email/Username Already Exist...!!</font>
                    <%
}
            }
            %>
			
			<div>
				<input type="text" placeholder="Name" required="" name="names" id="username" />
			</div>
			<div>
				<input type="text" placeholder="Email" name="email" required="" id="password" />
			</div>
                        <div>
				<input type="text" placeholder="Mobile" name="mobile" required="" id="password" />
			</div>
                        <div>
				<input type="text" placeholder="Address" required="" name="address" id="username" />
			</div>
                        <div>
				<input type="text" placeholder="UserName" required="" name="uname" id="username" />
			</div>
                          <div>
				<input type="password" placeholder="Password" required="" name="pwd" id="username" />
			</div>
                          <div style='margin-left:10px;border:1px solid gainsboro;width:340px;height:40px;border-radius:5px;background:gainsboro'>
				<input type="file" placeholder="Profile" required="" name="image" id="username" />
			</div>
			<div>
				<input type="submit" value="Register" />
				<!--<a href="#">Lost your password?</a>-->
				<a href="User.jsp">Login</a>
			</div>
		</form><!-- form -->
		<div class="button">
			<!--<a href="#">Download source file</a>-->
		</div><!-- button -->
	</section><!-- content -->
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
