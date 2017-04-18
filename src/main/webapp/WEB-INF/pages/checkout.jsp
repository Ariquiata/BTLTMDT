<%-- 
    Document   : checkout
    Created on : Apr 12, 2017, 11:43:23 PM
    Author     : Saber
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Out</title>
    </head>
    <body>
        <jsp:include page="newheader.jsp"/>
        <div class ="container">
            <ul class="breadcrumb">
        <li><a href="home"><i class="fa fa-home"></i></a></li>
             <li>${root}</li>
      </ul>
        <div class="panel-body"><div class="table-responsive">
  <table class="table table-bordered table-hover">
    <thead>
      <tr>
        <td class="text-left">Pet Name</td>
        <td class="text-right">Quantity</td>
        <td class="text-right">Unit Price</td>
        <td class="text-right">Total</td>
      </tr>
    </thead>
    <tbody>
        <c:set var="itemList" scope="session" value="${Cart.c}"/>
        <c:forEach items="${itemList}" var ="i" varStatus="loop">
            <tr>
                <td class="text-left"><a href="view?id=${i.p.id}">${i.p.name}</a>
                    </td>
        <td class="text-right">${i.n}</td>
        <td class="text-right">$${i.p.getPriceAfterDiscount()}</td>
        <td class="text-right">$${i.getPrice()}</td>
      </tr>
      </c:forEach>
                </tbody>
    <tfoot>
            <tr>
        <td colspan="4" class="text-right"><strong>Total:</strong></td>
        <td class="text-right">${Cart.getTotalPrice()}</td>
      </tr>
       
          </tfoot>
  </table>
</div>
<div class="buttons">
  <div class="pull-right">
    <a href="confirm" class="btn btn-primary">Confirm Order</a>
  </div>
</div>
        </div>
<
</div>
    </body>
</html>
