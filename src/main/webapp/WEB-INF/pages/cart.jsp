<%-- 
    Document   : cart
    Created on : Apr 8, 2017, 6:04:50 PM
    Author     : Saber
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<button type="button" data-toggle="dropdown" data-loading-text="Loading..." class="btn btn-inverse btn-block btn-lg dropdown-toggle"><i class="fa fa-shopping-cart"></i> 
    <span id="cart-total" class="hidden-xs">
        <c:choose>
            <c:when test="${empty Cart}">
        0 item(s) - $0.00
            </c:when>
            <c:otherwise>
                ${Cart.getTotalItem()} items(s) - $${Cart.getTotalPrice()}
            </c:otherwise>
        </c:choose>
    </span>
</button>
  <ul class="dropdown-menu pull-right">
      <c:choose>
          <c:when test="${Cart.c.size()==0 || empty Cart}">
          <li><p class="text-center">Your shopping cart is empty!</p></li>
          </c:when>
        <c:otherwise>
        <li>
            <table class="table table-striped">
            <tbody>
                <c:set var="itemList" scope="session" value="${Cart.c}"/>
                <c:forEach items="${itemList}" var="i" varStatus="loop">
            <tr>
          <td class="text-center">
              <a href="view?id=${i.p.id}"><img style="height:47px;width: 47px; " src="<c:url value="resources/image/${i.p.imageUrl}.jpg" />" alt="${i.p.imageUrl}" class="img-thumbnail"></a>
            </td>
          <td class="text-left">
              <a href="view?id=${i.p.id}">${i.p.name}</a>
          </td>
          <td class="text-right">x ${i.n}</td>
          <td class="text-right">$${i.getPrice()}</td>
          <td class="text-center"><button type="button" onclick="cart.remove('${loop.index}');" title="Remove" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
         </c:forEach>
             </tbody>
            </table>
        </li>
        <li>
      <div>
        <table class="table table-bordered">
                    <tbody>
                    <tr>
            <td class="text-right"><strong>Total</strong></td>
            <td class="text-right">$${Cart.getTotalPrice()}</td>
          </tr>
                  </tbody></table>
        <p class="text-right"><a href="viewCart"><strong><i class="fa fa-shopping-cart"></i> View Cart</strong></a>&nbsp;&nbsp;&nbsp;<a href="checkout"><strong><i class="fa fa-share"></i> Checkout</strong></a></p>
      </div>
    </li>
        </c:otherwise>
      </c:choose>
 </ul>
