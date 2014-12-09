<%-- 
    Document   : post
    Created on : Dec 4, 2014, 2:54:41 PM
    Author     : linxiaohui
--%>

<%@page import="com.POJOs.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="uinfo" scope="page" class="com.Bean.UserinfoHelper"/>
<html>
    <head>
        <title>Post Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/post.css">
        <link rel="stylesheet" href="css/customize.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/jasny-bootstrap.css">
        <link href="select2.css" rel="stylesheet"/>
        <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/validateChecker.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/jasny-bootstrap.js"></script>
        <script src="select2.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#e1").select2();
            });
        </script>

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
                        <li class="active"><a href="mypost.jsp?page=0">Post</a></li>
                        <li><a href="search.jsp?page=0">Search</a></li>
                        <li><a href="profile.jsp">Profile</a></li>
                        <li><a href="LogoutServlet">Log out</a></li>
                    </ul>

                </div>
            </div>
        </nav>
        <% int userid = (int) session.getAttribute("userid");%>
        <form role="form" method="post" enctype="multipart/form-data" action="PostUploadServlet">
            <div class="row-main">
                <div class="col-sm-3 col-sm-offset-2">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Product Image
                        </div>
                        <div class="panel-body pic">

                            <div class="col-sm-10 col-sm-offset-1">
                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                    <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;"></div>
                                    <div>
                                        <span class="btn btn-primary btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">Change</span>
                                            <input type="file" name="file" /></span>
                                        <a href="#" class="btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!--<input type="button" class="btn btn-block btn-primary" value="upload" onclick="document.f1.submit();">-->
                    </div>
                </div>                 
                <div class="col-sm-5">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Product Information
                        </div>
                        <div class="panel-body">

                            <div class="control-group">
                                <label class="control-label col-sm-11 col-sm-offset-1" for="Title">Title</label>                      
                                <div class="col-sm-10 col-sm-offset-1">
                                    <input type="text" class="form-control" name="title">
                                    <input type="text" hidden="true" name="pic" id="pic" value="">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label col-sm-11 col-sm-offset-1 input" for="Category">Category</label>
                                <div class="col-sm-10 col-sm-offset-1">

                                    <select class="form-control" data-placeholder="Please Select!" name="category" id="e1">
                                        <optgroup label="Books">
                                            <option value="a">Textbooks</option>
                                            <option value="b">Magazines</option>
                                        </optgroup>

                                        <optgroup label="Home Tools">
                                            <option value="c">Kitchen & Dining</option>
                                            <option value="d">Furniture & Décor</option>
                                            <option value="e">Appliances</option>
                                        </optgroup>

                                        <optgroup label="Clothing & Shoes">
                                            <option value="f">Clothing</option>
                                            <option value="g">Shoes</option>
                                        </optgroup>

                                        <optgroup label="Movies, Music & Games">
                                            <option value="h">Movies & TV</option>
                                            <option value="i">CDs & Vinyl</option>
                                            <option value="j">Video Games</option>
                                        </optgroup>
                                    </select>
                                </div>

                            </div>
                            <div class="control-group">
                                <label class="control-label col-sm-11 col-sm-offset-1 input" for="Price">Price</label>
                                <div class="col-sm-10 col-sm-offset-1">
                                    <input type="text" class="form-control" name="price">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label col-sm-11 col-sm-offset-1 input" for="Condition">Condition</label>
                                <div class="col-sm-10 col-sm-offset-1">
                                    <label class="radio-inline">
                                        <input type="radio" name="condition" id="inlineRadio1" value="1" checked>1 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="condition" id="inlineRadio1" value="2">2   
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="condition" id="inlineRadio1" value="3">3  
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="condition" id="inlineRadio1" value="4">4 
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="condition" id="inlineRadio1" value="4">5 
                                    </label>        
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label col-sm-11 col-sm-offset-1 input" for="description">Short Description</label>
                                <div class="col-sm-10 col-sm-offset-1">
                                    <textarea class="form-control" name="description" rows="7"></textarea>
                                </div>
                            </div>
                            <input type="hidden" name="userId" value="<%=userid%>">
                            <div class="submit col-sm-4 col-sm-offset-1">    
                                <button type="submit" class="btn btn-block btn-primary"><strong>Post</strong></button>
                            </div>                   
                        </div>        
                    </div>
                </div>
            </div>
        </form>            

    </body>
</html>
