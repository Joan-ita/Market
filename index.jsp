<%-- 
    Document   : index.jsp
    Created on : Jan 8, 2022, 10:55:43 PM
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
        </nav>
        <br><br><br>

        <div class="container">
            <div class="row">
              <div class="col-md-6 ml-auto">
                <p class="text-center">Please enter your details below to login</p>
                <%
                    if(session.getAttribute("username") != ""){
                        session.invalidate();
                    }
                    if(request.getParameter("error") != null){
                       out.println("<p style='color:red'>");
                            out.println(request.getParameter("error"));
                       out.println("</p>");
                    }
                
                    
                %>
                <form action="/market/home" method="post">
                    <label>Username</label><br>
                    <input type="text" name="username" class="form-control" required/><br>
                    <label>Password</label><br>
                    <input type="password" name="password" class="form-control" required/><br>
                    <label>who are you?</label><br>
                    <select name="type" class="form-control" required>
                      <option></option>
                      <option value="administrator">Administrator</option>
                      <option value="coordinator">Coordinator</option>
                      <option value="agent">Agent</option>
                    </select><br>
                    <input class="btn btn-primary" type="submit" value="Login" />
                </form>
              </div>
            </div>
        </div>
    </body>
</html>

