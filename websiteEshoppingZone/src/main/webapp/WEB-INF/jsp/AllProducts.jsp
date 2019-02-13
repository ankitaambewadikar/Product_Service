<%@  page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core" %>
    <%-- <%@ page import="com.mongodb.Mongo" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
</head>
<body>

	<table class="table table-bordered" >
		<th> ProductId </th>
		<th> Product Type </th>
		<th> Product Name </th>
		<th> Category </th>
		<th> Ratings </th>
		<th> Review </th> 
		<th> Images </th>
		<th> Price </th>
		<th> Description </th>
		<th> Specification </th>
		
		<jstl:if test="${product!=null }" >
			<tr>
				<td>${product.productId}</td>
				<td>${product.productType}</td>
				<td>${product.productName }</td>
				<td>${product.category}</td>
				 <td>
                    <table>
                        <jstl:forEach var="rating" items="${product.rating}">
                            <tr style="font-style: italic;">
                                <td>${rating.key}</td>
                                <td>${rating.value}</td>
                            </tr>
                        </jstl:forEach>   
                    </table>   
                </td>
                <td>
                    <table>
                        <jstl:forEach var="review" items="${product.review}">
                            <tr style="font-style: italic;">
                                <td>${review.key}</td>
                                <td>${review.value}</td>
                            </tr>
                        </jstl:forEach>   
                    </table>
                </td>
                <td>
                <jstl:forEach var="image" items="${product.image}">
                	<img class="img-responsive" src=${image} width="100" height="145"/>
                </jstl:forEach>
                </td>
				<%-- <td>${product.image}</td> --%>
				<td>${product.price}</td>
				<td>${product.description}</td>
				<td>
                    <table>
                        <jstl:forEach var="specification" items="${product.specification}">
                            <tr style="font-style: italic;">
                                <td>${specification.key}</td>
                                <td>${specification.value}</td>
                            </tr>
                        </jstl:forEach> 
                       </table>
                 </td> 
				</tr>
		</jstl:if>	
		<%-- <jstl:forEach items="${productList}" var="productList">
			<tr>
				<td>${productList.productId}</td>
				<td>${productList.productName }</td>
				<td>${productList.category}</td>
				<td>${productList.price}</td>
				<td>${productList.description}</td>
			</tr>
		</jstl:forEach> --%>
		<jstl:forEach var="productList" items="${productList}">
            <tr>
                <td>${productList.productId}</td>
                <td>${productList.productType}</td>
                <td>${productList.productName}</td>
                <td>${productList.category}</td>
                <td>
                    <table>
                        <jstl:forEach var="rating" items="${productList.rating}">
                            <tr style="font-style: italic;">
                                <td>${rating.key}</td>
                                <td>${rating.value}</td>
                            </tr>
                        </jstl:forEach>   
                    </table>   
                </td>
                <td>
                    <table>
                        <jstl:forEach var="review" items="${productList.review}">
                            <tr style="font-style: italic;">
                                <td>${review.key}</td>
                                <td>${review.value}</td>
                            </tr>
                        </jstl:forEach>   
                    </table>
                </td>
                <%-- <td>${productsList.image}</td> --%>
                <td>
                <jstl:forEach var="image" items="${productList.image}">
                	<img class="img-responsive" src=${image} width="100" height="145"/>
                </jstl:forEach>
                </td>
                <td>${productList.price}</td>
                <td>${productList.description}</td>
                <td>
                    <table>
                        <jstl:forEach var="specification" items="${productList.specification}">
                            <tr style="font-style: italic;">
                                <td>${specification.key}</td>
                                <td>${specification.value}</td>
                            </tr>
                        </jstl:forEach> 
                       </table>
                 </td> 
            </jstl:forEach>   
	</table>
</body>
</html>