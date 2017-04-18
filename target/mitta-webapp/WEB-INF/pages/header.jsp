<%-- 
    Document   : header
    Created on : Mar 16, 2017, 7:48:49 PM
    Author     : Saber
--%>
<%@page import="tmdt.web.entity.Cart"%>
<%@page import="tmdt.web.entity.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script src="<c:url value="/resources/core/header.js" />"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="<c:url value="/resources/core/header.css" />" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Griffy" rel="stylesheet">
<script src="<c:url value="/resources/core/header.js" />"></script>
<div id="flipkart-navbar">
    <div class="container" style="width: 100%">
        
        <div class="row row1">
            <div class="col-sm-2">
                <h2 style="margin:0px;"><span class="smallnav menu" onclick="openNav()">? SHOP</span></h2>
                <h1   style="margin:0px; font-family: Griffy; font-size: 50px;"><div><span class="rainbow">
                    PETSHOP
                        </span></div></h1>
            </div>
            <div class="col-sm-8 col-xs-11">
                <div class="row">
		<div class="col-xs-11">
            <div class="input-group" id="adv-search">
                <input type="text" class="form-control" placeholder="Search for snippets" />
                <div class="input-group-btn">
                    <div class="btn-group" role="group">
                        <div class="dropdown dropdown-lg">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="caret"></span></button>
                            <div class="dropdown-menu dropdown-menu-right" role="menu">
                                <form class="form-horizontal" role="form">
                                  <div class="form-group">
                                    <label for="filter">Filter by</label>
                                    <select class="form-control">
                                        <option value="0" selected>All Snippets</option>
                                        <option value="1">Featured</option>
                                        <option value="2">Most popular</option>
                                        <option value="3">Top rated</option>
                                        <option value="4">Most commented</option>
                                    </select>
                                  </div>
                                  <div class="form-group">
                                    <label for="contain">Author</label>
                                    <input class="form-control" type="text" />
                                  </div>
                                  <div class="form-group">
                                    <label for="contain">Contains the words</label>
                                    <input class="form-control" type="text" />
                                  </div>
                                  <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                                </form>
                            </div>
                        </div>
                        <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                    </div>
                </div>
            </div>
          </div>
</div>
            </div>
            <div class="cart largenav col-sm-1">
                <a class="cart-button">
                    <svg class="cart-svg " width="16 " height="16 " viewBox="0 0 16 16 ">
                        <path d="M15.32 2.405H4.887C3 2.405 2.46.805 2.46.805L2.257.21C2.208.085 2.083 0 1.946 0H.336C.1 0-.064.24.024.46l.644 1.945L3.11 9.767c.047.137.175.23.32.23h8.418l-.493 1.958H3.768l.002.003c-.017 0-.033-.003-.05-.003-1.06 0-1.92.86-1.92 1.92s.86 1.92 1.92 1.92c.99 0 1.805-.75 1.91-1.712l5.55.076c.12.922.91 1.636 1.867 1.636 1.04 0 1.885-.844 1.885-1.885 0-.866-.584-1.593-1.38-1.814l2.423-8.832c.12-.433-.206-.86-.655-.86 " fill="#fff "></path>
                    </svg> Cart
                    <span id="item-number" class="item-number ">${cart.getC().size()}</span>
                </a>
                
            </div>
            <ul class="largenav">
            <li class="col-sm-1 acc-links dropdown" ><a href="#" class="links">Account
                                        <b class="caret"></b></a>
                                        <% User u =(User) request.getSession().getAttribute("user");
            if(u==null){
                
            %>
                                        <ul class="dropdown-menu">
                                            <li class="profile-li"><a class="profile-links" href="login">Login</a></li>
                                            <li class="profile-li"><a class="profile-links" href="register">Register</a></li>
                        
                    </ul><%} else{ %>
                    <ul class="dropdown-menu">
                        <li class="profile-li"><a class="profile-links" href="#">Buying History</a></li>
                                            <li class="profile-li"><a class="profile-links" href="logout">Logout</a></li>
                                            <% } %>
                </li>
            </ul>
        </div>
        <script>
  $(document).ready(function() {

	$('#w-input-search').autocomplete({
		serviceUrl: '${pageContext.request.contextPath}/getTags',
		paramName: "tagName",
		delimiter: ",",
	   transformResult: function(response) {

		return {
		  //must convert json to javascript object before process
		  suggestions: $.map($.parseJSON(response), function(item) {

		      return { value: item.name, data: item.id };
		   })

		 };

            }

	 });

  });
  </script>
        <div class="row row2">
            <ul class="largenav" style="text-align: center;margin-bottom: -5px;">
                <li class="upper-links"><a class="links" href="http://clashhacks.in/">Link 1</a></li>
                <li class="upper-links"><a class="links" href="http://clashhacks.in/">Link 2</a></li>
                <li class="upper-links"><a class="links" href="http://clashhacks.in/">Link 3</a></li>
                <li class="upper-links"><a class="links" href="http://clashhacks.in/">Link 4</a></li>
                <li class="upper-links"><a class="links" href="http://clashhacks.in/">Link 5</a></li>
                <li class="upper-links"><a class="links" href="http://clashhacks.in/">Link 6</a></li>                            
            </ul>
        </div>
    </div>
</div>
<div id="mySidenav" class="sidenav">
    <div class="container" style="background-color: #2874f0; padding-top: 10px;">
        <span class="sidenav-heading">Home</span>
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">×</a>
    </div>
    <a href="http://clashhacks.in/">Link</a>
    <a href="http://clashhacks.in/">Link</a>
    <a href="http://clashhacks.in/">Link</a>
    <a href="http://clashhacks.in/">Link</a>
    
</div>

