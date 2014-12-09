<%-- 
    Document   : dashboard
    Created on : Nov 8, 2014, 3:31:33 PM
    Author     : linxiaohui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="css/customize.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/validateChecker.js"></script>
        <script src="js/jquery.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                        <span class="sr-only">Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="#"></a>
                </div>

                <div class="collapse navbar-collapse" id="navbar-collapse">
                    <ul class="nav navbar-nav">
                        <!-- Server Dropdown -->
                    </ul>

                    <!-- User Dropdown -->
                    <ul class="nav navbar-nav navbar-right">
                        
                        <li><a href="login.jsp"><i class="fa fa-btn fa-sign-in"></i>Login</a></li>
                    </ul>

                </div>
            </div>
        </nav>

        <% String username = (String)session.getAttribute("username");
        String password = (String)session.getAttribute("password");
         String email = (String)session.getAttribute("email");
        String status = (String)request.getAttribute("loginstatus");%>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-4 col-sm-offset-4">
                    <div class="panel panel-default" >
                        <div class="panel-heading"><%=status%>!! Here is Your Information</div>
                        <div class="panel-body panel-table">
                            <table class="table table-striped">
                                <thead>
                                   <tr><td>Attribute</td><td>Value</td></tr>
                                </thead>
                                <tbody>
                                <tr><td>Username:</td><td><%=username%></td></tr>
                                <tr><td>Password:</td><td><%=password%></td></tr>
                                <tr><td>Email:</td><td><%=email%></td></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
