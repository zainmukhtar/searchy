<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>


<!doctype html>
<html class="signin no-js" lang="">


<!-- Mirrored from sublime.nyasha.me/admin/signin.html by HTTrack Website Copier/3.x [XR&CO'2014], Wed, 27 Aug 2014 07:21:31 GMT -->
<head>
<!-- meta -->
<meta charset="utf-8">
<meta name="description"
	content="Flat, Clean, Responsive, application admin template built with bootstrap 3">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
<!-- /meta -->

<title>Searchy</title>

<!-- page level plugin styles -->
<!-- /page level plugin styles -->

<!-- core styles -->
<link rel="stylesheet" href="jsp/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="jsp/css/font-awesome.css">
<link rel="stylesheet" href="jsp/css/themify-icons.css">
<link rel="stylesheet" href="jsp/css/animate.min.css">
<!-- /core styles -->

<!-- template styles -->
<link rel="stylesheet" href="jsp/css/skins/palette.css">
<link rel="stylesheet" href="jsp/css/fonts/font.css">
<link rel="stylesheet" href="jsp/css/main.css">
<!-- template styles -->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- load modernizer -->
<script src="jsp/plugins/modernizr.js"></script>
</head>

<body class="bg-primary">

	<div class="cover" style="background-image: url(jsp/img/cover3.jpg)"></div>

	<div class="overlay bg-primary"></div>

	<div class="center-wrapper">
		<div class="center-content">


			<div class="row">
				<div align="center" style="margin-bottom: 45px;">

					<img alt="logo"
						src="<%=request.getContextPath()%>/jsp/img/mainlogo.png"
						style="width: 20%;" />
				</div>
				<div
					class="col-xs-10 col-xs-offset-1 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
					<section class="panel bg-white no-b">
						<ul class="switcher-dash-action">
							<li class="active"><a href="#" class="selected">Sign in</a></li>
							<li><a href="<%= request.getContextPath() %>/signUp" class="">New account</a></li>
						</ul>
						<div class="p15">
							<form role="form" name='loginForm'
								action="<c:url value='/j_spring_security_check' />"
								method="POST">
								<input type="text" class="form-control input-lg mb25"
									placeholder="Username" name="username" autofocus> <input
									type="password" class="form-control input-lg mb25"
									name="password" placeholder="Password">
								<div class="show">
									<div class="pull-right">
										<a href="forgot.html">Forgot password?</a>
									</div>
									<label class="checkbox"> <input type="checkbox"
										value="remember-me">Remember me
									</label>
								</div>

								<button class="btn btn-primary btn-lg btn-block" type="submit">Sign
									in</button>

								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form>
						</div>
					</section>
					<p class="text-center">
						Copyright &copy; <span id="year" class="mr5"></span> <span>Techno Genes</span>
					</p>
				</div>
			</div>

		</div>
	</div>

</body>



</html>
