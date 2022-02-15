<%-- 
    Document   : Authorize
    Created on : Dec 14, 2019, 2:06:26 PM
    Author     : Acer
--%>

<%@page import="com.connection.Queries"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String email=request.getParameter("email");
try{
 
 String sql="update register set status='Authorized' where email='"+email+"'";
    int i=Queries.getExecuteUpdate(sql);
    if(i>0){
       %>
    <script type="text/javascript">
        window.alert("User Authorization Success...!!");
        window.location="ViewUsers.jsp";
        </script>
    <%     
    }else{
%>
    <script type="text/javascript">
        window.alert("User Authorization Failed...!!");
        window.location="ViewUsers.jsp";
        </script>
    <% 
}
}catch(Exception e){
   System.out.println(e); 
}

%>
