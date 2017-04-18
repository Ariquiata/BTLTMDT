<%-- 
    Document   : content
    Created on : Mar 20, 2017, 8:11:00 PM
    Author     : Saber
--%>
<%@page import="tmdt.web.entity.product"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="/resources/core/main_3.css" />" rel="stylesheet">
<div class="container">
    <div class="section_title">
	<h1 class="fp_carousel-title">Our Pets</h1>
</div>  
        <div class="row">
            <div>
                <h5 style="font-family: 'Montserrat', sans-serif;font-size: 20px">ON SALES</h5>
            </div>
        </div>
                    <div class="row">
                        <c:forEach  items="${productList}" var ="i">
                        <div class="product-layout product-grid product-category product-item col-lg-3 col-md-3 col-sm-6 col-xs-6">
          <div class="product-thumb">
            <div class="image product-image"><a href="view?id=${i.id}">
                    <img src="<c:url value="resources/image/${i.imageUrl}.jpg" />" alt="${i.name}" title="Ras Neque Metus" class="img-responsive" style="width: 170px; height:228px;"></a>
			 <div class="action">
					<div class="action_inner">
			  				<div class="button-group">
           	<button type="button" onclick="cart.add('${i.id}','1');" class="cart_button" data-toggle="tooltip" title="" data-original-title="Add to Cart" aria-describedby="tooltip418027"><span class=""><i class="fa fa-shopping-cart"></i></span></button>
								</div>
					</div>			
			  </div>
			</div>
            <div class="caption">
              <h4><a href="view?id=${i.id}">${i.name}</a></h4>
              <c:choose>
                  <c:when test="${i.discount==0}">
                  <p class="price">
                $${i.price}
              </p>
                  </c:when>
                  <c:otherwise>
              <p class="price">
                  <span class="price-new">$${i.getPriceAfterDiscount()}</span>
                
                <span class="price-old">$${i.price}</span>
              </p>
                  </c:otherwise>
              </c:choose>
              <div class="rating">
              <c:choose>
                  			 
                  <c:when test="${i.getTotalScore()==0}" >

				  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
				  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
				  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
				  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
				  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
				
                  </c:when>
                  <c:otherwise>
                      <c:forEach var="i" begin="1" end="${i.getTotalScore()}" >
				  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star fa-stack-2x"></i></span>

                      </c:forEach>
                  </c:otherwise>
              </c:choose>
                                  </div>
            </div>
          </div>
        </div>                  
                        </c:forEach>
                    </div>
                </div>

                       
                

