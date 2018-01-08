<%@ taglib prefix="spring" uri= "http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>BeautiProduct</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body background="C:\Users\Desktop\pics\vidya.jpg">



<jsp:include page="header.jsp"></jsp:include>



<div class="container" >
 <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
   <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1" ></li>
    <li data-target="#myCarousel" data-slide-to="2" ></li>
   </ol>
 <div class="carousel-inner">
  <div class="item active">
    <img class="img-rounded"class="image-responsive center block" src="C:\Users\Test\Desktop\pics\vidya1.jpg"/>
  </div>
   <div class="item">
    <img class ="img-rounded"class="image-responsive center block"src="C:\Users\Test\Desktop\pics\vidya2.jpg"/>
  </div>
  <div class="item">
    <img class ="img-rounded"class="image-responsive center block" src="C:\Users\Test\Desktop\pics\vidya3.jpg"/>
   </div>
</div>
<a class="left carousel-control" href="#myCarousel"data-slide="prev">
<span class="glyphicon glyphicon-chevron-left"></span>
<span class="sr-only">Previous</span>
</a>

<a class="right carousel-control" href="#myCarousel"data-slide="next">
<span class="glyphicon glyphicon-chevron-right"></span>
<span class="sr-only">Next</span>
</a>
</div>
</div>
</body>
</html>


