<%@include file="include/taglib.jsp"%>
<!doctype html>
<html class="no-js" lang="">


<head>
<%@include file="include/head.jsp"%>



</head>



<body>
	<%@include file="include/topnavigation.jsp"%>
	<%@include file="include/leftnavigation.jsp"%>
	<!-- main content -->
	<section class="main-content">

		<!-- content wrapper -->
		<div class="content-wrap" style="margin-top:20px;">

			<div class="row">
				<div class="col-lg-12">
					<section class="panel">
						<header class="panel-heading">Add ATMs</header>
						<div class="panel-body">
							<form:form
								action="${pageContext.request.contextPath}/adminAddAtm"
								commandName="atm" method="POST">

								<div class="form-group">
									<label for="exampleInputEmail1">Name</label> <input type="text"
										class="form-control" name="name" id="name"
										placeholder="Enter Name">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Geolocation</label> <input
										type="text" class="form-control" id="exampleInputPassword1"
										name="geolocation" placeholder="Enter Geolocation">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Bank</label> <select
										name="bank.idbank" class="form-control">
										<c:forEach var="bank" items="${banks}">
										<option value="<c:out value="${bank.idbank}" />"><c:out value="${bank.name}" /></option>
</c:forEach>

									</select>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Address</label> <input
										type="text" class="form-control" id="exampleInputPassword1"
										name="address" placeholder="Enter Address">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Company</label> <select
										name="company" class="form-control">
										
										<option>1Link</option>

									</select>
								</div>

								<button type="submit" class="btn btn-default">Submit</button>
							</form:form>
						</div>
					</section>
				</div>
		</div>
		<div class="row">
<div class="col-lg-12">
					<section class="panel">
						<header class="panel-heading">Banks</header>
						<div class="panel-body">

							<section class="panel no-b">

								<div class="panel-body">
									<div class="table-responsive">
										<table
											class="table table-striped table-bordered responsive no-m"
											data-sortable>
											<thead>
												<tr>
													<th>ID</th>
													<th>Name</th>
													<th>Geolocation</th>
													<th>Address</th>
													<th>Company</th>

												</tr>
											</thead>
											<tbody>
												<c:forEach var="atm" items="${atms}">
													<tr>
														<td><c:out value="${atm.idAtm}" /></td>
														<td><c:out value="${atm.name}" /></td>
														<td><c:out value="${atm.geolocation}" /></td>
														<td><c:out value="${atm.address}" /></td>
														<td><c:out value="${atm.company}" /></td>

													</tr>
												</c:forEach>


											</tbody>
										</table>
									</div>
								</div>
							</section>
						</div>
					</section>
				</div>

</div>

		</div>
		<!-- /content wrapper -->
		<a class="exit-offscreen"></a>
	</section>
	<!-- /main content -->

	<%@include file="include/footer.jsp"%>