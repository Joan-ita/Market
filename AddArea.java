/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.market.adminpage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Joan
 */
public class AddArea extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String areaID = request.getParameter("areaID");
        String location = request.getParameter("location");
        String coordname = request.getParameter("username");
        String password = request.getParameter("password");
        
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch(ClassNotFoundException ex){
             System.out.println(ex);
        }
        
        try {
            //connecting to database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/market","root","");  
            
            String insert_to_area_table_query = "INSERT INTO area"
                    + " VALUES('" + areaID + "','" + location + "')";
            String insert_to_coord_table_query = "INSERT INTO cordinators(username,password,area_id)"
                    + " VALUES('" + coordname + "','" + password + "','" + areaID + "')";
            
            //executing query
            PreparedStatement area_table = con.prepareStatement(insert_to_area_table_query);
            PreparedStatement coord_table = con.prepareStatement(insert_to_coord_table_query);
            
            area_table.executeUpdate();
            coord_table.executeUpdate();
            
            response.sendRedirect("/market/addArea.jsp?msg=New Area has been Successfully saved");
               
           
        } catch (SQLException ex) {
            response.sendRedirect("/market/addArea.jsp?msg=" + ex);
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
