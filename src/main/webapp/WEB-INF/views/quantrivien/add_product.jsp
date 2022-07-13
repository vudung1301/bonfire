<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- import SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!Doctype HTML>
<html>
<head>
    <title></title>
     <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/add_product.css" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>


<body>
    
    <div id="mySidenav" class="sidenav">
    <p class="logo"><span>M</span>-SoftTech</p>
  <a href="${base}/admin" class="icon-a"><i class="fa fa-dashboard icons"></i> &nbsp;&nbsp;Dashboard</a>
  <a href="${base}/admin/product_list"class="icon-a"><i class="fa fa-users icons"></i> &nbsp;&nbsp;Product List</a>
  <a href="${base}/admin/add_product"class="icon-a"><i class="fa fa-list icons"></i> &nbsp;&nbsp;Add Product</a>
  <a href="${base}/admin/order"class="icon-a"><i class="fa fa-shopping-bag icons"></i> &nbsp;&nbsp;Orders</a>
  <a href="${base}/admin/account"class="icon-a"><i class="fa fa-user icons"></i> &nbsp;&nbsp;Accounts</a>
  <a href="#"class="icon-a"><i class="fa fa-list-alt icons"></i> &nbsp;&nbsp;Tasks</a>

</div>

<div id="main">

    <div class="head">
        <div class="col-div-6">
<span style="font-size:30px;cursor:pointer; color: white;" class="nav"  >&#9776; Add Product</span>
<span style="font-size:30px;cursor:pointer; color: white;" class="nav2"  >&#9776; Add Product</span>
</div>
    
    <div class="col-div-6">
</div>
    <div class="clearfix"></div>
   		 <div class="addproduct">
   		 <sf:form modelAttribute="product" action="${base}/admin/add_product" method="post" enctype="multipart/form-data">
   		 
   		 <sf:hidden path="id"/>
   		  <div class="name">
            <label for="category">Category (required)</label>
			<sf:select path="categories.id" class="form-control" id="category">
			<sf:options items="${categories}" itemValue="id" itemLabel="name" />	
			</sf:select>
        </div>
        <div class="name">
            <p>Name</p>
           
            <sf:input path="name" type="text" name="name" id="name" placeholder="name"/>
        </div>
        <%-- <div class="description">
            <p>Description</p>
            <sf:input path="description" type="text" name="description" id="description" />
        </div> --%>
        <div class="image">
            <p> choose Avatar</p>
             <input required type="file" name="productAvatar" id="productAvatar"/>
        </div> 
        <div class="image">
            <p> choose pictures</p>
             <input required type="file" name="productPictures" id="productPictures" multiple="multiple"/>
        </div> 
        <div class="price">
            <p>Price</p>
            <sf:input path="price" type="text" name="price" id="price" />
        </div>
        <div class="name">
            <p>short_description</p>
            <sf:input path="short_description" type="text" name="short_description" id="short_description" />
        </div>
        <div class="name">
            <p>detail_description</p>
            <sf:textarea id="summernote" path="detail_description" type="text" name="detail_description"  />
        </div>
        <div class="button">
            <button type="submit">ADD</button>
        </div>
        </sf:form>
    </div>
</div>
</div>


    <script>
    $('#summernote').summernote({
        placeholder: 'detail product',
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
  </script>
<!--  <script>
 
 
      $('#short_description').summernote({
        placeholder: '',
        tabsize: 2,
        height: 120,
        weight:200,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
      $('#detail_description').summernote({
          placeholder: '',
          tabsize: 2,
          height: 120,
          weight:200,
          toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video']],
            ['view', ['fullscreen', 'codeview', 'help']]
          ]
        });
 
    </script>
 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
