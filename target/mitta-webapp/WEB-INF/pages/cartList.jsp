<%-- 
    Document   : cartList
    Created on : Apr 11, 2017, 12:22:20 AM
    Author     : Saber
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shoping Cart</title>
    </head>
    <body>
        <jsp:include page="newheader.jsp"/>
        <div class="container">
        <ul class="breadcrumb">
        <li><a href="home"><i class="fa fa-home"></i></a></li>
             <li>${root}</li>
      </ul>
      <div class="row"> <div id="content" class="col-sm-12"> 
              <h1>Shopping Cart</h1>
       <c:set var="itemList" scope="session" value="${Cart.c}"/>
       <c:choose>
           <c:when test="${empty itemList}">
      <p>Your shopping cart is empty!</p>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="home" class="btn btn-primary">Continue</a></div>
      </div>
           </c:when>
           <c:otherwise>
                <form action="edit" method="post">
        <div class="table-responsive">
          <table class="table table-bordered">
            <thead>
              <tr>
                <td class="text-center">Image</td>
                <td class="text-left">Pet Name</td>
                <td class="text-left">Description</td>
                <td class="text-left">Quantity</td>
                <td class="text-right">Unit Price</td>
                <td class="text-right">Total</td>
              </tr>
            </thead>
            <tbody>
                <c:forEach items="${itemList}" var ="i" varStatus="loop">
                            <tr>
                <td class="text-center">
                    <a href="view?id=${i.p.id}"><img style="height:57px;width: 57px; " src="<c:url value="resources/image/${i.p.imageUrl}.jpg" />" alt="..." class="img-thumbnail"></a>
                  </td>
                <td class="text-left"><a href="view?id=${i.p.id}">${i.p.name}</a>                                                         </td>
                <td class="text-left">${i.p.description}</td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="quanlity[${loop.index}]" value="${i.n}" size="1" class="form-control">
                    <span class="input-group-btn">
                    <button type="submit" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Update"><i class="fa fa-refresh"></i></button>
                    <button type="submit" data-toggle="tooltip" title="" class="btn btn-danger" onclick="cart.remove('${loop.index}');" data-original-title="Remove"><i class="fa fa-times-circle"></i></button>
                    </span></div></td>
                <td class="text-right">$${i.p.getPriceAfterDiscount()}</td>
                <td class="text-right">$${i.getPrice()}</td>
              </tr>
                </c:forEach>
                                        </tbody>
          </table>
        </div>
      </form>
            <br>
      <div class="row">
        <div class="col-sm-4 col-sm-offset-8">
          <table class="table table-bordered">
                        <tbody> 
                        <tr>
              <td class="text-right"><strong>Total:</strong></td>
              <td class="text-right">$${Cart.getTotalPrice()}</td>
            </tr>
                      </tbody></table>
        </div>
      </div>
      <div class="buttons clearfix">
        <div class="pull-left"><a href="home" class="btn btn-default">Continue Shopping</a></div>
        <div class="pull-right"><a href="checkout" class="btn btn-primary">Checkout</a></div>
      </div>
           </c:otherwise>
       </c:choose>
          </div>
      </div>
        </div>
       <jsp:include page="footer.jsp"/>
    </body>
</html>
