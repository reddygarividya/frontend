<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CartPage</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style = "background : url(http://s1.picswalls.com/wallpapers/2016/06/06/eiffel-tower-desktop-background_094749463_307.jpg); background-size:100% ;">
<div class="bs-example">
    <nav id="myNavbar" class="navbar navbar-inverse" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="container">
            <div class="navbar-header">
              <!--   <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> -->
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                
                <a class="navbar-brand" href="#"></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="http://localhost:9999/FrontEcom/"><span
							class="glyphicon glyphicon-home" aria-hidden="true"></span> HOME</a></li>
                    
                </ul>
                 </div>
    </nav>
</div>


<div class="container">
    <div class="row">
          <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Total</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                     <c:forEach items="${CartList}" var="cart">
                    
                    <tr>
                
                     
                        <td class="col-sm-8 col-md-6">
                        <div class="thumbnail">
                         <a class="thumbnail pull-left" href="">
                        <img alt="${cart.productid}" 
                        src="${pageContext.request.contextPath}/resources/${cart.imagName}" height="50px" width="50px"></a>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="#">${cart.productName}</a></h4>
                                <h5 class="media-heading"> by <a href="#">Brand name</a></h5>
                                <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                        <form action="editCart/${cart.cartid}">
                        <input type="text" class="form-control" id="exampleInputEmail1" name="quantity" value="${cart.productQuantity }" >
                        
                        </form>
                        </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${cart.productPrice}</strong></td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${cart.subTotal}</strong></td>
                        <td class="col-sm-1 col-md-1">
                        <a href="removeCart/${cart.cartid }" type="button" class="btn btn-danger">
                          <span class="glyphicon glyphicon-remove"></span> Remove
                        </a>
                        
                        </td>
                          </tr>
                          
                    </c:forEach>   
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Estimated shipping</h5></td>
                        <td class="text-right"><h5><strong>50/-</strong></h5></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3><strong>${CartPrice}</strong></h3></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <a href="continue_shopping" class="btn btn-default">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                       </a>
                        
                        </td>
                        <td>
                        <a href="checkout" class="btn btn-success">
                             <span class="glyphicon glyphicon-play"></span> Checkout
                        </a></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>


</body>

</html>
