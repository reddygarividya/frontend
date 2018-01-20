<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<head>
  <title>BeautiProduct</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">BeautiProduct</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="index">Home</a></li>
       <li><a href="contact"><i class="fa fa-adress-book" aria-hidden="true"></i></a>
            
  <ul class="nav navbar-nav navbar-right">
     
     <c:if test="${pageContext.request.userPrincipal.name==null}">
        <li><a href="${pageContext.request.contextPath}/goToregister"><span class="glyphicon glyphicon-user"></span> SignUp</a></li>
        <li><a href="${pageContext.request.contextPath}/goTologin"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </c:if>
        
        
        
        
        <c:if test="${pageContext.request.userPrincipal.name !=null}">

                <li><a>Welcome: ${pageContext.request.userPrincipal.name}</a></li>
              <li><a href="<c:url value="/j_spring_security_logout"/>">Logout</a></li>
       </c:if>
                 
        <c:if test="${pageContext.request.userPrincipal.name == 'shivanvithaam@gmail.com'}"> 
        
      <li><a href="${pageContext.request.contextPath}/admin/adding">Admin</a></li>
         
      
 <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="${pageContext.request.contextPath}/admin">Admin List<span class="caret"></span></a>
        <ul class="dropdown-menu">
        
       
       <li><a href="${pageContext.request.contextPath}/admin/productList">Product</a></li>
         
         
           
     
        <li><a href="${pageContext.request.contextPath}/admin/supplierList">Supplier</a></li>
      
    
        
        <li><a href="${pageContext.request.contextPath}/admin/categoryList">Category</a></li>
       
        
        
        </ul>
        </li>
      
        </c:if>  
           
    
   
             </ul>
						
						<li><a href="viewcart"> <span
								class="glyphicon glyphicon-shopping-cart">
									</span>
						</a></li>
						<li><a href="showinvoice"> Invoice</a></li>
					
        <i class="fa fa-cart-plus" aria-hidden="true"></i></a></li>
      </ul>
      <c:choose>
		<c:when test="${IfViewCartClicked}">
			<c:import url="/WEB-INF/views/cart.jsp"></c:import>
		</c:when>
	</c:choose>
      	
    <ul class="nav navbar-nav navbar-right">

						<li class="dropdown"><a href="index.html"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false"> <span
							class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
							Category <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<c:forEach items="${catList}" var="category">

								<li><a class="alink" href=" nav/<c:out value="${category.cid}" />"> <c:out value="${category.cname}" />
								</a></li>

							</c:forEach>
						</ul></li>
						
						
						
		<%--   <sec:authorize access="hasRole('ROLE_ADMIN') and hasRole('ROLE_USER')"> --%>  
					<%-- 	<li><a href="${pageContext.request.contextPath}/goTologin"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
						<li><a href="goToregister"> Register</a></li> --%>
					 
				 <%-- <sec:authorize access="hasRole('ROLE_ADMIN') and hasRole('ROLE_USER')">   
						 <li><a style="color: white"
							href="${pageContext.request.contextPath}/Home">Hello <b><sec:authentication
							property="principal.username" /></b></a></li>
  --%>
						<%-- <li><c:url value="/j_spring_security_logout" var="logoutUrl" />
							<a href="${logoutUrl}">Log Out</a><span
							class="glyphicon glyphicon-log-out"></span></li> --%>

					
		<%-- </sec:authorize> --%>
				</ul>

			</div>
		</div>
	</nav>
	<br>
	<br>
	<br>
		<br>
	<br>
	<br>
		<br>
	<br>
	<br>
		<div class="container">
		<c:forEach items="${ListProduct}" var="product">
		
		<div class="col-md-4">
		<!-- 
			<div class="col-xs-3 w3-animate-zoom">
		 -->		<div class="thumbnail">
					<td><img src="${pageContext.request.contextPath}/resources/${product.imagName}" height="50px" width="50px"></td>	 
				 <div class="caption">
                  <h4 class="pull-right">${product.price}</h4>
                  <h4><a href=  "#">${product.pname}</a></h4>
                  <p>${product.pdescription}.</p>
                								<form action="addToCart/${product.pid}">
										<input type="submit" value="Add to Cart" class="btn btn-primary" >

									</form>
						
					</div>
				</div>
			</div>
		</c:forEach>
	</div>





	

	<%-- <c:if test="${LoginPageClicked}">
		<jsp:include page="LoginPage.jsp"></jsp:include>
	</c:if> --%>

	<c:choose>
		<c:when test="${IfViewCartClicked}">
			<c:import url="/WEB-INF/views/Cart.jsp"></c:import>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${IfRegisterClicked}">
			<c:import url="/WEB-INF/views/RegistrationPage.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${Clickedshowproduct}">
			<c:import url="/WEB-INF/views/ListCategory.jsp"></c:import>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${Clickedcatproduct}">
			<c:import url="/WEB-INF/views/catproducts.jsp"></c:import>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${UserClickedshowproduct}">
			<c:import url="/WEB-INF/views/ListCategory.jsp"></c:import>
		</c:when>
	</c:choose>
	<script type="text/javascript">
	
$(function() {
 $('#test').delay(1000).fadeOut();
});
 </script>
	<!-- scripts -->
	<script src="resources/lib/jquery/jquery-1.10.2.js"></script>
	<script src="resources/lib/bootstrap-3.3.6/js/bootstrap.min.js"></script>
	<!-- <script src="resources/lib/bootstrap-3.3.6/js/bootstrap-auto-dismiss-alert.js"></script> -->
	<div class="container">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
 
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <div class="carousel-inner">
    <div class="item active">
      <img class="img-rounded" class="image-responsive center block" src="C:\Users\Test\Desktop\pics\vidya1.jpg" alt="image1"/>
    </div>

    <div class="item">
      <img class="img-rounded" class="image-responsive center block" src="C:\Users\Test\Desktop\pics\vidya2.jpg" alt="image2"/>
    </div>

    <div class="item">
      <img class="img-rounded" class="image-responsive center block" src="C:\Users\Test\Desktop\pics\vidya3.jpg" alt="image3"/>
    </div>
  </div>

  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
 
</body>
</html>