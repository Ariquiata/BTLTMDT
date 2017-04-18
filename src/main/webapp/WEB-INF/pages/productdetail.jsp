<%-- 
    Document   : productdetail
    Created on : Apr 4, 2017, 12:47:05 AM
    Author     : Saber
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail</title>
    </head>
    <jsp:include page="newheader.jsp" />
	<div class="container">	
            <ul class="breadcrumb">
        <li><a href="home"><i class="fa fa-home"></i></a></li>
             <li>${root}</li>
      </ul>
            <div class="product_title">           
                <h3>${p.name}</h3>
            </div>
            <div class="row"> 
                <div id="content" class="col-sm-9">                                     
                    <div class="row">                                                          
                        <div class="col-sm-6 product_left">                                                               
                            <div class="thumbnails">
                                <div>
                                    <a class="thumbnail " href="view?${p.id}">
                                        <img style="width: 500px;height:400px" src="<c:url value="resources/image/${p.imageUrl}.jpg"/>">                                   
                                    </a>
                                </div>
                            </div>                                                                                                                                                             
                        </div>                                                                                          
                        <div class="col-sm-6 product_center">                                                                              
                            <ul class="list-unstyled price_section">
                                <li>
                                <c:choose>                 
                                    <c:when test="${p.discount==0}">
                                        <span class="price_section_inner"> $${p.price}</span>                                                  
                                    </c:when>                  
                                        <c:otherwise>
                                            <span class="price_section_inner">$${p.getPriceAfterDiscount()}</span><span style="text-decoration: line-through;">$${p.price}</span>
                                        </c:otherwise>             
                                </c:choose>                                                                                                                
                                </li>                                                                                    
                            </ul>                                                                                              
                            <div class="rating rating_border">
                                <p>                                                                                            
                                    <c:choose>                 			                  
                                        <c:when test="${p.getTotalScore()==0}" >				  
                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>				  
                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>			  
                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>				  
                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>				  
                                            <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>			                  
                                        </c:when>                 
                                            <c:otherwise>                      
                                                <c:forEach var="i" begin="1" end="${p.getTotalScore()}" >				  
                                                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star fa-stack-2x"></i></span>                     
                                                </c:forEach>                  
                                            </c:otherwise>             
                                    </c:choose>
                                     <a class="review-count review_tag" href="">                                                                                                          
                                        ${p.getScore()} point/ ${p.rating.size()} times                                                                                                                                          
                                    </a> |                
 
                                    <a class="review-count review_tag" href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;">                                                                                                          
                                        ${p.review.size()} reviews                                                                                                                                            
                                    </a> |                                                                                                        
                                        <a class="write-review" href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;">                                                                                                          
                                            Write a review                                                                                                                                            
                                        </a>                                                                                                                   
                                </p>                                                                                                                
                            </div>                                                                                                               
                            <ul class="list-unstyled">
                                <c:forEach items="${p.att}" var="i">
                                <li style="text-transform: uppercase">                                                                                                                                        
                                    ${i.name}:                                                                                                                                            
                                    ${i.value}                                                                                                                                    
                                </li>
                                </c:forEach>
                            </ul>                                                                                                            
                            <div id="product">                                                                                                                                                                                                               
                                <div class="form-group qty">                                                                                                                                                                                                       
                                    <label class="control-label" for="input-quantity">                                                                                                                                                                                                                                   
                                        Quantily                                                                                                                                                                                                                                
                                    </label>                                                                                                                                                                                                                               
                                    <input type="number" name="quantity" value="1" id="input-quantity" class="form-control">                                                                                                                                                                                                                              
                                    <input type="hidden" name="id" value="${p.id}">                                                                                                                                                                                                                                
                                    <br>                                                                                                                                                                                                                              
                                    <div class="btn-group addcart_group">                                                                                                                                                                                                                                   
                                        <button type="button" id="j" data-loading-text="Loading..." class="btn btn-primary btn-lg button-cart">                                                                                                                                                                                                                                       
                                            Add to Cart                                                                                                                                                                                                                                    
                                        </button>                                                                                                                                                                                                 
                                    </div>                                                                                                                                                                                                                          
                                </div>                          
                            </div>                                                                                                              
                            <hr>                                                                                   
                        </div>                                                                                                                                        
                    </div>                                           
                </div>                                
                <div id="tabs_info" class="col-sm-12">                                 
                    <ul class="nav nav-tabs">                            
                        <li class="active">                        
                            <a href="#tab-description" data-toggle="tab">                              
                                Description                                                       
                            </a>                               
                        </li>                                           
                        <li>                                         
                            <a href="#tab-review" data-toggle="tab">                                             
                                Reviews (${p.review.size()})                                                                    
                            </a>                                      
                        </li>                            
                    </ul>                            
                    <div class="tab-content">                                  
                        <div class="tab-pane active" id="tab-description">${p.description}</div>                                                           
                        <div class="tab-pane" id="tab-review">                                         
                            <form class="form-horizontal" id="form-review" action="updateRandR" method="post">                                             
                                <div id="review">
                                    <c:choose>
                                        <c:when test="${p.review.size()==0}">
                                             <p>There are no reviews for this product.</p>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach items="${p.review}" var="i">
                                                <div style=" border: 1px solid #dddddd; box-shadow: rgba(0, 0, 0, 0.3) 7px 7px 7px; border-radius: 4px;padding: 5px;">
                                                    ${i.name}
                                                </div>
                                                <br>
                                            </c:forEach> 
                                        </c:otherwise>
                                    </c:choose>

                                </div>                                               
                                <h2>Write a review</h2>                                                      
                                <div class="form-group required">                                                                               
                                    <div class="col-sm-12">                                                                                  
                                        <label class="control-label" for="input-review">                                                                                       
                                            Your Review                                                                                    
                                        </label>                                                                                   
                                        <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>                                                                                                                                                                                                                                                   
                                    </div>                                                                           
                                </div>                                                                          
                                <div class="form-group required">                                                                               
                                    <div class="col-sm-12">                                                                                   
                                        <label class="control-label">                                                                                       
                                            Rating                                                                                    
                                        </label>                                                                                   
                                        &nbsp;&nbsp;&nbsp;                                                                                  
                                        Bad&nbsp;                                                                                       
                                        <input type="radio" name="rating" value="1"> &nbsp;                                                                                        
                                        <input type="radio" name="rating" value="2"> &nbsp;                                                                                        
                                        <input type="radio" name="rating" value="3"> &nbsp;                                                                                        
                                        <input type="radio" name="rating" value="4"> &nbsp;                                                                                        
                                        <input type="radio" name="rating" value="5"> &nbsp;                                                                            
                                        Good                                                                                
                                    </div>
                                    <input type="hidden" name="id" value="${p.id}">
                                </div>                                                                                                                                                      
                                <div class="buttons clearfix">                                                                                
                                    <div class="pull-right">                                                                                   
                                        <button type="submit" id="button-review" data-loading-text="Loading..." class="btn btn-primary">                                                                                        
                                            Continue                                                                                    
                                        </button>                                                                                
                                    </div>                                                                           
                                </div>                                                                                                                                              
                            </form>                                                                
                        </div>                                                                                                             
                    </div>                                          
                </div>                                                                                                                            
            </div>
                        <c:choose >
                            <c:when test = "${empty recommend}">
                                <div class="box-header">                                                    
                            <div class="row">                                              
                                <div class="col-sm-12 col-xs-12">                                                             
                                    <div class="section-title">                                                                 
                                        <h1 class="fp_carousel-title">${mes}</h1>                                                            
                                    </div>                                           
                                </div>

                                                        
                            </div>

                                                    
                        </div>
                            </c:when>
                            <c:otherwise>
                                <div class="box-header">                                                    
                            <div class="row">                                              
                                <div class="col-sm-12 col-xs-12">                                                             
                                    <div class="section-title">                                                                 
                                        <h1 class="fp_carousel-title">Customer bought this also bought</h1>                                                            
                                    </div>                                           
                                </div>

                                                        
                            </div>

                                                    
                        </div>
                        <div class="row">
                        <c:forEach  items="${recommend}" var ="i">
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
                            </c:otherwise>
                        </c:choose>
                        
	</div>
<script type="text/javascript">
                                                        <!--

                                                        $('.button-cart').on('click', function() {

                                                            $.ajax({

                                                                url: 'addToCart',

                                                                type: 'post',

                                                                data: $('#product input[type=\'number\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),

                                                                dataType: 'html',

                                                                beforeSend: function() {

                                                                    $('#button-cart').button('loading');

                                                                },

                                                                complete: function() {

                                                                    $('#button-cart').button('reset');

                                                                },

                                                                success: function(response) {

                                                                    $('.alert, .text-danger').remove();

                                                                    $('.form-group').removeClass('has-error');

                                                                    // Need to set timeout otherwise it wont update the total
                                                                    $('html, body').animate({ scrollTop: 0 }, 'slow');
                                                                    $('#cart').html(response);

                                                                },

                                                                error: function(xhr, ajaxOptions, thrownError) {

                                                                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);

                                                                }

                                                            });

                                                        });

                                                        //-->
                                                   
                                               </script>                        
    <jsp:include page="footer.jsp" />
</html>
