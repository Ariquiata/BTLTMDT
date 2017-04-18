<%-- 
    Document   : newheader
    Created on : Apr 5, 2017, 5:05:42 PM
    Author     : Saber
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="tmdt.web.entity.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="tmdt.web.entity.ConnectionDB"%>
<%@page import="java.sql.Connection"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.custom.min.js" />"></script>
<script src="<c:url value="/resources/core/custom.js" />"></script>
<script src="<c:url value="/resources/core/common.js" />"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="<c:url value="/resources/core/font-awesome.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/core/newheader.css" />" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
<header>
<div class="header_outer">
	<div class="container">
    <div class="row">
      <div class="col-sm-4">
		<div class="top_left f-12">
		This is not out design >>> Noneconomic 
		</div>
      </div>
	  <div class="col-sm-4">
		<div id="logo">
          <a href="home"><img style="width:166px;height: 56px; " src="http://www.paradisepetparks.com.au/wp-content/uploads/PPP_text_Logo.png" title="Pet Store" alt="Pet Store" class="img-responsive"></a>
        </div>
      </div>
   <div class="col-sm-4 header_right">		
	 <ul class="list-inline">
        <li class="dropdown myaccount_drp"><a href="" title="My Account" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user visible-xs visible-sm visible-md"></i><span class="hidden-xs hidden-sm hidden-md">My Account</span><i class="fa fa-angle-down"></i></a>
          <ul class="dropdown-menu dropdown-menu-right">
              <% User u =(User) request.getSession().getAttribute("user");
            if(u==null){
                
            %>
            <li><a href="register">Register</a></li>
            <li><a href="login">Login</a></li>
            <%} else{ %>
            <li><a href="myaccount">My Account</a></li>
            <li><a href="order">Order History</a></li>
            <li><a href="logout">Logout</a></li>
            <% } %>
          </ul>
        </li>
        <li><a href="checkout" title="Checkout"> <i class="fa fa-share visible-xs visible-sm visible-md"></i><span class="hidden-xs hidden-sm hidden-md">Checkout</span></a></li>
      </ul>
	  </div>
	   </div>
		</div>
		<div class="menu_outer">
<div class="container">
	   <div class="row">
	  <div class="col-sm-12">
		<div class="">
  <nav id="menu" class="navbar">
    <div class="navbar-header">
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
	   <li><a href="home" class="home_menu"><span class="">Home</span></a></li>
           <%
               Connection c = new ConnectionDB().getCon();
               String sql = "Select * from category";
               try{
               PreparedStatement pst = c.prepareStatement(sql);
               ResultSet rs = pst.executeQuery();
               while(rs.next()){
               %>
           <li><a href="search?categoryId=<%= rs.getInt("id") %>"><span class=""><%= rs.getString("name") %></span></a></li>
           <%
               }
               } catch(Exception e){}
            %> 
      </ul>
    </div>
  </nav>
  <div class="menu_right">
  <a class="search_toggle"><i class="fa fa-search"></i></a>
	<div class="search_outer_toggle">
<div id="search" class="input-group">
  <input type="text" name="search" value="" placeholder="Search" class="form-control input-lg">
  <span class="input-group-btn">
    <button type="button" class="btn btn-default btn-lg"><i class="fa fa-search"></i></button>
  </span>
</div>
        </div>	
	<div id="cart" class="btn-group btn-block">
            <jsp:include page="cart.jsp"/>
</div>
</div>
</div>
</div>
      </div>
  </div>
</div>
</div>
</header>