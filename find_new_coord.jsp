<%-- 
    Document   : find_new_coord
    Created on : Jan 10, 2022, 7:17:27 PM
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
                <p class="text-center">Please select another coordinator</p>
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
                <form action="/market/updateCoord" method="post">
                    
                    <input type="text" name="matID" value='<%=request.getParameter("id") %>' class="form-control" hidden/><br>
                    
                    
                    <label>Coordinator</label><br>
                    <select name="coordinatorID" class="form-control" required>
                         <market:coordinators />
                    </select><br>
                    
                    <input class="btn btn-primary" type="submit" value="Submit coordinator" />
                </form>
              </div>
            </div>
        </div>
    </body>
</html>