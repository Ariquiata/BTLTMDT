<%-- 
    Document   : success
    Created on : Apr 12, 2017, 11:57:00 PM
    Author     : Saber
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="newheader.jsp"/>
        <div class="container">
            <ul class="breadcrumb">
        <li><a href="home"><i class="fa fa-home"></i></a></li>
             <li>${root}</li>
      </ul>
      <div class="row">                <div id="content" class="col-sm-12">      <h2>Your order has been placed!</h2>
      <p>Your order has been successfully processed!</p><p>You can view your order history by going to the <a href="http://multipurposethemes.com/opencartdemo/oc009/index.php?route=account/account">my account</a> page and by clicking on <a href="http://multipurposethemes.com/opencartdemo/oc009/index.php?route=account/order">history</a>.</p><p>If your purchase has an associated download, you can go to the account <a href="http://multipurposethemes.com/opencartdemo/oc009/index.php?route=account/download">downloads</a> page to view them.</p><p>Please direct any questions you have to the <a href="http://multipurposethemes.com/opencartdemo/oc009/index.php?route=information/contact">store owner</a>.</p><p>Thanks for shopping with us online!</p>      <div class="buttons">
        <div class="pull-right"><a href="home" class="btn btn-primary">Continue</a></div>
      </div>
      </div>
    </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
