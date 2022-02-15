<%-- 
    Document   : FilterAction
    Created on : Dec 18, 2019, 4:04:18 PM
    Author     : Acer
--%>

<%@page import="com.connection.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String word=request.getParameter("word");
try{
    String query="insert into filter values(null,'"+word+"')";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
      response.sendRedirect("AddFilter.jsp?msg=success");  
    }else{
      response.sendRedirect("AddFilter.jsp?msg=failed");   
    }
}catch(Exception e){
  out.println(e);  
}

%>