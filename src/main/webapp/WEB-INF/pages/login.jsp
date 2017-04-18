<%-- 
    Document   : login
    Created on : Mar 20, 2017, 10:06:53 PM
    Author     : Saber
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="windows-1258"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Login</title>
    </head>
    <jsp:include page="newheader.jsp"/>
    <div class="container">
        <ul class="breadcrumb">
        <li><a href="home"><i class="fa fa-home"></i></a></li>
             <li>${root}</li>
      </ul>
             <% 
                String mes =(String) request.getAttribute("loginMessage");
                if(mes != null) {
             %>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>  <%= mes %></div>
            <% } %>
        <div id="content" class="col-sm-9">      
            <div class="row">
        <div class="col-sm-6">
          <div class="well">
            <h2>New Customer</h2>
            <p><strong>Register Account</strong></p>
            <p>By creating an account you will be able to shop faster, be up to date on an order's status, and keep track of the orders you have previously made.</p>
            <a href="register" class="btn btn-primary">Continue</a></div>
        </div>
        <div class="col-sm-6">
          <div class="well">
            <h2>Customer Login</h2>
            <p><strong>Welcome back!</strong></p>
            <form action="doLogin" method="post">
              <div class="form-group">
                <label class="control-label" for="input-email">E-Mail Address</label>
                <input type="email" name="email" value="" placeholder="E-Mail Address" id="input-email" class="form-control" required>
              </div>
              <div class="form-group">
                <label class="control-label" for="input-password">Password</label>
                <input type="password" name="password" value="" placeholder="Password" id="input-password" class="form-control" required>
              <input type="submit" value="Login" class="btn btn-primary">
              </div>
                          </form>
          </div>
        </div>
      </div>
      </div>
    </div>
    <br>
    <br>
    <br>
    <br>
    <jsp:include page="footer.jsp"/>
</html>
