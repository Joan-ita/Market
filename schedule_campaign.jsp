<%-- 
    Document   : approve
    Created on : Jan 10, 2022, 5:42:13 PM
    Author     : Joan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="WEB-INF/agent.tld" prefix="market" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <title>Schedule</title>
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
              <div class="col-md-6 ml-auto">
                <p class="text-center">The material has been approved and agent assigned campaign area</p>
                <p class="text-center">Fill the form below to schedule campaign</p>
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
                <form action="/market/saveSchedule" method="post">
                    <label>Time</label><br>
                    <input type="time" name="time" class="form-control" required/><br>
                    
                    <label>Date</label><br>
                     <input type="date" name="date" class="form-control" required/><br>
                    
                    <label>Area ID</label><br>
                    <input type="text" name="areaID" value='<%=request.getParameter("ar") %>' class="form-control" readonly/><br>
                    
                    <input class="btn btn-primary" type="submit" value="Submit schedule" />
                </form>
              </div>
            </div>
        </div>
    </body>
</html>

