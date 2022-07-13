	<div class="header">
		<div class="container_header">
			<div class="logo">
				<img src="${base}/images/logo1.png"> <img
					src="${pageContext.servletContext.contextPath}/images/logo2.png">
				<div class="turn_light">
					<a href="">SO TURN THE LIGHT </a>
				</div>
			</div>
			<div class="menu_header">
				<ul>
					<li><a href="">WISH LIST(0)</a></li>
					<li><a href="">SHOPPING CART</a></li>
					<li><a href="${base}/cart/view">CHECKOUT<i class="fas fa-cart-plus"></i>
					<span id="iconShowTotalItemsInCart" >${totalItems }  </span>
					</a></li>
					<li><a href="${base }/login"><i class="fas fa-user-circle"></i>${userLogined.username}</a>
						<ul class="submenu">
							<li><a href="${base }/login">MY ACCOUNT</li>
							<li><a class="dropdown-item" href="${base }/logout">Logout</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>