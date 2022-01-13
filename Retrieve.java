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
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author Joan
 */
public class Retrieve extends SimpleTagSupport {

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
            
            String query = "SELECT m.*,a.*,a.id AS ag,m.id AS mat,c.id as coord"
                + " FROM materials AS m"
                + " LEFT JOIN agent a"
                + " ON m.agent_id = a.id"
                + " LEFT JOIN cordinators c"
                + " ON m.cordinator_id = c.id"
                + " WHERE c.username = '" + where + "'";
            
            ResultSet res = st.executeQuery(query);
            
            try {
                out.println("<table class='table table-bordered' >");
                out.println("<tr>");
                    out.println("<th>Material Type</th>");
               
                    out.println("<th>Agent</th>");
               
               
                    out.println("<th>Approval Status</th>");
                    
                    out.println("<th>Action</th>");
                    
                out.println("</tr>");
                while(res.next()){
                    out.println("<tr>");
                        out.println("<td>"+ res.getString("type") + "</td>");
                  
                        out.println("<td>"+ res.getString("username") + "</td>");
                        
                        if(res.getInt("is_approved") == 1){
                            out.println("<td>Approved</td>");
                            out.println("<td>---</td>");
                            
                        }else if(res.getInt("is_approved") == 2){
                            out.println("<td>Rejected</td>");
                            out.println("<td>---</td>");
                            
                        }
                        else{
                            out.println("<td>Not Approved</td>");
                            out.println("<td>");
                                out.println("<a class='btn btn-primary' href='/market/approve?id="+ res.getInt("mat") + "&aid=" + res.getInt("ag")+"&cid=" + res.getInt("coord")+"'>Approve</a>");    
                                out.println("<a class='btn btn-primary' href='/market/reject?id="+ res.getInt("mat") + "'>Reject</a>");
                            out.println("</td>");
                        }
                             
                    out.println("</tr>");
                }
                out.println("</table>");

            
            }catch(java.io.IOException e) {
               System.out.println(e); 
            }
        }catch(SQLException ex){
            System.out.println(ex);
        }
       
    }

    public void setWhere(String where) {
        this.where = where;
    }
    
}
