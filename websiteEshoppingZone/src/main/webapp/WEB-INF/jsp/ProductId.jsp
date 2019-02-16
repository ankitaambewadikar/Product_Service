<%@ page isELIgnored="false" language="java"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">


<!-- jQuery library -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<!-- Popper JS -->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>


<!-- Latest compiled JavaScript -->

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>


</head>
<style type="text/css">
th, td {
	padding: 1px;
	background-color: lightblue;
	border-collapse: separate;
	border-spacing: 2px;
	border-collapse: separate;
}
</style>

<body>


	<div id="fullContainer">
		<div class="col-xs-6 col-md-6 col-lg-5 mLeft0">
			<!-- for the status update -->
			<div class="col-xs-12 col-md-12 col-lg-12 " id="products">
				<div>
					<!-- <h4>Product Details</h4> -->

				</div>
			</div>

		</div>
	</div>

	</div>


	<style>
@
-webkit-keyframes placeHolderShimmer { 0% {
	background-position: -468px 0
}

100%
{
background-position
















































:
















































468
px
























 
























0
}
}
@
keyframes placeHolderShimmer { 0% {
	background-position: -468px 0
}

100%
{
background-position
















































:
















































468
px
























 
























0
}
}
.timeline-item {
	background: scrollbar;
	border: 1px solid;
	border-color: #e5e6e9 #dfe0e4 #d0d1d5;
	border-radius: 3px;
	padding: 12px;
	margin: 0 auto;
	max-width: 60%;
	min-height: 200px;
}

.borderless table {
	border-top-style: none;
	border-left-style: none;
	border-right-style: none;
	border-bottom-style: none;
}

.column {
	float: left;
	width: 50%;
	padding: 10px;
	/* height: 300px; */
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

.product-section{
background-color: lightblue;

}
</style>

	<jstl:if test="${product!=null }">
		<div class="container" id="product-section">
			<div class="row">
				<div class="col-md-6">
					<p>
						<b>ProductName</b>: ${product.productName}
					</p>
					<p>
						<b>Product Category</b>: ${product.category}
					</p>
					<div class="row">
						<div class="column">
							<p>
								<jstl:forEach var="image" items="${product.image}">
									<img class="img-rounded" src=${image } width="200" height="145" />
								</jstl:forEach>
							</p>
						</div>
						<div class="column">
							<p>
								<b>Price:</b>: ${product.price}
							</p>

						</div>

					</div>


					<div class="row" id="ratingColumn">
						<div class="column">
							<p>
								<b>Ratings</b>
							</p>
							<table class="table borderless">
								<jstl:forEach var="rating" items="${product.rating}">
									<tr style="font-style: italic;">
										<td>${rating.key}</td>
										<td>${rating.value}</td>
									</tr>
								</jstl:forEach>
							</table>

						</div>
						<div class="column">
							<p>
								<b>Reviews</b>
							</p>
							<table class="table borderless">
								<jstl:forEach var="review" items="${product.review}">
									<tr style="font-style: italic;">
										<td>${review.key}</td>
										<td>${review.value}</td>
									</tr>
								</jstl:forEach>
							</table>

						</div>


					</div>
					<p>
						<b>Description:</b>: ${product.description}
					</p>

				</div>
				<div class="col-md-6">


					<p>
						<b>Specifications:</b>
					<table class="table borderless">
						<jstl:forEach var="specification" items="${product.specification}">
							<tr style="font-style: italic;">
								<td>${specification.key}</td>
								<td>${specification.value}</td>
							</tr>
						</jstl:forEach>
					</table>
					</p>


					<hr>






				</div>
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->

	</jstl:if>
</body>
</html>
