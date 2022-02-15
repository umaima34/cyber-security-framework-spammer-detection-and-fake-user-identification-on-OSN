<%-- 
    Document   : ReTweetAction
    Created on : Dec 18, 2019, 5:14:51 PM
    Author     : Acer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.connection.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String uname=request.getParameter("uname");
String id=request.getParameter("id");
String tweet=request.getParameter("tweet");

try{
    String sql="select * from filter";
    ResultSet r=Queries.getExecuteQuery(sql);
    while(r.next()){
        String word=r.getString("word");
        
        if(tweet.contains(word)){
           
            String s="insert into retweet values('"+uname+"','"+id+"','"+tweet+"','"+word+"',now())";
            int i=Queries.getExecuteUpdate(s);
            if(i>0){
              response.sendRedirect("UserHome.jsp?msg=success");  
            }else{
               response.sendRedirect("UserHome.jsp?msg=failed"); 
            }
            
            
        }else{
           String s="insert into retweet values('"+uname+"','"+id+"','"+tweet+"','No Fake',now())";
            int i=Queries.getExecuteUpdate(s);
            if(i>0){
              response.sendRedirect("UserHome.jsp?msg=success");  
            }else{
               response.sendRedirect("UserHome.jsp?msg=failed"); 
            } 
        }
        
    }
    
}catch(Exception e){
out.println(e);    
}


%>