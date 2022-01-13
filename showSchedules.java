/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/TagHandler.java to edit this template
 */
package com.market.coordinatorpage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author Joan
 */
public class showSchedules extends SimpleTagSupport {

    private String where;

    /**
     * Called by the container to invoke this tag. The implementation of this
     * method is provided by the tag library developer, and handles all tag
     * processing, body iteration, etc.
     */
    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch(ClassNotFoundException e){
            System.out.println(e);
        }
        
        try{
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/market","root","");
            Statement st = con.createStatement();
            
            String query = "SELECT s.*,c.*"
                + " FROM schedule AS s"
                + " LEFT JOIN cordinators c"
                + " ON s.area_id = c.area_id"
                + " WHERE c.username = '" + where + "'";
            
            ResultSet res = st.executeQuery(query);
            
            try {
                out.println("<table class='table table-bordered' >");
                out.println("<tr>");
                    out.println("<th>Time</th>");
               
                    out.println("<th>Date</th>");               
               
                    
                out.println("</tr>");
                while(res.next()){
                    out.println("<tr>");
                        out.println("<td>"+ res.getString("time") + "</td>");
                   
                        out.println("<td>"+ res.getString("date") + "</td>");
                        
                    out.println("</tr>");
                }
                out.println("</table>");

            
            }catch(java.io.IOException e) {
               System.out.println(e); 
            }
        }catch(SQLException e){
            System.out.println(e);
        }
    }

    public void setWhere(String where) {
        this.where = where;
    }
    
}
