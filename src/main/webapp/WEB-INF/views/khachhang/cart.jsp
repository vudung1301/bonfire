<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<%@ page contentType="text/html; charset=UTF-8" %>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/images/style.css" type="text/css"/>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<title></title>

  <script type="text/javascript" src="${base}/js/customer_script.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!-- CSS -->
<jsp:include page="/WEB-INF/views/khachhang/layout/css.jsp"></jsp:include>

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

	<!-- Section-->
	<section class="py-5">
		<div class="cartSection">

			<!-- Shopping cart table -->
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th scope="col" class="border-0 bg-light">
								<div class="p-2 px-3 text-uppercase">Product</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Price</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Quantity</div>
							</th>
							<th scope="col" class="border-0 bg-light">
								<div class="py-2 text-uppercase">Remove</div>
							</th>
						</tr>
					</thead>
					<tbody>
						
						<c:forEach items="${cart.cartItems }" var="ci">
							<tr>
								<th scope="row" class="border-0">
									<div class="p-2">
										<img
											src="${base }/upload/${product.avatar}"
											alt="" width="70" class="img-fluid rounded shadow-sm">
										<div class="ml-3 d-inline-block align-middle">
											<h5 class="mb-0">
												<a href="#" class="text-dark d-inline-block align-middle">
													${ci.productName }
												</a>
											</h5>
											<span
												class="text-muted font-weight-normal font-italic d-block">Category:
												Watches</span>
										</div>
									</div>
								</th>
								<td class="border-0 align-middle">
									<strong>${ci.priceUnit }</strong>
								</td>
								<td class="border-0 align-middle">
								<button onclick="DecreaseQuanlityCart('${base }', ${ci.productId})" value="-">-</button>
								<strong><span id="quanlity_${ci.productId}">${ci.quanlity }</span></strong>
								<button onclick="UpdateQuanlityCart('${base }', ${ci.productId})" value="+">+</button>
								</td>
								<td class="border-0 align-middle"><a href="#"
									class="text-dark"><i class="fa fa-trash"></i></a></td>
							</tr>
						</c:forEach>
						
					</tbody>
				</table>
			</div>
			<!-- End -->

			<form action="${base }/cart/checkout" method="post">
			
				<div class="row py-5 p-4 bg-white rounded shadow-sm">
					<div class="col-lg-6">
						<!-- <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">
						Coupon code</div>
						<div class="p-4">
							<p class="font-italic mb-4">If you have a coupon code, please
								enter it in the box below</p>
							<div class="input-group mb-4 border rounded-pill p-2">
								<input type="text" placeholder="Apply coupon"
									aria-describedby="button-addon3" class="form-control border-0">
								<div class="input-group-append border-0">
									<button id="button-addon3" type="button"
										class="btn btn-dark px-4 rounded-pill">
										<i class="fa fa-gift mr-2"></i>Apply coupon
									</button>
								</div>
							</div>
						</div> -->
						<div
							class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Customer
							Info</div>
						<div class="p-4">
							<div class="form-group">
								<label for="customerPhone">Customer full name</label>
								<input type="tel" class="form-control" id="customerFullName" name="customerFullName" placeholder="Full name" value="${userLogined.username }">
							</div>
							<div class="form-group">
								<label for="customerEmail">Email address</label>
								<input type="email" class="form-control" id="customerEmail" name="customerEmail" placeholder="Enter email"  value="${userLogined.email }">
								<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="customerPhone">Phone</label>
								<input type="tel" class="form-control" id="customerPhone" name="customerPhone" placeholder="Phone"  value="${userLogined.phone_number }">
							</div>
							<div class="form-group">
								<label for="customerAddress">Address</label>
								<input type="text" class="form-control" id="customerAddress" name="customerAddress" placeholder="Address"  value="${userLogined.address }">
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div
							class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Order
							summary</div>
						<div class="p-4">
							<p class="font-italic mb-4">Shipping and additional costs are
								calculated based on values you have entered.</p>
							<ul class="list-unstyled mb-4">
								<li class="d-flex justify-content-between py-3 border-bottom"><strong
									class="text-muted">Order Subtotal </strong><strong>${cart.totalPrice }</strong></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong
									class="text-muted">Shipping and handling</strong><strong>$0.00</strong></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong
									class="text-muted">Tax</strong><strong>$0.00</strong></li>
								<li class="d-flex justify-content-between py-3 border-bottom"><strong
									class="text-muted">Total</strong>
									<h5 class="font-weight-bold">${cart.totalPrice }</h5></li>
							</ul>
							<button type="submit" class="btn btn-dark rounded-pill py-2 btn-block">Procceed to checkout</button>
						</div>
					</div>
				</div>

			</form>

		</div>

	</section>

	<!-- Footer-->
	<%-- <jsp:include page="/WEB-INF/views/khachhang/layout/footer.jsp"></jsp:include> --%>

	<!-- JS -->
	<jsp:include page="/WEB-INF/views/khachhang/layout/js.jsp"></jsp:include>

</body>
</html>
