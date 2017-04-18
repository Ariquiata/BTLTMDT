<%-- 
    Document   : search
    Created on : Apr 10, 2017, 1:46:34 AM
    Author     : Saber
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tlds/customTag.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    </head>
    <body>
        <jsp:include page="newheader.jsp"/>
        <div class="container">
        <ul class="breadcrumb">
        <li><a href="home"><i class="fa fa-home"></i></a></li>
             <li>${root}</li>
      </ul>
        <div class="row">
    <div id="content" class="col-sm-12">
      <h2>Search - ${search}</h2>
      <label class="control-label" for="input-search">Search For Pets</label>
      <div class="row">
        <div class="col-sm-4">
            <input type="text" name="search" value="${search}" placeholder="Keywords" id="input-search" class="form-control" required>
        </div>
        <div class="col-sm-3">
          <select name="category_id" class="form-control">
            <option value="0">All Categories</option>
            <c:forEach items="${category}" var="i">
               <option value="${i.id}">${i.name}</option> 
            </c:forEach>
          </select>
          
        </div>
        <div class="col-sm-3">
          <select name="age_filter" class="form-control">
            <option value="0">All Age</option>
            <option value="1">Under 2 Month</option>
            <option value="2">2-5 Month</option>
            <option value="3">Older</option>
          </select>
          
        </div>
      </div>
      <p>
        <label class="checkbox-inline">
          <input type="checkbox" name="description" value="1" id="description">       
          Search in descriptions</label>
      </p>
      <input type="button" value="Search" id="button-search" class="btn btn-primary">
      <h2>Pets meeting the search </h2>
      <c:choose>
          <c:when test="${!empty note}" >
              <span style="margin: auto;font-size: 30px">NO RESULT</span>
          </c:when>
          <c:otherwise>
      <div class="row category_filter">
		<div class="pagination-right">
        <div class="text-left limit_inner">
          <label class="control-label" for="input-sort">Sort By:</label>
        </div>
        <div class="col-md-3 text-left limit_inner sort">
          <select id="input-sort" class="form-control" onchange="location = this.value;" >
            <option value="${url}" selected="selected">Default</option>
            <option value="${url}&sort=nameASC">Name (A - Z)</option>
            <option value="${url}&sort=nameDESC">Name (Z - A)</option>
            <option value="${url}&sort=priceASC">Price (Low &gt; High)</option>
            <option value="${url}&sort=priceDESC">Price (High &gt; Low)</option>
        <option value="${url}&sort=ratingDown">Rating (Highest)</option>     
            <option value="${url}&sort=ratingUp">Rating (Lowest)</option>
          </select>
        </div>
       </div>
      </div>
      <br>
      <div class="row">
        <c:forEach  items="${searchResult}" var ="i">
            <c:set value="${i.id}" var="id"/>
                        <div class="product-layout product-list product-category product-item col-xs-12">
          <div class="product-thumb">
            <div class="image product-image"><a href="view?id=${i.id}">
                    <img src="<c:url value="resources/image/${i.imageUrl}.jpg" />" alt="${i.name}" title="Ras Neque Metus" class="img-responsive" style="width: 170px; height:228px;"></a>
			</div>
            <div class="caption">
              <h4><a href="view?id=${i.id}">${i.name}</a></h4>
              <p class="desc">${i.description}</p>
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
                            <div class="addtolinks_list">
				<div class="button-group">
                <button type="button" onclick="cart.add('${id}','1');" class="" data-toggle="tooltip" title="" data-original-title="Add to Cart" aria-describedby="tooltip285929"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md" style="color:#252526;">Add to Cart</span></button>
              </div>
			  </div>
          </div>

        </div>                  
                        </c:forEach>
      </div>
      <div class="row">
          <div class="col-sm-6 text-left">
              <c:if test="${maxPage!=1}">
                          <tag:paginate maxPage="${maxPage}" currentPage="${currentPage}" pageStart="${firstPage}" 
                      pageEnd="${lastPage}" steps="${steps}" uri="${uri}"></tag:paginate>
              </c:if>
          </div>
        <div class="col-sm-6 text-right">Showing ${(currentPage-1)*steps+1} to ${(currentPage-1)*steps+searchResult.size()} of ${resultCount} (${maxPage} Pages)</div>
      </div>
          </c:otherwise>
      </c:choose>
      </div>
    </div>
        </div>
<script type="text/javascript">
$('#button-search').bind('click', function() {
	url = 'search';
	var search = $('#content input[name=\'search\']').prop('value');

		url += '?search=' + encodeURIComponent(search);
	
	var category_id = $('#content select[name=\'category_id\']').prop('value');
	if (category_id > 0) {
		url += '&categoryId=' + encodeURIComponent(category_id);
	}
	var age_filter = $('#content select[name=\'age_filter\']').prop('value');
	if (age_filter>0) {
		url += '&ageFilter='+encodeURIComponent(age_filter);
	}
	var filter_description = $('#content input[name=\'description\']:checked').prop('value');
	if (filter_description) {
		url += '&description=true';
	}
	location = url;
});
$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});



</script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
