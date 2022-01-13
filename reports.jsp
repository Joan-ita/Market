<%-- 
    Document   : reports
    Created on : Jan 10, 2022, 7:47:22 PM
    Author     : Joan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="WEB-INF/admin.tld" prefix="market" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <title>Reports</title>
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
               
                    <h5 class="text-center">Report</h5>
                    
                    <br><br><br>
                    
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                  <h5 class="card-title">Campaigns</h5>
                                  <h6 class="card-subtitle mb-2 text-muted">approved campaigns</h6>
                                  <p class="card-text">Approved campaigns as per now are <market:totalCampaigns /> in total</p>
                                  
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                  <h5 class="card-title">Agents</h5>
                                  <h6 class="card-subtitle mb-2 text-muted">total registered</h6>
                                  <p class="card-text">Agents that have been registered are <market:totalAgents /> in total</p>
                                </div>
                            </div>
                        </div>
        
                        
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                  <h5 class="card-title">Areas</h5>
                                  <h6 class="card-subtitle mb-2 text-muted">all areas</h6>
                                  <p class="card-text">As of now, there are <market:totalAreas /> campaign areas in the system</p>
                                </div>
                            </div>
                        </div>
   
                    </div>

            

              </div>
            </div>
        </div>
    </body>
</html>