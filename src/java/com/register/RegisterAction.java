/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.register;

import com.connection.DbConnection;
import com.connection.Queries;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Acer
 */
 @MultipartConfig(maxFileSize=16177215)
public class RegisterAction extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
         String name=request.getParameter("names");
         String email=request.getParameter("email");
         String mobile=request.getParameter("mobile");
         String address=request.getParameter("address");
         String username=request.getParameter("uname");
         String password=request.getParameter("pwd");
         Part file=request.getPart("image");
         
         InputStream in=null;
         
         if(file!=null){
             in=file.getInputStream();
         }
         
      Connection con=DbConnection.getConnection();
          String sql="select count(*) from register where email='"+email+"' and username='"+username+"'";
   ResultSet rs=Queries.getExecuteQuery(sql);
   int count=0;
   while(rs.next()){
       count=rs.getInt(1);
      }
   if(count==0){
   PreparedStatement pst=con.prepareStatement("insert into register values(null,?,?,?,?,?,?,?,'waiting')");
   pst.setString(1,name);
    pst.setString(2,email);
     pst.setString(3,mobile);
      pst.setString(4,address);
       pst.setString(5,username);
      pst.setString(6,password);
     
     
   if(in!=null)
   {
       pst.setBlob(7, in);
   }
    int i=pst.executeUpdate();
      if(i>0){
       response.sendRedirect("Register.jsp?msg=success");   
      } else{
         response.sendRedirect("Register.jsp?msg=failed");    
      }
   }else{
        response.sendRedirect("Register.jsp?msg=Already Exist");  
   }
            
        }catch(Exception e){
           out.println(e);
        }
                
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
