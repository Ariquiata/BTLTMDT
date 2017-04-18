<%-- 
    Document   : login
    Created on : Mar 20, 2017, 10:06:53 PM
    Author     : Saber
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="windows-1258"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Register</title>
    </head>
    <jsp:include page="newheader.jsp"/>
     <div class="container">
        <ul class="breadcrumb">
        <li><a href="home"><i class="fa fa-home"></i></a></li>
            <li>${root}</li>
      </ul>
        <c:if test="${rm != null}">
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i><c:out value="${rm}"></c:out></div>
        </c:if>
        <div class="row">
            <div id="content" class="col-sm-9"><h1>Register Account</h1>
                <p>If you already have an account with us, please login at the <a href="login"><b>login page</b></a>.</p>
      <form action="doRegister" method="post" class="form-horizontal">
        <fieldset id="account">
          <legend>Your Personal Details</legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-firstname">First Name</label>
            <div class="col-sm-10">
              <input type="text" name="firstname" value="" placeholder="First Name" id="input-firstname" class="form-control">
                          </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-lastname">Last Name</label>
            <div class="col-sm-10">
              <input type="text" name="lastname" value="" placeholder="Last Name" id="input-lastname" class="form-control">
                          </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email">E-Mail</label>
            <div class="col-sm-10">
              <input type="email" name="email" value="" placeholder="E-Mail" id="input-email" class="form-control">
                          </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-telephone">Telephone</label>
            <div class="col-sm-10">
              <input type="tel" name="telephone" value="" placeholder="Telephone" id="input-telephone" class="form-control">
                          </div>
          </div>
                  </fieldset>
        <fieldset id="address">
          <legend>Your Address</legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-address-1">Address</label>
            <div class="col-sm-10">
              <input type="text" name="address" value="" placeholder="Address 1" id="input-address-1" class="form-control">
                          </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-city">City & Country</label>
            <div class="col-sm-10">
              <input type="text" name="city" value="" placeholder="City" id="input-city" class="form-control">
                          </div>
          </div>     
                  </fieldset>
        <fieldset>
          <legend>Your Password</legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-password">Password</label>
            <div class="col-sm-10">
              <input type="password" name="password" value="" placeholder="Password" id="input-password" class="form-control">
                          </div>
          </div>
        </fieldset>
                        <div class="buttons">
          <div class="pull-right">
            <input type="submit" value="Continue" class="btn btn-primary">
          </div>
        </div>
              </form>
      </div>
    
</div>
    </div>
     <jsp:include page="footer.jsp"/>
</html>

