<%-- 
    Document   : profile
    Created on : 2014-11-11, 0:25:01
    Author     : yanyanzhou
--%>

<%@page import="com.POJOs.FeedTagId"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.POJOs.ContactInfo"%>
<%@page import="com.POJOs.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="uinfo" scope="page" class="com.Bean.UserinfoHelper"/>
<jsp:useBean id="taginfo" scope="page" class="com.Bean.FeedTagHelper"/>
<html>
    <head>
        <title>Profile Page</title>
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
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <div class="navbar-brand">
                        PittTrade
                    </div>
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
                        <li><a href="mypost.jsp?page=0">Post</a></li>
                        <li><a href="search.jsp?page=0">Search</a></li>
                        <li class="active"><a href="profile.jsp">Profile</a></li>
                        <li><a href="LogoutServlet">Log out</a></li>
                    </ul>

                </div>
            </div>
        </nav>

        <% int userid = (int) session.getAttribute("userid");
            User userinfo = new User();
            ContactInfo contactInfo = new ContactInfo();
            List<String> tagsList = new ArrayList<String>();
            userinfo.setUid(userid);
            userinfo = uinfo.getUserInfo(userinfo);
            contactInfo = uinfo.getContactinfo(userid);
            tagsList = taginfo.getFeedTags(userid);
            uinfo.close();%>

        <div class="container-fluid">
            <div class="row-main">
