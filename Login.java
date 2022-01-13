/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.market.firstpage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Joan
 */

public class Login extends HttpServlet {

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
        
        String uname = request.getParameter("username");
        String pword = request.getParameter("password");
        String type = request.getParameter("type");
        HttpSession ses = request.getSession();
        int size = 0;
        
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch(ClassNotFoundException e){
            System.out.println(e);
        }
        
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/market","root","");
            Statement st = con.createStatement();
            ResultSet res = null;
            
            switch(type){
                case "administrator":
                    res = st.executeQuery("SELECT * FROM admin WHERE username ='" + uname + "' AND password ='" + pword + "' LIMIT 1");
                    
                    while(res.next()){
                        size++;
                    }
                    
                    if(size > 0){
                        ses.setAttribute("username",uname);
                        RequestDispatcher rd = request.getRequestDispatcher("/reports.jsp");
                        rd.include(request, response);
                    }else{
                        response.sendRedirect("/market/index.jsp?error=User does not exist");
                    }
                    break;
                case "coordinator":
                    res = st.executeQuery("SELECT * FROM cordinators WHERE username ='" + uname + "' AND password ='" + pword + "' LIMIT 1");
                    
                    while(res.next()){
                        size++;
                    }
                    
                    if(size > 0){
                        ses.setAttribute("username",uname);
                        RequestDispatcher rd = request.getRequestDispatcher("/coordinator.jsp");
                        rd.include(request, response);
                    }else{
                        response.sendRedirect("/market/index.jsp?error=User does not exist");
                    }
                    break;
                case "agent":
                    res = st.executeQuery("SELECT * FROM agent WHERE username ='" + uname + "' AND password ='" + pword + "' LIMIT 1");
                    
                    while(res.next()){
                        size++;
                    }
                    
                    if(size > 0){
                        ses.setAttribute("username",uname);
                        RequestDispatcher rd = request.getRequestDispatcher("/agent.jsp");
                        rd.include(request, response);
                    }else{
                        response.sendRedirect("/market/index.jsp?error=User does not exist");
                    }
                    break;
                default:
                    response.sendRedirect("/market/index.jsp?error=User does not exist");
            }
            
        }catch(SQLException e){
            System.out.println(e);
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
