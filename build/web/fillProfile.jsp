<%-- 
    Document   : fillProfile
    Created on : Nov 29, 2014, 11:30:03 AM
    Author     : linxiaohui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Fill Your Profile</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="css/customize.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/jasny-bootstrap.min.css">
        <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jasny-bootstrap.min.js"></script>
        <script src="js/validateChecker.js"></script>
        <script src="js/jquery.js"></script>
        <script type="text/javascript">

        </script>
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
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="mypost.jsp?page=0">Post</a></li>
                            <li><a href="search.jsp?page=0">Search</a></li>
                            <li><a href="profile.jsp">Profile</a></li>
                            <li><a href="LogoutServlet">Log out</a></li>
                        </ul>
                    </ul>

                </div>
            </div>
        </nav>

        <%  String email = (String) session.getAttribute("email");
            String creationDate = (String) session.getAttribute("creationDate");
        %>


        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-2 col-sm-offset-2">
                    <div id="image" class="panel panel-default">
                        <div class="panel-body" align="center">
                            <!--the original image-->
                            <img src="" class="img-thumbnail" style="width:150px;height:150px;"> 
                        </div>
                    </div> 
                    <button id="updateImg" type="button" class="btn btn-primary btn-block">Update Image</button>
                    <!--update image div-->
                    <div id="update">
                        <div class="fileinput fileinput-new" data-provides="fileinput">
                            <div class="fileinput-new thumbnail" style="width: 180px; height: 180px;">
                                <img data-src="holder.js/100%x100%" alt="Update Image" align="center">
                            </div>
                            <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 180px; max-height: 180px;"></div>
                            <div>
                                <span class="btn btn-default btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span><input type="file" name="..."></span>
                                <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Submit Image</button>
                    </div>

                    <script>
                        $(document).ready(function () {
                            $("#update").hide();
                            $("#updateImg").click(function () {
                                $("#update").show();
                                $("#image").hide();
                                $("#updateImg").hide();
                            });
                        });
                    </script>
                </div>

                <!-- Inforamtion part-->
                <div class="col-sm-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <span class="glyphicon glyphicon-user"></span>
                            Basic Infomation
                        </div>
                        <div class="panel-body">
                            <form id="form_1" action="Profile" method="post" class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Userame</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="username" class="form-control" placeholder="Username" ng-model="registerForm.name">

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Pitt Email</label>
                                    <div class="col-sm-6">
                                        <input class="form-control" name="pittemail" type="text" placeholder="<%=email%>" disabled>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Gender</label>
                                    <div class="col-sm-6">
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" value="male"> male
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" value="female"> female
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" value="secret"> secret
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Registration Date</label>
                                    <div class="col-sm-6">
                                        <input class="form-control" id="creationDate" type="text" placeholder="<%=creationDate%>" disabled>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Details</label>
                                    <div class="col-sm-6">
                                        <textarea class="form-control" name="details" rows="3" placeholder="Details"></textarea>

                                    </div>
                                </div>

                                <!--test
                                <input type="submit" name="command" value="updateProfile">
                                <input type="submit" name="command" value="showProfile">
                                -->
                                <div class="form-group">
                                    <div class="col-sm-3 col-sm-offset-4">
                                        <button id="btn_1" class="btn btn-primary btn-block" type="submit" name="command" value="updateBasicInfo">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!--tags from here -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <span class="glyphicon glyphicon-tags"> </span>
                            Feed Tags
                        </div>
                        <div class="panel-body">
                            <form id="form_2" action="Profile" class="form-horizontal" role="form">

                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Books</label>
                                    <div class="col-sm-8">

                                        <label class="checkbox-inline">
                                            <input type="checkbox" id="a1" name="tag" value="option1"> Textbooks
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" id="a2" name="tag" value="option2"> Magzines
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" id="a3" name="tag" value="option3"> 3
                                        </label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Clothing & Shoes</label>
                                    <div class="col-sm-8">

                                        <label class="checkbox-inline">
                                            <input type="checkbox" id="b1" name="tag" value="option4"> Clothing
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" id="b2" name="tag" value="option5">  Shoes
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" id="b3" name="tag" value="option6"> 6
                                        </label>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Movies, Music & Games</label>
                                    <div class="col-sm-8">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" id="c1" name="tag" value="option7"> Movies & TV
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" id="c2" name="tag" value="option8"> CDs & Vinyl
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" id="c3" name="tag" value="option9"> Video Games
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-3 col-sm-offset-4">
                                        <button id="btn_2" class="btn btn-primary btn-block" type="submit" name="command" value="updateTag">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!--Contact Info from here -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <span class="glyphicon glyphicon-earphone"> </span>
                            Contact Infomation
                        </div>
                        <div class="panel-body">
                            <form id="form_3" action="Profile" class="form-horizontal" role="form">
                                <script>
                                    $(document).ready(function () {
                                        $("#addedCall").hide();
                                        $("#addCall").click(function () {
                                            $("#addedCall").show();
                                            $("#addCall").hide();
                                        });
                                    });

                                    $(document).ready(function () {
                                        $("#addedEmail").hide();
                                        $("#addEmail").click(function () {
                                            $("#addedEmail").show();
                                            $("#addEmail").hide();
                                        });
                                    });

                                    $(document).ready(function () {
                                        $("#addedText").hide();
                                        $("#addText").click(function () {
                                            $("#addedText").show();
                                            $("#addText").hide();
                                        });
                                    });
                                </script>
                                <!--by call-->
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">By Phone Call</label>
                                    <div class="col-sm-6">
                                        <input type="" class="form-control" name="call1" placeholder="Phone number">
                                    </div>
                                    <div class="col-sm-2">
                                        <small id="addCall"><a>+ Add more</a></small>
                                    </div>
                                </div>
                                <div class="form-group" id="addedCall">
                                    <label class="col-sm-4 control-label"></label>
                                    <div class="col-sm-6">
                                        <input class="form-control" name="call2" placeholder="Another phone number">
                                    </div>
                                </div>

                                <!--by text-->
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">By Text Message</label>
                                    <div class="col-sm-6">
                                        <input class="form-control" name="text1" placeholder="Phone number">
                                    </div>
                                    <div class="col-sm-2">
                                        <small id="addText"><a>+ Add more</a></small>
                                    </div>
                                </div>
                                <div class="form-group" id="addedText">
                                    <label class="col-sm-4 control-label"></label>
                                    <div class="col-sm-6">
                                        <input class="form-control" name="text2" placeholder="Another phone number" >
                                    </div>
                                </div>

                                <!--by email-->
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">By Email</label>
                                    <div class="col-sm-6">
                                        <input class="form-control" name="email1" placeholder="Email">
                                    </div>
                                    <div class="col-sm-2">
                                        <small id="addEmail"><a>+ Add more</a></small>
                                    </div>
                                </div>
                                <div class="form-group" id="addedEmail">
                                    <label class="col-sm-4 control-label"></label>
                                    <div class="col-sm-6">
                                        <input class="form-control" name="email2" placeholder="Another email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-3 col-sm-offset-4">
                                        <button id="btn_3" class="btn btn-primary btn-block" type="submit" name="command" value="updateContact">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </body>
</html>

