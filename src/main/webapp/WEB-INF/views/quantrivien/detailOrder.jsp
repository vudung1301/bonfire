<!-- SPRING FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <%@ page contentType="text/html; charset=UTF-8" %>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
  	     <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/admin.css" type="text/css"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>product list</title>
        
        <!-- Favicon-->
        <!-- <link rel="icon" type="image/x-icon" href="assets/favicon.ico" /> -->
		
		<!-- COMMON -->
		<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>
		
        <!-- Core theme CSS (includes Bootstrap)-->
        <jsp:include page="/WEB-INF/views/quantrivien/layout/css.jsp"></jsp:include>
        
    </head>
    <body>
    
         <div class="d-flex" id="wrapper">
        
      	<div id="mySidenav" class="sidenav">
	<p class="logo"><span>M</span>-SoftTech</p>
  <a href="${base}/admin" class="icon-a"><i class="fa fa-dashboard icons"></i> &nbsp;&nbsp;Dashboard</a>
	<a href="${base}/admin/product_list"class="icon-a"><i class="fa fa-users icons"></i> &nbsp;&nbsp;Product List</a>
   <a href="${base}/admin/add_product"class="icon-a"><i class="fa fa-list icons"></i> &nbsp;&nbsp;Add Product</a>
  <a href="${base}/admin/order"class="icon-a"><i class="fa fa-shopping-bag icons"></i> &nbsp;&nbsp;Orders</a>
  <a href="${base}/admin/account"class="icon-a"><i class="fa fa-user icons"></i> &nbsp;&nbsp;Accounts</a>
  <a href="#"class="icon-a"><i class="fa fa-list-alt icons"></i> &nbsp;&nbsp;Tasks</a>

</div>
<div id="main" style="height: auto;width: 100%;">

<div class="head">
	<div class="col-div-6">
	<span style="font-size:30px;cursor:pointer; color: white;" class="nav"  >&#9776; Orders</span>
	<span style="font-size:30px;cursor:pointer; color: white;" class="nav2"  >&#9776; Orders</span>
	</div>
		
	<div class="col-div-6">
		</div>
		<div class="clearfix"></div>
</div>
	<br/>
                
                <!-- Page content-->
                <div class="container-fluid">
                    
                    <form class="form-inline" action="${base }/admin/order" method="get">
						<div class="d-flex flex-row justify-content-between mt-4">
							<div class="d-flex flex-row">
								<input type="hidden" id="page" name="page" class="form-control">
								<input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search" value="${searchModel.keyword }" style="margin-right: 5px;"> 
								<button type="submit" id="btnSearch" name="btnSearch" value="Search"  class="btn btn-primary">Seach</button>
							</div>
						</div>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">Code</th>
									<th scope="col">Tên Khách hàng</th>
									<th scope="col">Địa chỉ</th>
									<th scope="col">Số Điện thoại</th>
									<th scope="col">Tổng Tiền </th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ordersWithPaging.data}" var="order" varStatus="loop">
									<tr>
										<th scope="row">${loop.index + 1}</th>
										<td><a href="${base}/admin/saleorder"class="icon-a">${order.code }</a></td>
										<td>${order.customer_name } </td>
										<td>${order.customer_address }</td>
										<td>${order.customer_phone }</td>
										<td>${order.total }</td>
										<td>
											<button class="btn btn-danger" role="button">Delete</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- Paging -->
						<div class="row">
							<div class="col-12 d-flex justify-content-center">
								<div id="paging"></div>
							</div>
						</div>
					</form>
                    
                </div>
            </div>
        </div>
        
		<!-- JS -->
		<jsp:include page="/WEB-INF/views/quantrivien/layout/js.jsp"></jsp:include>
		
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
		
		<script>

  $(".nav").click(function(){
    $("#mySidenav").css('width','70px');
    $("#main").css('margin-left','70px');
    $(".logo").css('visibility', 'hidden');
    $(".logo span").css('visibility', 'visible');
     $(".logo span").css('margin-left', '-10px');
     $(".icon-a").css('visibility', 'hidden');
     $(".icons").css('visibility', 'visible');
     $(".icons").css('margin-left', '-8px');
      $(".nav").css('display','none');
      $(".nav2").css('display','block');
  });

$(".nav2").click(function(){
    $("#mySidenav").css('width','300px');
    $("#main").css('margin-left','300px');
    $(".logo").css('visibility', 'visible');
     $(".icon-a").css('visibility', 'visible');
     $(".icons").css('visibility', 'visible');
     $(".nav").css('display','block');
      $(".nav2").css('display','none');
 });
 </script>
		
    </body>
</html>
