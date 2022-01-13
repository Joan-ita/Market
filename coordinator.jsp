<%-- 
    Document   : coordinator
    Created on : Jan 9, 2022, 7:37:07 AM
    Author     : Joan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="WEB-INF/coordinator.tld" prefix="market" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <title>Campaigns</title>
         <style>
            body{
               
                background-color: activecaption;
            }
           
        </style>


    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a style="padding-left:15px" class="navbar-brand" href="#">M & E Company</a>
            <div class="collapse navbar-collapse" id="navbarText">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="/market/coordinator.jsp">Materials</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/market/schedules_cord.jsp">Schedule</a>
                </li>
              </ul>
              <span class="navbar-text">
                  <a class="nav-link" href="/market/index.jsp">Logout</a>
              </span>
            </div>
        </nav>
        <br><br><br>

        <div class="container">
            <div class="row">
                <div class="col-md-12">
               
                
                    <h5 class="text-center">Campaign Material</h5>
                    
                    <%
    //                    if(session.getAttribute("username") != ""){
    //                        session.invalidate();
    //                    }
                        if(request.getParameter("msg") != null){
                           out.println("<p style='color:red'>");
                                out.println(request.getParameter("msg"));
                           out.println("</p>");
                        }


                    %>

                    <br><br><br>

                    <market:select where='<%= (String)session.getAttribute("username") %>' />
                   
              </div>
            </div>
        </div>
    </body>
</html>



