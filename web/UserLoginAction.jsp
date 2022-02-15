<%-- 
    Document   : RegAction
    Created on : Dec 14, 2019, 12:16:44 PM
    Author     : Acer
--%>

<%@page import="com.connection.Queries"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{
  
   String username=request.getParameter("uname");
   String pwd=request.getParameter("pwd");
   
   
 
   
   String sql="select * from register where username='"+username+"' and password='"+pwd+"'";
   
   ResultSet r=Queries.getExecuteQuery(sql);
   String status=null;
   if(r.next()){
      status=r.getString("status");
   
   if(status.equals("waiting")){
       %>
    <script type="text/javascript">
        window.alert("Your Not Authorized by the Admin...!!");
        window.location="User.jsp";
        </script>
    <% 
   }
      
      
          session.setAttribute("email",r.getString("email"));
                   session.setAttribute("username",username);
       %>
    <script type="text/javascript">
        window.alert("Login Success...!!");
        window.location="UserHome.jsp";
        </script>
    <%   
     
   }else{
 %>
    <script type="text/javascript">
        window.alert("Login Failed...!!");
        window.location="User.jsp";
        </script>
    <%
}
   
}catch(Exception e){
  System.out.println(e);
}


%>