<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- import SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>
<head>
	<%@ page contentType="text/html; charset=UTF-8" %>
<meta charset="utf-8">
	<title>Form</title>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/form.css">
	 <script src="${base }/js/customer_script.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="form_admin">
		<div class="account">
			<span>ConTact</span>
		</div>
		<div class="sign_in">
			<span>Already have an account?</span><a href="">Sign in</a>
			
		</div>
		<c:if test="${not empty TB }">
			<div class="alert alert-primary" role="alert">
			
				${TB }
			</div>
    	</c:if>
		
		
	<!-- Dạng1 -->		
	<%-- 	<form action="${base}/contact" method="post">
			<div class="email">
			<span>Email</span>
			<div class="input_email">
				<input type="text" name="email" placeholder="Enter your account">
			</div>
		</div>
		<div class="email">
			<span>password</span>
			<div class="input_email	">
				<input type="password" name="password" placeholder="Enter your password">
			</div>
		</div>
		<div class="button">
			<button type="submit">Sign in</button>
		</div>
		</form> --%>
		
		<!-- Dạng 2 StringForm -->
	 	<sf:form modelAttribute="contact" action="${base}/contact" method="post">
			<div class="email">
			<span>Mesagge</span>
			<div class="input_email">
				<sf:input path="email" type="text" name="email" id="email" placeholder="text here..." style="height: 200px; width: 280px;"/>
			</div>
		</div>
		<%-- <div class="email">
			<span>password</span>
			<div class="input_email	">
				<sf:input path="password" type="password" name="password" id="password" placeholder="Enter your password"/>
			</div>
		</div> --%>
		<div class="button">
			<button type="submit">Sign in</button>
		</div>
		<div class="sign_up">
			<div class="create_account">
				<a href="">CreateAccount</a>
			</div>
			<div class="forgot_password">
				<a href="">ForgotPassword</a>
			</div>
		</div>
		</sf:form>
		
		<!-- Dang 3 ajax -->
		
		<%-- <form action="${base}/contact" method="post">
			<div class="email">
			<span>Email</span>
			<div class="input_email">
				<input type="text" name="email" id="email" placeholder="Enter your account">
			</div>
		</div>
		<div class="email">
			<span>password</span>
			<div class="input_email	">
				<input type="password" name="password" id="password" placeholder="Enter your password">
			</div>
		</div>
		<div class="button">
			<button type="button" onclick="contact('${base}');">Sign in</button>
		</div>
		
		
		<div class="sign_up">
			<div class="create_account">
				<a href="">CreateAccount</a>
			</div>
			<div class="forgot_password">
				<a href="">ForgotPassword</a>
			</div>
		</div>
		<div class="alert alert-primary" role="alert" id="TB_AJAX"></div>
		</form>  --%>
	</div>
</body>
</html>