<%-- 
    Document   : mypost
    Created on : Dec 5, 2014, 10:25:17 PM
    Author     : huge
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.POJOs.Post"%>
<%@page import="com.POJOs.User"%>
<%@page import="com.POJOs.Comment"%>
<%@page import="com.POJOs.ContactInfo"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="page" class="com.Bean.UserinfoHelper"/>
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
        <title>MyPost Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="css/customize.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/validateChecker.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/customize.js"></script>
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
                        <li  class="active"><a href="mypost.jsp?page=0">Post</a></li>
                        <li><a href="search.jsp?page=0">Search</a></li>
                        <li><a href="profile.jsp">Profile</a></li>
                        <li><a href="LogoutServlet">Log out</a></li>
                    </ul>

                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row-main">
                

                <div class="col-lg-7 col-lg-offset-2" >
                    <div>

                        <%  String currPage = (String) request.getParameter("page");
                            int userid = (int) session.getAttribute("userid");
                            String userName = session.getAttribute("username").toString();
                            String phone;
                            String email;
                           
                            
                            List<Post> postList = new ArrayList<Post>();
                            postList = (List<Post>) request.getAttribute("postList");
                            if (postList == null) {
//                                 
                                postList = post.getMyPost(Integer.parseInt(currPage), userid);
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
                        <div class="row result-group" id="search_result" >
                            <div id="result1" class="result" >
                                
                                <div class="panel panel-primary">                        
                                    <div class="panel-body" style="margin-top: -20px;">
                                        <div class="col-lg-6 col-lg-offset-6">
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
                                                <button id="submitButton" type="button" name="submitButton" style="margin-bottom:5%;margin-top: 5%" class="btn btn-block btn-primary btn-cmt" data-toggle="collapse" data-parent="#accordion" href=<%=com%> aria-expanded="true" aria-controls="collapseOne"> Comment</button>
                                            </div>
                                            <div class="col-sm-2">
                                                <button id="submitButton" type="button" name="submitButton" style="margin-bottom:5%;margin-top: 5%" class="btn btn-block btn-primary btn-vote" ><span class="glyphicon glyphicon-heart"> </span>&nbsp Like</button>
                                            </div>
                                        </div>
                    
                                        <!--Modal-->        
                                        <div class="modal fade large" id="<%=modal%>">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                                        <h4 class="modal-title">Contact Information</h4>
                                                    </div>
                                                    <div class="modal-body" align="center">
                                                        <div class="row">



                                                        <div class="col-md-10 col-md-offset-1" style="margin-top: 15%; margin-bottom: 15%;">
                                                                <div class="col-md-12">
                                                                    <div class="col-md-4 col-md-offset-1 contactTitle pull-left">Telephone:</div>
                                                                    <div class="col-md-4 col-md-offset-1 contactContent"><%=phone%></div>
                                                                </div>    
                                                                <div class="col-md-12" style="margin-top: 10%;">
                                                                    <div class="col-md-4 col-md-offset-1 contactTitle pull-left">Email:</div>
                                                                    <div class="col-md-4 col-md-offset-1 contactContent"><%=email%></div>
                                                                </div>    

                                                        </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>                        
                                            
                                            
                                            
                                            
                                            
                                        <div class="row">
                                            <div id="<%=postinfo.getPostId()%>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                                    
                                                    
                                                    
                                                
                                                
                                                
                                                <div class="well comment" id="<%=bigComment%>">
                                                    
                                                   
                                                    <div></div>
                                                <%
                                                    String newCommentId = "newCommentDiv_" + postinfo.getPostId();
                                                    int postid = postinfo.getPostId();
                                                    List<Comment> commentList = new ArrayList<Comment>();
                                                    commentList = comment.getComment(postid);
                                                    if (commentList == null || commentList.size() == 0) {
                                                        
                                                %>
                                                <div style="visibility: hidden;">        
                                                    <div class="row col-lg-10 col-lg-offset-1" id="<%=newCommentId%>" style="Background-color: #ffffff; margin-top: 2%; margin-bottom: 4%">
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
                                                            String commentUsername = comment.getCommentUsername(commentinfo.getCmtId())+":";
                                                            
                                                %>        
                                                    <!--Comment Place-->    
                                                    <div class="row col-lg-10 col-lg-offset-1" id="commentDiv" style="Background-color: #ffffff; margin-top: 1%; margin-bottom: 1%">
                                                            
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
                                                        <div class="row col-lg-10 col-lg-offset-1" id="<%=newCommentId%>" style="Background-color: #ffffff; margin-top: 1%; margin-bottom: 1%">
                                                            
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
                                                    <input type="hidden" name="commentUsername" id="<%=commentInput4%>" value="<%=commentUsername%>">        
                                                    <%}}                           
                                                    %>    
                                                    <div class="row reply">
                                                        <form name="comment" role="form" type="post">
                                                            <div class="col-lg-10 col-lg-offset-1">
                                                                <textarea class="form-control input-sm" id="<%=commentInput1%>" name="commentArea" rows="3"></textarea>
                                                            </div>
                                                            <div class="col-xs-1 col-lg-offset-10" style="margin-top: 2%">
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
                                                            
                        <%}}                           
                        %>

                        <div class="page">
                            <nav>
                                <ul class="pager">
                                    <li class="previous disabled"><a href="#"><span aria-hidden="true">&larr;</span> Previous</a></li>
                                    <li class="next disabled"><a href="#">Next <span aria-hidden="true">&rarr;</span></a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
               
                
                        
                <div class="col-sm-2" style="margin-top: 2%;">
                    <div class="panel panel-default">
                        <div class="panel-heading text-center">

                            <h4><a href="post.jsp" style="color: #0099CC"><span class="glyphicon glyphicon-pencil"></span>&nbsp Post Now</a></h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>                
                        
            
    </body>
</html>

