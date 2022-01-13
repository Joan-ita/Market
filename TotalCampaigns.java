/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/TagHandler.java to edit this template
 */
package com.market.adminpage;

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
public class TotalCampaigns extends SimpleTagSupport {

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
            
            String query = "SELECT p.*,c.username as cordinator,s.*,m.*,a.*"
                + " FROM promotion AS p"
                + " LEFT JOIN cordinators c"
                + " ON p.cordinator_id = c.id"
                + " LEFT JOIN schedule s"
                + " ON s.area_id = c.area_id"
                + " LEFT JOIN materials m"
                + " ON m.id = p.material_id"
                + " LEFT JOIN area a"
                + " ON a.id = c.area_id"
                + " ORDER BY p.id DESC";
            
            ResultSet res = st.executeQuery(query);
            int count = 0;
            
            try {
               
                    
                
                while(res.next()){
                    count++;
                }
                out.println(count);    

            
            }catch(java.io.IOException e) {
               System.out.println(e); 
            }
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
}
