
<!-- import JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- import SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<title>Form</title>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/form.css">

</head>
<body>
	<div class="form_admin">
		<div class="account">
			<span>Create Account</span>
		</div>
		<sf:form modelAttribute="user" action="${base}/createAccount" method="post">

		<div class="email">
			<span>Email</span>
			<div class="input_email	">
				<sf:input path="email" type="email" name="email" placeholder="Enter your email"/>
			</div>
		</div>
		<div class="email">
			<span>User Name</span>
			<div class="input_email">
				<sf:input path="username" type="text" name="username" placeholder="Enter your UserName"/>
			</div>
		</div>
		<div class="email">
			<span>Password</span>
			<div class="input_email	">
				<sf:input path="password" type="password" name="password" id="password" placeholder="Enter your password"/>
			</div>
		</div>
		<div class="email">
			<span>Full Name</span>
			<div class="input_email">
				<sf:input path="name" type="text" name="name" placeholder="Enter your FullName"/>
			</div>
		</div>
		<div class="email">
			<span>Address</span>
			<div class="input_email">
				<sf:input path="address" type="text" name="address" placeholder="Enter your Address"/>
			</div>
		</div>
		<div class="email">
			<span>Phone number</span>
			<div class="input_email">
				<sf:input path="phone_number" type="text" name="phone_number" placeholder="Enter your UserName"/>
			</div>
		</div>
		
		<div class="button">
			<button type="submit">Sign in</button>
		</div>
		</sf:form>
	</div>
</body>
<script>
function check() {
    if(document.getElementById('password').value ===
            document.getElementById('confirm_password').value) {
        document.getElementById('message').innerHTML = "match";
    } else {
        document.getElementById('message').innerHTML = "no match";
    }
}
</script>
</html>