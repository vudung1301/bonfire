<!DOCTYPE html>
<html>
<head>
	<%@ page contentType="text/html; charset=UTF-8" %>
	<meta charset="utf-8">
	<title>Product_details</title>
	<link rel="stylesheet" type="text/css" href="${base}/css/productDetail.css">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
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
	<div class="product">
		<div class="img">
			<img src="${base }/upload/${product.avatar}" width="563px" height="638px">
		
		</div>
		<div class="details">
			<h2> ${product.name}</h2>
			<div class="evaluate">
				<span>4.9/5 <i class="fas fa-star"></i><a href="">(xem 20 đánh giá)</a></span>
			</div>
			<div class="price">
				<div class="hai">
					<h3> ${product.price } </h3>
				</div>
				<div class="ba">
					<strike>300.000đ</strike>
				</div>
				<div class="bon">
					<p>-33%</p>
				</div>
			</div>
			<div class="color">
				<span>Màu sắc:</span>
					<input type="submit" class="Gray" value="Gray">
			</div>
			<div class="size">
				<span>Dung Lượng:</span>
				<div class="choose_size">
					<input type="submit" value="64GB">
					<input type="submit" value="128GB">
					<input type="submit" value="256GB">
				</div>
			</div>
			<div class="add_cart">
				<button type="button" onclick="javascript:AddToCart('${base}', ${product.id}, 1);">Thêm vào giỏ hàng <i class="fas fa-cart-plus"></i></button>
			</div>
			<div class="characteristics">
				<div class="most_characteristics">
					Đặc điểm sản phẩm
				</div>
				<div class="feature_characteristics">
					<ul>
						<li><i class="far fa-check-square"></i> ${product.short_description}</li>
						<li> ${product.detail_description}</li>
					</ul>
				</div>
			</div>
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
                    <span>Head office. Aven fashion<br>
                    180-182 Regent Strees London<br>
                    <br>
                    TelePhone +12312356<br>
                    Email:Evem@gmail.com 
                    </span>
                </div>
            </div>
           <div class="follow">
           		<div class="title">
					<span>Follow Us</span>
				</div>
				<div class="icon">
					<a href=""><i class="fab fa-instagram"></i></a>
					<a href=""><i class="fab fa-facebook-f"></i></a>
					<a href=""><i class="fab fa-twitter"></i></a>
					<a href=""><i class="fab fa-snapchat-ghost"></i></a>
				</div>
           </div>
	</div>


</body>
</html>