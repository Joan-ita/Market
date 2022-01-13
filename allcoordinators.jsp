<%-- 
    Document   : allcoordinators
    Created on : Jan 10, 2022, 3:54:50 PM
    Author     : Joan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="WEB-INF/admin.tld" prefix="market" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <title>All Coordinators</title>
         <style>
            body{
               
                background-color: aqua;
            }
           
        </style>


    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a style="padding-left:15px" class="navbar-brand" href="#">M & E Company</a>
            <div class="collapse navbar-collapse" id="navbarText">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="/market/admin.jsp">Campaigns</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/market/addArea.jsp">&plus;Area</a>
                </li>
                 <li class="nav-item">
                  <a class="nav-link" href="/market/addAgent.jsp">&plus;Agent</a>
                </li>
               
                <li class="nav-item">
                  <a class="nav-link" href="/market/reports.jsp">Reports</a>
                </li>
                
                
                <li class="nav-item">
                  <a class="nav-link" href="/market/allagents.jsp">Agents</a>
                </li>
                
                <li class="nav-item">
                  <a class="nav-link" href="/market/areas.jsp">Areas</a>
                </li>
                
                
                <li class="nav-item">
                  <a class="nav-link" href="/market/allcoordinators.jsp">Coordinators</a>
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
               
                    <h5 class="text-center">Coordinators List</h5>
                    
                    <br><br><br>

                    <market:coordinators />

              </div>
            </div>
        </div>
    </body>
</html>

