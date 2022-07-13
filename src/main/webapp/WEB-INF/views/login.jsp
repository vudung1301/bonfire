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
			<span>Login</span>
		</div>
		<form method="POST" action="${base }/perform_login" class="form-signin">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					
					<!-- kiểm tra xem đã login thành công hay không, bằng cách kiểm tra biến login_error -->
					<c:if test="${not empty param.login_error}">
						<div class="sign_in" role="alert">
							Login attempt was not successful, try again!!!
						</div>
					</c:if>
		<div class="sign_in">
			<span>Already have an account?</span><a href="">Sign in</a>
		</div>
		<div class="email">
			<span>User Name</span>
			<div class="input_email">
				<input type="text" name="username" placeholder="Enter your UserName">
			</div>
		</div>
		<div class="email">
			<span>Password</span>
			<div class="input_email	">
				<input type="password" name="password" placeholder="Enter your password">
			</div>
		</div>
		
		<div class="button">
			<button type="submit">Sign in</button>
		</div>
		<div class="sign_up">
			<div class="create_account">
				<a href="${base}/createAccount">CreateAccount</a>
			</div>
			<div class="forgot_password">
				<a href="">ForgotPassword</a>
			</div>

		</div>
		</form>
	</div>
</body>
</html>