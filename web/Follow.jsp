<%-- 
    Document   : Follow
    Created on : Dec 18, 2019, 3:07:30 PM
    Author     : Acer
--%>

<%@page import="com.connection.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String uname=(String)session.getAttribute("username");
String following=request.getParameter("follower");

try{
    String ssql="insert into follow value(null,'"+uname+"','"+following+"')";
    int i=Queries.getExecuteUpdate(ssql);
    if(i>0){
        response.sendRedirect("UserHome.jsp");
    }else{
        response.sendRedirect("UserHome.jsp");
    }
    
}catch(Exception e){
  e.printStackTrace();
}


%>