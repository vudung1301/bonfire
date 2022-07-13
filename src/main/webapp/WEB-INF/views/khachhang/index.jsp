<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@ page contentType="text/html; charset=UTF-8" %>
<meta charset="utf-8">
<title>Tổng kết</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" type="text/css"/>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
	
	<!-- Paging -->
<link href="${base}/css/simplePagination.css" rel="stylesheet" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="${base }/js/subscribe.js"></script>
  <script type="text/javascript" src="${base}/js/customer_script.js"></script>
  <script src="${base}/js/jquery.simplePagination.js"></script>
  
</head>
<body>
<jsp:include page="/WEB-INF/views/khachhang/layout/header.jsp"></jsp:include>


	<div class="menu">
		<ul>
			<li><a href=""><i class="fas fa-home"></i>Desktops</a></li>
			<li><a href="">Laptop</a>
				<ul class="sub_menu">
					<li><a href="">Sony</a></li>
					<li><a href="">Apple</a></li>
					<li><a href="">SamSung</a></li>
					<li><a href="">Huawei</a></li>
				</ul></li>
			<li><a href="">Component</a></li>
			<li><a href="">Tablets</a>
				<ul class="sub_menu">
					<li><a href="">Sony</a></li>
					<li><a href="">Apple</a></li>
					<li><a href="">SamSung</a></li>
					<li><a href="">Huawei</a></li>
					<li><a href="">Xiaomi</a></li>
				</ul></li>
			<li><a href="">Software</a></li>
			<li><a href="">Phones</a></li>
			<li><a href="">Cameras</a></li>
			<li><a href="${base}/contact">Contact</a></li>
		</ul>
	</div>
