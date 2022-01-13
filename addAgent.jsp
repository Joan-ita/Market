<%-- 
    Document   : addAgent
    Created on : Jan 10, 2022, 3:24:29 PM
    Author     : Joan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <title>Login</title>
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
              <div class="col-md-6 ml-auto">
                <p class="text-center">Please enter agent's detail below</p>
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
                <form action="/market/saveAgent" method="post">
                    <label>Username</label><br>
                    <input type="text" name="username" class="form-control" required/><br>
                    
                    <label>Phone</label><br>
                    <input type="number" name="phone" class="form-control" required/><br>
                    
                    <label>Password</label><br>
                    <input type="password" name="password" class="form-control" required/><br>
                    
                    <input class="btn btn-primary" type="submit" value="Save Agent" />
                </form>
              </div>
            </div>
        </div>
    </body>
</html>
