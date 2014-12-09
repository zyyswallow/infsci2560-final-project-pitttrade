<%-- 
    Document   : search
    Created on : Nov 27, 2014, 11:30:03 AM
    Author     : linxiaohui
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.POJOs.Post"%>
<%@page import="com.POJOs.Comment"%>
<%@page import="com.POJOs.ContactInfo"%>
<%@page import="com.POJOs.User"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="post" scope="page" class="com.Bean.PostinfoHelper"/>
<jsp:useBean id="comment" scope="page" class="com.Bean.CommentinfoHelper"/>
<jsp:useBean id="contact" scope="page" class="com.Bean.ContactinfoHelper"/>
<!DOCTYPE html>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Search Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="css/customize.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/validateChecker.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/customize.js"></script>
        <script src="js/UserInteraction.js"></script>
        <script src="js/transport.js"></script>
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
                        <li class="active"><a href="search.jsp?page=0">Search</a></li>
                        <li><a href="profile.jsp">Profile</a></li>
                        <li><a href="LogoutServlet">Log out</a></li>
                    </ul>

                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row-main">
                <div class="col-lg-offset-1 col-lg-2 sidebar" >
                    <form class="form-horizontal" id="search" role="form" action="SearchServlet">

                        <h4>Modify Your Search:</h4>
                        <div class="form-group">
                            <label for="input1" class="col-md-2 control-label">Title:</label>
                            <div class="col-md-10">
                                <input type="text" id="title" name="title" class="form-control" placeholder=" ">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="input1" class="col-md-2 control-label">Price:</label>
                            <div class="col-md-10">
                                <div class="col-md-6">
                                    <input type="text" id="price" name="minPrice" class="form-control" placeholder="min">
                                </div>

                                <div class="col-md-6">
                                    <input type="text" id="price" name="maxPrice" class="form-control" placeholder="max">
                                </div>
                            </div>
                        </div>
                        <h5>Category:</h5>
                        <div class="panel-group" id="panel-236824">
                            <div class="panel panel-default">
                                <div class="panel-heading" >
                                    <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-236824" href="#category1">Books</a> 
                                </div>
                                <div id="category1" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <label>
                                            <input type="checkbox" name="category" value="a"> Textbooks
                                        </label>
                                    </div>
                                    <div class="panel-body">
                                        <label>
                                            <input type="checkbox" name="category" value="b"> Magazines
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default" id="panel-236834">
                                <div class="panel-heading">
                                    <a class="panel-title" data-toggle="collapse" data-parent="#panel-236834" href="#category2">Home Tools</a>
                                </div>

                                <div id="category2" class="panel-collapse collapse">
                                    <div class="panel-body ">
                                        <label>
                                            <input type="checkbox" name="category" value="c"> Kitchen and Dining
                                        </label>
                                    </div>
                                    <div class="panel-body ">
                                        <label>
                                            <input type="checkbox" name="category" value="d"> Furniture and Décor
                                        </label>
                                    </div>
                                    <div class="panel-body ">
                                        <label>
                                            <input type="checkbox" name="category" value="e"> Appliances
                                        </label>
                                    </div>
                                </div>
                            </div>


                            <div class="panel panel-default" id="panel-236854">
                                <div class="panel-heading">
                                    <a class="panel-title" data-toggle="collapse" data-parent="#panel-236854" href="#category3">Clothing and Shoes</a>
                                </div>

                                <div id="category3" class="panel-collapse collapse">
                                    <div class="panel-body ">
                                        <label>
                                            <input type="checkbox" name="category" value="f"> Clothing
                                        </label>
                                    </div>
                                    <div class="panel-body ">
                                        <label>
                                            <input type="checkbox" name="category" value="g"> Shoes
                                        </label>
                                    </div>

                                </div>
                            </div>

                            <div class="panel panel-default" id="panel-236844">
                                <div class="panel-heading">
                                    <a class="panel-title" data-toggle="collapse" data-parent="#panel-236844" href="#category4">Movies, Music and Games</a>
                                </div>
                                <div id="category4" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <label>
                                            <input type="checkbox" name="category" value="h"> Movies and TV
                                        </label>
                                    </div>
                                    <div class="panel-body">
                                        <label>
                                            <input type="checkbox" name="category" value="i"> CDs and Vinyl
                                        </label>
                                    </div>
                                    <div class="panel-body">
                                        <label>
                                            <input type="checkbox" name="category" value="j"> Video Games
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="page" value="0">
                        <button type="submit" class="btn btn-block btn-primary pull-right">Search</button>
                    </form>
                </div>


                <!--Post Section-->
                <div class="col-lg-8" style="margin-left: 3%; padding-right: 5%; padding-bottom: 2%">


                    <%  int userid = (int) session.getAttribute("userid");
                        String currPage = (String) request.getParameter("page");
                        String userName = session.getAttribute("username").toString();
                        String phone;
                        String email;
                        List<Post> postList = new ArrayList<Post>();
                        postList = (List<Post>) request.getAttribute("postList");
                        if (postList == null) {
                            postList = post.getAllPost(Integer.parseInt(currPage));
                        }
                        int maxPage;
                        if (request.getAttribute("maxPage") != null) {
                            maxPage = (int) request.getAttribute("maxPage");
                        } else {
                            maxPage = post.getMaxPage();
                        }
                        if (postList != null) {
                            for (Post postinfo : postList) {
                                String postUsername = post.getPostUsername(postinfo.getPostId());
                                String com = "#" + postinfo.getPostId();
                                String modal = "myModal_" + postinfo.getPostId();
                                String commentInput1 = "1_" + postinfo.getPostId();
                                String commentInput2 = "2_" + postinfo.getPostId();
                                String commentInput3 = "3_" + postinfo.getPostId();
                                String commentInput4 = "4_" + postinfo.getPostId();
                                String commentInput5 = "5_" + postinfo.getPostId();
                                String bigComment = "bigComment_" + postinfo.getPostId();
                                Date pDate = postinfo.getCreationTime();
                                String postDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(pDate);

                                //Contact Info
                                phone = contact.getContactPhone(postinfo.getUserId());
                                email = contact.getContactEmail(postinfo.getUserId());
                    %>

                    <div class="row result-group" id="search_result" style="margin-top: 2%;">
                        <div id="result1" class="result" >


                            <div class="panel panel-primary">

                                <div class="panel-body" style="margin-top: -30px;">
                                    <div class="col-lg-5 col-lg-offset-7">
                                        Posted By &nbsp
                                        <a href="#" onclick="showModal(<%=postinfo.getPostId()%>)"><%=postUsername%></a>
                                        &nbsp at &nbsp
                                        <%=postDate%>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-4" align="center">
                                            <img class='img-thumbnail' width='200px' height='200px' src="<%=postinfo.getImgUrl()%>"/>
                                        </div>
                                        <div class="col-sm-8">
                                            <h3><%=postinfo.getTitle()%></h3>
                                            <p><strong>Condition : </strong><%=postinfo.getCondi()%></p>
                                            <p><strong>Price : </strong>$ <%=postinfo.getPrice()%></p>
                                            <p><%=postinfo.getBody()%></p>
                                        </div>
                                    </div>

                                    <div class="row" >
                                        <div class="col-sm-offset-8 col-sm-2">
                                            <button id="submitButton" type="button" name="submitButton" style="margin-bottom:5%;margin-top: 5%" class="btn btn-block btn-primary btn-cmt" data-toggle="collapse" data-parent="#accordion" href=<%=com%> aria-expanded="true" aria-controls="collapseOne">Comment</button>
                                        </div>
                                        <div class="col-sm-2">
                                            <button id="submitButton" type="button" name="submitButton" style="margin-bottom:5%;margin-top: 5%" class="btn btn-block btn-primary btn-vote" onclick="updateLike(<%=postinfo.getPostId()%>)"><span class="glyphicon glyphicon-heart"> </span>&nbsp Like <span id="badge_<%=postinfo.getPostId()%>" class="badge"><%int likeCount = post.getLike(postinfo.getPostId());%><%=likeCount%></span></button>
                                        </div>
                                    </div>


                                    <!--Modal-->        
                                    <div class="modal fade" id="<%=modal%>">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                                    <h4 class="modal-title">Contact Information</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form class="form-horizontal" role="form">
                                                        <div class="form-group">
                                                            <label class="col-sm-4 control-label">Telephone</label>
                                                            <div class="col-sm-6">
                                                                <p class="form-control-static"><%=phone%></p>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-sm-4 control-label">Email</label>
                                                            <div class="col-sm-6">
                                                                <p class="form-control-static"><%=email%></p>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>

                                                </div>
                                            </div>
                                        </div>
                                    </div> 




                                    <div class="row">
                                        <div id="<%=postinfo.getPostId()%>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                            <div class="well comment" id="<%=bigComment%>">

                                                <div>
                                                    <%
                                                        String newCommentId = "newCommentDiv_" + postinfo.getPostId();
                                                        int postid = postinfo.getPostId();
                                                        List<Comment> commentList = new ArrayList<Comment>();
                                                        commentList = comment.getComment(postid);
                                                        if (commentList == null || commentList.size() == 0) {
                                                    %>
                                                    <div style="visibility: hidden;">        
                                                        <div class="row col-lg-10 col-lg-offset-1" id="<%=newCommentId%>" style="Background-color: #ffffff;">
                                                            <div class="col-lg-4 col-lg-offset-8 cTime">
                                                                <p id="newComment1"></p>  
                                                            </div>
                                                            <div class="col-lg-1 cUsername">
                                                                <p id="newComment2"></p>
                                                            </div>    
                                                            <div class="col-lg-11" style="word-wrap: break-word;">    
                                                                <p id="newComment3"></p>
                                                            </div>                                                      
                                                        </div>
                                                    </div> 

                                                    <%
                                                        }
                                                        if (commentList != null) {
                                                            for (Comment commentinfo : commentList) {
                                                                Date date = commentinfo.getCreationTime();
                                                                String dateString = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
                                                                String commentUsername = comment.getCommentUsername(commentinfo.getCmtId()) + ":";
                                                    %>        
                                                    <!--Comment Place-->  
                                                    <div class="row col-lg-10 col-lg-offset-1" id="commentDiv" style="Background-color: #ffffff;">
                                                        <div class="col-lg-4 col-lg-offset-8 cTime">
                                                            <p><%=dateString%></p>
                                                        </div>
                                                        <div class="col-lg-1 cUsername">
                                                            <p><%=commentUsername%></p>
                                                        </div>
                                                        <div class="col-lg-11" style="word-wrap: break-word;">
                                                            <p><%=commentinfo.getText()%></p>
                                                        </div>                                                   
                                                    </div>


                                                    <!--Hidden Div for Clone-->       
                                                    <div style="visibility: hidden;">        
                                                        <div class="row col-lg-10 col-lg-offset-1" id="<%=newCommentId%>" style="Background-color: #ffffff;">
                                                            <div class="col-lg-4 col-lg-offset-8 cTime">
                                                                <p id="newComment1"></p>  
                                                            </div>
                                                            <div class="col-lg-1 cUsername">
                                                                <p id="newComment2"></p>
                                                            </div>    
                                                            <div class="col-lg-11">    
                                                                <p id="newComment3" style="word-wrap: break-word;"></p>
                                                            </div>                                                     
                                                        </div>
                                                    </div> 
                                                    <input type="hidden" name="commentCreationTime" id="<%=commentInput4%>" value="<%=dateString%>">            
                                                    <%}
                                                        }
                                                    %>    
                                                    <div class="row reply">
                                                        <form name="comment" role="form" type="post">
                                                            <div class="col-lg-10 col-lg-offset-1">
                                                                <textarea class="form-control input-sm" id="<%=commentInput1%>" name="commentArea" rows="3"></textarea>
                                                            </div>
                                                            <div class="col-xs-1 col-lg-offset-10" style="margin-top: 5px">
                                                                <input type="hidden" name="postId" id="<%=commentInput2%>" value="<%=postinfo.getPostId()%>">
                                                                <input type="hidden" name="userId" id="<%=commentInput3%>" value="<%=userid%>">
                                                                <input type="hidden" name="loggedUserName" id="<%=commentInput5%>" value="<%=userName%>">
                                                                <button type="button" class="btn btn-primary pull-right" onclick="reply(<%=postinfo.getPostId()%>)">Reply</button>
                                                            </div>
                                                        </form>
                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>                                    
                    <%}
                        }
                    %>


                    <div class="page">
                        <%
                            String[] base = request.getRequestURL().toString().split("/");
                            String basePath = base[base.length - 1] + "?";
                            Enumeration<String> paramNames = request.getParameterNames();
                            while (paramNames.hasMoreElements()) {
                                String paramName = paramNames.nextElement();
                                if (paramName.equals("page")) {
                                    continue;
                                }
                                String[] paramValues = request.getParameterValues(paramName);
                                for (int i = 0; i < paramValues.length; i++) {
                                    String paramValue = paramValues[i];
                                    basePath = basePath + paramName + "=" + paramValue;
                                }
                                basePath = basePath + "&";
                            }%>
                        <nav>
                            <ul class="pager">
                                <li class="previous <%if (Integer.parseInt(currPage) - 1 < 0) {%>disabled<%}%>"><a href="<%=basePath%>page=<%=Integer.parseInt(currPage) - 1%>"><span aria-hidden="true">&larr;</span> Previous</a></li>
                                <li>Current Page:<%=Integer.parseInt(currPage) + 1%></li>
                                <li class="next <%if (Integer.parseInt(currPage) + 1 > maxPage) {%>disabled<%}%>"><a href="<%=basePath%>page=<%=Integer.parseInt(currPage) + 1%>">Next <span aria-hidden="true">&rarr;</span></a></li>
                            </ul>
                        </nav>
                    </div>
                </div>



            </div>
        </div>                        

    </body>
</html>