<jsp:include page="/WEB-INF/views/khachhang/layout/navigation.jsp"></jsp:include>
	<div class="banner">
		<div class="shop">
			<a href="#" class="btn-default">shop now</a>
		</div>
		<div class="img">
			<img src="${pageContext.servletContext.contextPath}/images/banner.png" width="100%">
		</div>
	</div>
	<div class="featured">
		<div class="text_featured">
			<i>FEATURED</i>
		</div>
		<div class="ruler">
			<img src="${pageContext.servletContext.contextPath}/images/ruler.png">
		</div>
	</div>
	 <form class="form-inline" action="${base}/home" method="get">
		<div class="btnSearch">	
		<div class="d-flex flex-row justify-content-between mt-4">
			<div class="d-flex flex-row">
				<input type="hidden" id="page" name="page" class="form-control">
				<input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search" value="${searchModel.keyword }" style="margin-right: 5px;"> 
				<select class="form-control" name="categoryId" id="categoryId" style="margin-right: 5px;">
				<option value="0">All</option>
				<c:forEach items="${categories}" var="category">
									
				<option value="${category.id }">${category.name }</option>
				</c:forEach>
				</select>
				<button type="submit" id="btnSearch" name="btnSearch" value="Search"  class="btn btn-primary">Seach</button>
			</div>
		</div>
		</div>
		<div class="list_product">	
		<c:forEach items="${productsWithPaging.data}" var="product" varStatus="loop">
		<div class="product">
			<div class="img">
				<img src="${base }/upload/${product.avatar}" width="205" height="178">
			</div>
			<div class="title"><a href="${base }/product/details/${product.seo}">${product.name }</a></div>
			<div class="button">
				<div class="add">
					<button type="button" onclick="javascript:AddToCart('${base}', ${product.id}, 1);">Add to cart</button>
				</div>
				<div class="price">
					<i class="fas fa-dollar-sign"></i>${product.price }
				</div>
			</div>
		</div>
		</c:forEach>
		<!-- Paging -->
		<!-- Paging -->
		
		
	</div>
	<div class="row">
			<div class="col-12 d-flex justify-content-center">
				<div id="paging"></div>
			</div>
	</div>
	</form> 
	
	<div class="featured">
		<div class="text_featured">
			<i>BRANDS</i>
		</div>
		<div class="ruler">
			<img src="${pageContext.servletContext.contextPath}/images/ruler.png">
		</div>
	</div>
	<div class="brands">
		<div class="img">
			<img src="${pageContext.servletContext.contextPath}/images/brand.png">
		</div>
		<div class="right">
			<a href=""><i class="fas fa-chevron-right"></i></a>
		</div>
	</div>
	<div class="featured">
		<div class="text_featured">
			<i>LATEST</i>
		</div>
		<div class="ruler">
			<img src="${pageContext.servletContext.contextPath}/images/ruler.png">
		</div>
	</div>
	<div class="popular">
		<div class="product_popular">
			<img src="${pageContext.servletContext.contextPath}/images/1.jpg">
			<div class="title">
				<i>Red Special Product</i>
			</div>
			<div class="price_popular">
				<i class="fas fa-dollar-sign"></i>50
			</div>
			<div class="icon">
				<a><i class="fab fa-instagram"></i></a> <a><i
					class="far fa-heart"></i></a> <a><i class="fal fa-cart-plus"></i></a>
			</div>
		</div>
		<div class="product_popular">
			<img src="${pageContext.servletContext.contextPath}/images/2.jpg">
			<div class="title">
				<i>Red Special Product</i>
			</div>
			<div class="price_popular">
				<i class="fas fa-dollar-sign"></i>50
			</div>
			<div class="icon">
				<a><i class="fab fa-instagram"></i></a> <a><i
					class="far fa-heart"></i></a> <a><i class="fal fa-cart-plus"></i></a>
			</div>
		</div>
		<div class="product_popular">
			<img src="${pageContext.servletContext.contextPath}/images/3.jpg">
			<div class="title">
				<i>Red Special Product</i>
			</div>
			<div class="price_popular">
				<i class="fas fa-dollar-sign"></i>50
			</div>
			<div class="icon">
				<a><i class="fab fa-instagram"></i></a> <a><i
					class="far fa-heart"></i></a> <a><i class="fal fa-cart-plus"></i></a>
			</div>
		</div>
		<div class="product_popular">
			<img src="${pageContext.servletContext.contextPath}/images/4.jpg">
			<div class="title">
				<i>Red Special Product</i>
			</div>
			<div class="price_popular">
				<i class="fas fa-dollar-sign"></i>50
			</div>
			<div class="icon">
				<a><i class="fab fa-instagram"></i></a> <a><i
					class="far fa-heart"></i></a> <a><i class="fal fa-cart-plus"></i></a>
			</div>
		</div>
	</div>
	<div class="popular">
		<div class="product_popular">
			<img src="${pageContext.servletContext.contextPath}/images/5.jpg">
			<div class="title">
				<i>Red Special Product</i>
			</div>
			<div class="price_popular">
				<i class="fas fa-dollar-sign"></i>50
			</div>
			<div class="icon">
				<a><i class="fab fa-instagram"></i></a> <a><i
					class="far fa-heart"></i></a> <a><i class="fal fa-cart-plus"></i></a>
			</div>
		</div>
		<div class="product_popular">
			<img src="${pageContext.servletContext.contextPath}/images/6.jpg">
			<div class="title">
				<i>Red Special Product</i>
			</div>
			<div class="price_popular">
				<i class="fas fa-dollar-sign"></i>50
			</div>
			<div class="icon">
				<a><i class="fab fa-instagram"></i></a> <a><i
					class="far fa-heart"></i></a> <a><i class="fal fa-cart-plus"></i></a>
			</div>
		</div>
		<div class="product_popular">
			<img src="${pageContext.servletContext.contextPath}/images/7.jpg">
			<div class="title">
				<i>Red Special Product</i>
			</div>
			<div class="price_popular">
				<i class="fas fa-dollar-sign"></i>50
			</div>
			<div class="icon">
				<a><i class="fab fa-instagram"></i></a> <a><i
					class="far fa-heart"></i></a> <a><i class="fal fa-cart-plus"></i></a>
			</div>
		</div>
		<div class="product_popular">
			<img src="${pageContext.servletContext.contextPath}/images/8.jpg">
			<div class="title">
				<i>Red Special Product</i>
			</div>
			<div class="price_popular">
				<i class="fas fa-dollar-sign"></i>50
			</div>
			<div class="icon">
				<a><i class="fab fa-instagram"></i></a> <a><i
					class="far fa-heart"></i></a> <a><i class="fal fa-cart-plus"></i></a>
			</div>
		</div>
	</div>
	<div class="number">
		<div class="page">
			<a href=""><</a> <a href="">1</a> <a href="">2</a> <a href="">3</a> <a
				href="">4</a> <a href="">5</a> <a href="">></a>
		</div>
	</div>
	<div class="footer">
		<div class="contact">
			<div class="sub-contact">
				<h3>INFORMATION</h3>
				<ul>
					<li><a href="">The brand</a></li>
					<li><a href="">Local stories</a></li>
					<li><a href="">Custumer service</a></li>
					<li><a href="">Privacy & cookie</a></li>
					<li><a href="">Site Map</a></li>
				</ul>
			</div>
			<div class="sub-contact">
				<h3>WHY BY FROM US</h3>
				<ul>
					<li><a href="">The brand</a></li>
					<li><a href="">Local stories</a></li>
					<li><a href="">Custumer service</a></li>
					<li><a href="">Privacy & cookie</a></li>
					<li><a href="">Site Map</a></li>
				</ul>
			</div>
			<div class="sub-contact">
				<h3>YOUR ACCOUNT</h3>
				<ul>
					<li><a href="">The brand</a></li>
					<li><a href="">Local stories</a></li>
					<li><a href="">Custumer service</a></li>
					<li><a href="">Privacy & cookie</a></li>
					<li><a href="">Site Map</a></li>
					<li><a href="">Update information</a></li>
				</ul>
			</div>
			<div class="sub-contact">
				<h3>LOOKBOOK</h3>
				<ul>
					<li><a href="">The brand</a></li>
					<li><a href="">Local stories</a></li>
					<li><a href="">Custumer service</a></li>
					<li><a href="">Privacy & cookie</a></li>
					<li><a href="">Site Map</a></li>
					<li><a href="">Update information</a></li>
				</ul>
			</div>
			<div class="sub-contact">
				<h3>CONTACT-DETAILS</h3>
				<span>Head office. Aven fashion<br> 180-182 Regent
					Strees London<br> <br> TelePhone +12312356<br>
					Email:Evem@gmail.com
				</span>
			</div>
			<form action="${base}/subscribe" method="post">
			<div class="sub-contact">
                	<h3>SUBSCRIBE</h3>
                	<input type="text" name="subscribe" id="subscribe" placeholder="Email">
                	<button type="button" onclick="subscribe'${base}');">Subcribe</button>
                	<div class="alert alert-primary" role="alert" id="TB_AJAX"></div>
             </div>
             </form>
		</div>
		
		<div class="follow">
			<div class="title">
				<span>Follow Us</span>
			</div>
			<div class="icon">
				<a href=""><i class="fab fa-instagram"></i></a> <a href=""><i
					class="fab fa-facebook-f"></i></a> <a href=""><i
					class="fab fa-twitter"></i></a> <a href=""><i
					class="fab fa-snapchat-ghost"></i></a>
			</div>
		</div>
	</div>	
	
	<script type="text/javascript">
			function DeleteProduct(productId) {
				
			}
		
			$( document ).ready(function() {
				$("#categoryId").val(${searchModel.categoryId});
				$("#paging").pagination({
					currentPage: ${productsWithPaging.currentPage},
			        items: ${productsWithPaging.totalItems},
			        itemsOnPage: 8,
			        cssStyle: 'dark-theme',
			        onPageClick: function(pageNumber, event) {
			        	$('#page').val(pageNumber);
			        	$('#btnSearch').trigger('click');
					},
			    });
			});
		</script>
</body>
</html>