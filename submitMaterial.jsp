<%-- 
    Document   : submitMaterial
    Created on : Jan 10, 2022, 4:21:15 PM
    Author     : Joan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="WEB-INF/agent.tld" prefix="market" %>
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
                  <a class="nav-link" href="/market/agent.jsp">Materials</a>
                </li>
              
                <li class="nav-item">
                  <a class="nav-link" href="/market/submitMaterial.jsp">&plus;Submit</a>
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
                <p class="text-center">Please enter Material detail below</p>
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
                <form action="/market/saveMaterial" method="post">
                    <label>Type</label><br>
                    <input type="text" name="type" class="form-control" required/><br>
                    
                    <label>Agent ID</label><br>
                    <market:agentID where='<%= (String)session.getAttribute("username") %>' />
                    
                    <label>Coordinator</label><br>
                    <select name="coordinatorID" class="form-control" required>
                         <market:coordinators />
                    </select><br>
                    
                    <input class="btn btn-primary" type="submit" value="Submit material" />
                </form>
              </div>
            </div>
        </div>
    </body>
</html>

