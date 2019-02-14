<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
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
<form action="updatedb">
<table class="table table-bordered">
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
				<td><input name="productId" value=${product.productId} readonly="readonly" /></td>
				<td><input name="productType" value=${product.productType} readonly="readonly" /></td>
				<td><input name="productName" value=${product.productName} readonly= "readonly" /></td>
				<td><input name= "category" value=${product.category} readonly="readonly" /></td>
				 <td>
                    <table>
                       <%--  <jstl:forEach var="rating" items="${product.rating}"> --%>
                            <tr style="font-style: italic;">
                                <td><input type="number" name="ratingKey" min="1" max="5"/></td>
                                <td><input type="number" name="ratingValue" min="0" /></td>
                            </tr>
                       <%--  </jstl:forEach>   --%> 
                    </table>   
                </td>
                <td>
                    <table>
                        <jstl:forEach var="review" items="${product.review}">
                            <tr style="font-style: italic;">
                                <td><input type="number" name="reviewKey" value=${review.key}  min="1" max="5" /></td>
                                <td><input  name="reviewValue" value=${review.value} /></td>
                            </tr>
                        </jstl:forEach>   
                    </table>
                </td>
                 <td>
                <jstl:forEach var="image" items="${product.image}">
                	<img class="img-responsive" src=${image} width="100" height="145"/>
                </jstl:forEach>
                </td>
				<td><input name="price" value=${product.price} /></td>
				<td><input name="description" value=${product.description} readonly="readonly"/></td>
				<td>
                    <table>
                        <jstl:forEach var="specification" items="${product.specification}">
                            <tr style="font-style: italic;">
                                <td><input name="specification" value=${specification.key} readonly="readonly" /></td>
                                <td><input name="specification" value=${specification.value} readonly="readonly" /></td>
                            </tr>
                        </jstl:forEach> 
                       </table>
                 </td>
				</tr>
		</jstl:if>	
		
	</table>
	<input type="submit" value="Update">
	<input type="reset" value="Reset">
	</form>
</body>
</html>