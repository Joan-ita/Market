/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/TagHandler.java to edit this template
 */
package com.market.agentpage;

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
public class getAgentID extends SimpleTagSupport {

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
            
            String query = "SELECT * FROM agent WHERE username = '" + where + "' LIMIT 1";
            
            ResultSet res = st.executeQuery(query);
            
            try {
                while(res.next()){
                    out.println("<input type='text' value='" + res.getString("id") + "' name='agentID' class='form-control' readonly/><br>");      
                }
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