<!--                <div id="sale-grade" class="col-sm-2 col-sm-offset-2">
                    <div class="panel panel-default">
                        <div class="panel-body" align="center">
                            <img src="" class="img-thumbnail" style="width:150px;height:150px;">       
                        </div>
                    </div>
                    <div class="panel panel-default" align="center">
                        <ul class="list-group" >
                            <li class="list-group-item" >
                                <span class="glyphicon glyphicon-pencil"></span>
                                <strong>100 </strong>
                                Posts
                            </li>
                            <li class="list-group-item">
                                <span class="glyphicon glyphicon-heart"> </span>
                                <strong>50 </strong>
                                Votes
                            </li>
                        </ul>                     
                    </div>
                </div>-->
                <div class="col-sm-6 col-sm-offset-3">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <span class="glyphicon glyphicon-user"></span>
                            Basic Information
                        </div>
                        <div class="panel-body">
                            <form action="ProfileServlet" class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Username</label>
                                    <div class="col-sm-6">
                                        <input type="text" name="username" class="form-control" value="<%=userinfo.getUsername()%>" placeholder="<%=userinfo.getUsername()%>" ng-model="registerForm.name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Pitt Email</label>
                                    <div class="col-sm-6">
                                        <input class="form-control" name="email" type="text" value="<%=userinfo.getEmail()%>" placeholder="<%=userinfo.getEmail()%>" disabled>

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Gender</label>
                                    <div class="col-sm-6">
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" value="male" <%if (userinfo.getGender().equals("male")) {%>checked<%}%>> male
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="gender" value="female" <%if (userinfo.getGender().equals("female")) {%>checked<%}%>> female
                                        </label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Registration Date</label>
                                    <div class="col-sm-6">
                                        <input class="form-control" name="creationDate" type="text" value="<%=userinfo.getCreationDate()%>" placeholder="<%=userinfo.getCreationDate()%>" disabled>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">Details</label>
                                    <div class="col-sm-6">
                                        <textarea class="form-control" name="details" rows="3" ><%=userinfo.getDetails()%></textarea>
                                    </div>
                                </div>
                                <input type="hidden" name="userId" value="<%=userid%>">
                                <div class="form-group">
                                    <div class="col-sm-3 col-sm-offset-4">
                                        <button id="btn_1" class="btn btn-primary btn-block" type="submit" name="method" value="basic">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!--            
                    <div id="feedTags" class="panel panel-default">
                        <div class="panel-heading">
                            <span class="glyphicon glyphicon-tags"> </span>
                            Favorite Category
                        </div>
                        <form id="form_2" action="ProfileServlet" class="form-horizontal" role="form">
                            <div class="panel-body">
                                <form id="form_2" action="Profile" class="form-horizontal" role="form">

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Books</label>
                                        <div class="col-sm-8">

                                            <label class="checkbox-inline">
                                                <input type="checkbox" id="a1" name="tag" value="a" <%if (tagsList.contains("a")) {%>checked<%}%>> Textbooks
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" id="a2" name="tag" value="b" <%if (tagsList.contains("b")) {%>checked<%}%>> Magzines
                                            </label>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Home Tools</label>
                                        <div class="col-sm-8">

                                            <label class="checkbox-inline">
                                                <input type="checkbox" id="b1" name="tag" value="c" <%if (tagsList.contains("c")) {%>checked<%}%>> Kitchen & Dining
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" id="b2" name="tag" value="d" <%if (tagsList.contains("d")) {%>checked<%}%>>  Furniture & Décor
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" id="b3" name="tag" value="e" <%if (tagsList.contains("e")) {%>checked<%}%>> Appliances
                                            </label>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Clothing & Shoes</label>
                                        <div class="col-sm-8">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" id="c1" name="tag" value="f" <%if (tagsList.contains("f")) {%>checked<%}%>> Clothing
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" id="c2" name="tag" value="g" <%if (tagsList.contains("g")) {%>checked<%}%>> Shoes
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">Movies, Music & Games</label>
                                        <div class="col-sm-8">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" id="c1" name="tag" value="h" <%if (tagsList.contains("h")) {%>checked<%}%>>Movies & TV
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" id="c2" name="tag" value="i" <%if (tagsList.contains("i")) {%>checked<%}%>> CDs & Vinyl
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" id="c2" name="tag" value="j" <%if (tagsList.contains("j")) {%>checked<%}%>> Video Games
                                            </label>
                                        </div>
                                    </div>
                                    <input type="hidden" name="userId" value="<%=userid%>">
                                    <div class="form-group">
                                        <div class="col-sm-3 col-sm-offset-4">
                                            <button id="btn_2" class="btn btn-primary btn-block" type="submit" name="method" value="tags">Submit</button>
                                        </div>
                                    </div>
                            </div>
                        </form>
                    </div>
                    -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <span class="glyphicon glyphicon-earphone"> </span>
                            Contact Infomation
                        </div>            
                        <div class="panel-body">
                            <form id="form_3" action="ProfileServlet" class="form-horizontal" role="form">
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
                                        <input type="" class="form-control" name="call1" <%if(contactInfo!=null&&contactInfo.getCall1()!=null){%>value="<%=contactInfo.getCall1()%>" placeholder="<%=contactInfo.getCall1()%>"<%}%>>
                                    </div>
                                    <div class="col-sm-2">
                                        <small id="addCall"><a>+ Add more</a></small>
                                    </div>
                                </div>
                                <div class="form-group" id="addedCall">
                                    <label class="col-sm-4 control-label"></label>
                                    <div class="col-sm-6">
                                        <input class="form-control" name="call2" <%if(contactInfo!=null&&contactInfo.getCall2()!=null){%>value="<%=contactInfo.getCall2()%>" placeholder="<%=contactInfo.getCall2()%>"<%}%>>
                                    </div>
                                </div>

                                <!--by text-->
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">By Text Message</label>
                                    <div class="col-sm-6">
                                        <input class="form-control" name="text1" <%if(contactInfo!=null&&contactInfo.getText1()!=null){%>value="<%=contactInfo.getText1()%>" placeholder="<%=contactInfo.getText1()%>"<%}%>>
                                    </div>
                                    <div class="col-sm-2">
                                        <small id="addText"><a>+ Add more</a></small>
                                    </div>
                                </div>
                                <div class="form-group" id="addedText">
                                    <label class="col-sm-4 control-label"></label>
                                    <div class="col-sm-6">
                                        <input class="form-control" name="text2" <%if(contactInfo!=null&&contactInfo.getText2()!=null){%> value="<%=contactInfo.getText2()%>" placeholder="<%=contactInfo.getText2()%>"<%}%> >
                                    </div>
                                </div>

                                <!--by email-->
                                <div class="form-group">
                                    <label class="col-sm-4 control-label">By Email</label>
                                    <div class="col-sm-6">
                                        <input class="form-control" name="email1" <%if(contactInfo!=null&&contactInfo.getEmail1()!=null){%> value="<%=contactInfo.getEmail1()%>" placeholder="<%=contactInfo.getEmail1()%>"<%}%>>
                                    </div>
                                    <div class="col-sm-2">
                                        <small id="addEmail"><a>+ Add more</a></small>
                                    </div>
                                </div>
                                <div class="form-group" id="addedEmail">
                                    <label class="col-sm-4 control-label"></label>
                                    <div class="col-sm-6">
                                        <input class="form-control" name="email2" <%if(contactInfo!=null&&contactInfo.getEmail2()!=null){%>value="<%=contactInfo.getEmail2()%>" placeholder="<%=contactInfo.getEmail2()%>"<%}%>>
                                    </div>
                                </div>
                                <input type="hidden" name="userId" value="<%=userid%>">
                                <div class="form-group">
                                    <div class="col-sm-3 col-sm-offset-4">
                                        <button id="btn_3" class="btn btn-primary btn-block" type="submit" name="method" value="contact">Submit</button>
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

