<%-- 
    Document   : addArea
    Created on : Jan 9, 2022, 9:34:35 AM
    Author     : Joan
--%>

<%-- 
    Document   : index.jsp
    Created on : Jan 8, 2022, 10:55:43 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <title>Add Area</title>
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
                <p class="text-center">Please enter details below to add the area</p>
                <%
                    if(request.getParameter("msg") != null){
                       out.println("<p style='color:red'>");
                            out.println(request.getParameter("msg"));
                       out.println("</p>");
                    }    
                %>
                <form action="/market/addArea" method="post">
                    
                    <div class="row">
                        <div class="col-md-6">
      
                            <h5 class="text-center">AREA DETAIL</h5><hr>
                            <br><br><br>

                            <label>ID</label><br>
                            <input type="text" name="areaID" class="form-control" required/><br>
                            <label>Location</label><br>
                            <input type="text" name="location" class="form-control" required/><br>
                        </div>

                        <div class="col-md-6">   
                            <h5 class="text-center">AREA COORDINATOR INFO</h5><hr>
                            <br><br><br>

                            <label>Username (should be fullname without spaces)</label><br>
                            <input type="text" name="username" class="form-control" required/><br>
                            <label>Assign password</label><br>
                            <input type="password" name="password" class="form-control" required/><br>


                            <input style="float:right" class="btn btn-primary" type="submit" value="Save New Area" />
                        </div>
                    </div>
                    
                </form>
              </div>
              
            </div>
        </div>
        <br>
    </body>
</html>


